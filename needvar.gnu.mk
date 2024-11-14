#_# For GNU make, any var can be checked
.PHONY: needvar.%
needvar.%:
	@test -n '$($*)' && exit 0 || { echo 'variable not defined: $*'; exit 1; }
