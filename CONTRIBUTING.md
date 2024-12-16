# Contributing

## Commit message guidelines

This project uses [semantic versioning](https://semver.org/) with
the [python-semantic-release package](https://python-semantic-release.readthedocs.io/en/latest)
in conjunction with [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/). Commit
messages must therefore adhere to a standardized format, using predefined prefixes to indicate the
type of change. The `scripts/ensure_conventional_commit_style.sh` script validates commit messages
against the conventional commits specification. Collaborators are encouraged to install this script
as a [Git commit message hook](https://git-scm.com/book/ms/v2/Customizing-Git-Git-Hooks) to ensure
compliance and avoid build failures.
