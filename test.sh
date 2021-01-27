#!/bin/bash
set -eo pipefail

ERRORS=()

err () {
  echo -e "[\033[1;31mFAILED\033[0m] $*" >&2
}

if [[ "$(type shellcheck >/dev/null 2>&1; echo $?)" -eq 1 ]]; then
  err "missing shellcheck command"
  exit 1
fi

# find all executables and run `shellcheck`
for f in $(git ls-files --exclude='*.sh' --exclude="*.bash" --exclude="git/cmd/*" --ignored | sort -u); do
	if file "$f" | grep --quiet shell; then
		{
			shellcheck "$f" && echo -e "[\033[1;33mOK\033[0m]: successfully linted $f"
		} || {
			# add to errors
			ERRORS+=("$f")
		}
	fi
done

if [ ${#ERRORS[@]} -eq 0 ]; then
	echo -e "[\033[36mDONE\033[0m]: No errors, hooray"
else
	err "These files failed shellcheck ${ERRORS[*]}"
	exit 1
fi