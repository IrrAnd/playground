#!/bin/bash

# This script catches commit messages that do not comply to the conventional
# commit style (https://www.conventionalcommits.org/en/v1.0.0/). It is called
# with one argument, the name of the file that contains the commit message.
# When placed in .git/hooks/commit-msg, it will act as a hook script to
# check the commit log message when calling "git commit".

MSG=$(cat "$1")

# ALLOWED_TYPES="build|chore|ci|docs|feat|fix|perf|style|refactor|test"
# Uncomment the below to read the allowed types from the project's pyproject.toml.
ROOT_DIR=$(git rev-parse --show-toplevel)
ALLOWED_TYPES=$(grep -w allowed_types "$ROOT_DIR"/pyproject.toml | sed -r 's/.*\[(.*)\].*/\1/' | tr -d ' "' | tr ',' '|')

PATTERN="^($ALLOWED_TYPES)(\(.*\))?: (.*)"
if ! [[ $MSG =~ $PATTERN ]]; then
  echo >&2 "Invalid commit message format. Please use the conventional commit style
  <type>: <description>
or
  <type>(<scope>): <description>
where type is one of: ${ALLOWED_TYPES//|/, }."
  exit 1
fi
