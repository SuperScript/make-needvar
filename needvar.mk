MAKE_TYPE != test -n "$(MAKEFILE_LIST)" && echo gnu || echo bsd
#_# needvar.X: Check whether $(X) is nonempty
include needvar.$(MAKE_TYPE).mk
