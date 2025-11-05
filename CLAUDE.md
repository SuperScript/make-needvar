# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

make-needvar is a portable Makefile utility for checking whether variables are defined and non-empty. It works with both GNU Make and BSD Make through runtime detection and conditional includes.

## Architecture

The project uses a three-file architecture for cross-platform compatibility (in the `mk/` directory):

1. **mk/needvar.mk** - Entry point that detects make flavor at runtime
   - Uses `$(MAKEFILE_LIST)` test to distinguish GNU Make from BSD Make
   - GNU Make: includes `needvar.gnu.mk` using relative path via `$(dir $(lastword $(MAKEFILE_LIST)))`
   - BSD Make: includes `needvar.bsd.mk` from same directory

2. **mk/needvar.gnu.mk** - GNU Make implementation
   - Uses pattern rule (`needvar.%`) with automatic variable `$*`
   - Any variable can be checked without pre-declaration

3. **mk/needvar.bsd.mk** - BSD Make implementation
   - Uses `.for` loop to generate targets from `$(needvars)` list
   - Requires users to declare checkable variables in `needvars` before including mk/needvar.mk

## Usage Pattern

Users include `mk/needvar.mk` in their Makefile and declare prerequisites:
```makefile
include mk/needvar.mk
needvars = a b c  # Only needed for BSD Make

mytarget: needvar.a
    # Target body runs only if $(a) is non-empty
```

## Testing

Run the test suite:
```bash
make tests
```

The test suite (`tests/` directory) includes 6 portable test cases that work identically on both GNU Make and BSD Make. Output is sanitized to remove implementation-specific error messages. Tests cover successful and failed variable checks for single and multiple variables.

Manual testing with the included Makefile:
```bash
# Test with GNU Make
make foo a="hello"          # Should succeed
make foo                    # Should fail with "variable not defined: a"

# Test with BSD Make (if available)
bmake foo a="hello"         # Should succeed
bmake bar d="hello"         # Should fail (d not in needvars list)
```

## Key Implementation Details

- Error messages go to stderr (exit status 1)
- The runtime detection uses shell assignment (`!=`) which works in both make flavors
- BSD Make requires variables in `needvars` to be expanded at include-time via `.for` loop
- GNU Make can dynamically match any variable name via pattern rules

## Context History

See `CONTEXT.md` for session-by-session highlights of work progression. This file captures programming context in "Previously on..." style for quick resumption of work.
