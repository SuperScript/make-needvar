#_# For BSD make, set needvars to the list of vars that can be checked
.for v in $(needvars)
needvar.$(v): .PHONY
	@test -n '$$($(v))' && exit 0 || exit 1
.endfor
