#_# needvar.X: Check whether $(X) is nonempty
#_#   For BSD make:
#_#     set needvars to the list of allowed vars before this file loads
#_#
_NEEDVAR_TYPE != test -n '$(MAKEFILE_LIST)' && echo '$(dir $(lastword $(MAKEFILE_LIST)))needvar.gnu.mk' || echo 'needvar.bsd.mk'
include $(_NEEDVAR_TYPE)
