# Test Makefile for make-needvar
# This Makefile is used by the test suite to verify needvar functionality

needvars = a b c

include ../mk/needvar.mk

# Test target: variable a must be defined
foo: needvar.a
	@echo "this is foo, now with $(a)"

# Test target: variable b must be defined
test-b: needvar.b
	@echo "test-b passed with $(b)"

# Test target: variable c must be defined
test-c: needvar.c
	@echo "test-c passed with $(c)"

# Test target: multiple variables must be defined
test-multi: needvar.a needvar.b
	@echo "test-multi passed with $(a) and $(b)"
