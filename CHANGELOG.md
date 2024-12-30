# CHANGELOG


## v0.1.0 (2024-12-30)

### Build System

- Add pytest as development dependency
  ([`89bace7`](https://github.com/IrrAnd/playground/commit/89bace7e3303595bcdd83d3153640b3432327da2))

Using [uv](https://docs.astral.sh/uv/concepts/projects/dependencies/), this can be done via `uv add
  --dev "pytest==7.0.*"`.

- Add uv configuration to pyproject.toml
  ([`5126417`](https://github.com/IrrAnd/playground/commit/51264177910dce4f1837d135c8514f63a1c33a39))

Placing the [cache directory within the project
  folder](https://docs.astral.sh/uv/reference/settings/#cache-dir) prevents performance degradation
  that can occur when the cache and target directories are located on separate filesystems.

### Features

- **dependencies**: Add numpy to project dependencies
  ([`7a7355b`](https://github.com/IrrAnd/playground/commit/7a7355b5ba3a38543035fd6ddfbdf908fdbef59f))


## v0.0.0 (2024-12-28)

### Documentation

- Add commit message guidelines
  ([`761b7d3`](https://github.com/IrrAnd/playground/commit/761b7d31232ff2079fd026a8d190ac09b3c09886))
