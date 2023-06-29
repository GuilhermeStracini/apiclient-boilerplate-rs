# Package Name API

The [Project API](https://apibr.com) client wrapper is written in Rust.

[![wakatime](https://wakatime.com/badge/github/{username}/{repo}.svg)](https://wakatime.com/badge/github/{username}/{repo})
[![Maintainability](https://api.codeclimate.com/v1/badges/{codeClimateId}/maintainability)](https://codeclimate.com/github/{username}/{repo}/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/{codeClimateId}/test_coverage)](https://codeclimate.com/github/{username}/{repo}/test_coverage)
[![CodeFactor](https://www.codefactor.io/repository/github/{username}/{repo}/badge)](https://www.codefactor.io/repository/github/{username}/{repo})

| Service      | Status |
| -------      | :----: |
| AppveyorCI   | [![Build status](https://ci.appveyor.com/api/projects/status/{appVeyorId}?svg=true)](https://ci.appveyor.com/project/{username}/{repo}/branch/main) |
| crates.io    | [![crates.io](https://img.shields.io/crates/v/package-name-rs.svg)](https://crates.io/crates/package-name-rs) |

Pure Rust bindings to the [Project API](https://apibr.com).

## Dependencies and support

**package-name-rs** is intended to work on all tier 1 supported Rust systems:

- MacOSX
- Linux
- Windows

## Minimum Compiler Version

Due to the use of certain features, package-name-rs requires `rustc` version 1.18 or
higher.

## Getting Started

Add the following to your `Cargo.toml`

```toml
[dependencies]
package_name_rs = "0.0.1"
serde_json = "1.0"
```

Then in your `lib.rs` or `main.rs` file add:
```rust
extern crate package_name;

let client = PackageNameAPIClient::new();

```

## License

Licensed under

- MIT license ([LICENSE](https://github.com/guibranco/apiclient-boilerplate-rust/blob/master/LICENSE) or [http://opensource.org/licenses/MIT](http://opensource.org/licenses/MIT))
