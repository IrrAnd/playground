# Contributing

## Git hooks

This project uses [Git hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) to maintain
code quality, style consistency, and adherence to the [commit message guidelines](#Commit-message-guidelines).
So before contributing, please install the hooks via
```bash
   make git-hooks
```
to ensure compliance and avoid build failures.

## Commit message guidelines

This project uses [semantic versioning](https://semver.org/) with
the [python-semantic-release package](https://python-semantic-release.readthedocs.io/en/latest)
in conjunction with [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/). Commit
messages must therefore adhere to a standardized format, using predefined prefixes to indicate the
type of change.
