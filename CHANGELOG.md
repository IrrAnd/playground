# CHANGELOG


## v0.1.0 (2025-01-01)

### Bug Fixes

- **deps**: Update dependency numpy to >=1.1,<=2.2.1
  ([`c7db107`](https://github.com/IrrAnd/playground/commit/c7db1073a91a36018081d0608852fadac3051cae))

### Build System

- Add pytest as development dependency
  ([`1ddc7fa`](https://github.com/IrrAnd/playground/commit/1ddc7fa1c1d2ea38ac98a6ef3a3dd4748d4697f5))

Using [uv](https://docs.astral.sh/uv/concepts/projects/dependencies/), this can be done via `uv add
  --dev "pytest==7.0.*"`.

- Add uv configuration to pyproject.toml
  ([`febeae8`](https://github.com/IrrAnd/playground/commit/febeae84fdffe9e658fdac8995f63e3ebfc1501d))

Placing the [cache directory within the project
  folder](https://docs.astral.sh/uv/reference/settings/#cache-dir) prevents performance degradation
  that can occur when the cache and target directories are located on separate filesystems.

### Documentation

- Add commit message guidelines
  ([`761b7d3`](https://github.com/IrrAnd/playground/commit/761b7d31232ff2079fd026a8d190ac09b3c09886))

### Features

- **dependencies**: Add numpy to project dependencies
  ([`13b1775`](https://github.com/IrrAnd/playground/commit/13b1775b452bbaeeec560c48b902e6fe25639a73))
