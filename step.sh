#!/bin/bash

set -e

# Download and verify bash script
curl -fLso codecov https://codecov.io/bash;
VERSION=$(grep -o 'VERSION=\"[0-9\.]*\"' codecov | cut -d'"' -f2);
for i in 1 256 512
do
  shasum -a $i -c --ignore-missing <(curl -s "https://raw.githubusercontent.com/codecov/codecov-bash/${VERSION}/SHA${i}SUM") ||
  shasum -a $i -c <(curl -s "https://raw.githubusercontent.com/codecov/codecov-bash/${VERSION}/SHA${i}SUM" | grep -w "codecov")
done

# Upload coverage to Codecov
bash ./codecov -Q "bitrise-step" -Z ${other_options}
