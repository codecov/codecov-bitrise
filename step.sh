#!/bin/bash

set -e

# Install gpg for MacOS devices
if [ -x "$(command -v brew)" ] && ! [ -x "$(command -v gpg)" ]; then
  brew install gpg
fi

# Download and verify Codecov uploader
curl https://keybase.io/codecovsecurity/pgp_keys.asc | gpg --no-default-keyring --keyring trustedkeys.gpg --import # One-time step
curl -Os "https://uploader.codecov.io/${VERSION}/${OS}/codecov"
curl -Os "https://uploader.codecov.io/${VERSION}/${OS}/codecov.SHA256SUM"
curl -Os "https://uploader.codecov.io/${VERSION}/${OS}/codecov.SHA256SUM.sig"
gpgv codecov.SHA256SUM.sig codecov.SHA256SUM
shasum -a 256 -c codecov.SHA256SUM

chmod +x codecov

curl -H "Accept: application/json" "https://uploader.codecov.io/${OS}/${VERSION}" | grep -o '\"version\":\"v[0-9\.\_]\+\"' | head -1

# Upload coverage to Codecov
./codecov -Q "bitrise-step-3.0.0" -Z "${other_options}"
