## Contributing

### Commit message guidelines

This project adopts [semantic versioning](https://semver.org/) using the
[python-semantic-release package](https://python-semantic-release.readthedocs.io/en/latest/#) in
conjunction with [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/). This
approach
requires all commit messages to follow a standardized format, utilizing a set of predefined prefixes
to clearly indicate the type of change made. To ensure adherence to this convention, collaborators
are encouraged to make use of the
following [commit message hook](https://git-scm.com/book/ms/v2/Customizing-Git-Git-Hooks),
which validates commit messages against the conventional commits specification:

```bash
#!/bin/bash

MSG=$(cat "$1")

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
```
