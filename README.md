# make-needvar

A can test whether a variable holds a non-empty value in the current process. With GNU make, any variable can be checked. With BSD make, you must set the `needvars` variable to the list of variables that can be checked. and elegant way to test whether a variable is defined in your make run. Works with both GNU Make and BSD Make.

## Overview

With make-needvar you can test whether a variable holds a non-empty value in the current `make` process. This is done with a target

## Usage

Include `needvar.mk` at the top level in your project.
```makefile
include needvar.mk
```
For BSD make, define the variables you want to check:
```makefile
needvars = foo bar baz
```

Check that a variable is set to a non-empty value in a target:
```makefile
mytarget: needvar.X
    ...
```

That's it!

## Features

- Works with both GNU Make and BSD Make
- Simple implementation
- Easy to integrate into existing projects

## Installation

1. Copy these files to your project:
   - needvar.mk
   - needvar.gnu.mk
   - needvar.bsd.mk

2. Add this line before to your Makefile:
```makefile
include needvar.mk
```

That's it! Now running `make` will show help for all documented targets.

## Example

The included example Makefile demonstrates the features:

```makefile
needvars = a b c
foo: needvar.a
    echo "this is foo, now with $(a)"
```

## Public Domain

This project is released into the public domain. Feel free to use it however you like!

## Contributing

Feel free to open issues or submit pull requests on GitHub.

