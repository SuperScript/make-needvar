.PHONY: tests

#_# tests
#_#   Run test suite and diff with expected results
#_#
tests:
	rm -f tests/output
	tests/run > tests/output
	diff tests/output tests/expected
