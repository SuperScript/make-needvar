needvars = a b c

include needvar.mk

#_# foo: show that needvar.a works if a is nonempty
foo: needvar.a
	echo "this is foo, now with $(a)"

#_# foo: show that needvar.d fails for BSD, succeeds for GNU if d is nonempty
bar: needvar.d
	echo "this is bar, now with $(d)"
