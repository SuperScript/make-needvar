#_# For GNU make, any var can be checked
.PHONY: FORCE
needvar.%: FORCE
	@test -n "$($(*))" && exit 0 || exit 1

