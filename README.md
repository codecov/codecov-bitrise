# Codecov integration

[Codecov](https://codecov.io) integration for [Bitrise](https://www.bitrise.io/).

This step wraps the [Codecov Wrapper](https://github.com/codecov/wrapper) (`0.3.0`).

## Inputs

See [`step.yml`](./step.yml) for the full input list. Notable options:

- `cleanup` — when `true`, download the CLI into a temporary directory and remove it after the run (off by default)

## How to use this Step

Can be run directly with the [bitrise CLI](https://github.com/bitrise-io/bitrise),
just `git clone` this repository, `cd` into it's folder in your Terminal/Command Line
and call `bitrise run test`.

## Trigger a new release

- __merge every code changes__ to the `master` branch
- __push the new version tag__ to the `master` branch
