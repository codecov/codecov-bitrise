#!/bin/bash

set -e

# Download and verify Codecov uploader
curl https://keybase.io/codecovsecurity/pgp_keys.asc | gpg --import # One-time step
curl -Os https://uploader.codecov.io/latest/${OS}/codecov
curl -Os https://uploader.codecov.io/latest/${OS}/codecov.SHA256SUM
curl -Os https://uploader.codecov.io/latest/${OS}/codecov.SHA256SUM.sig
gpg --verify codecov.SHA256SUM.sig codecov.SHA256SUM

shasum -a 256 -c codecov.SHA256SUM

chmod +x codecov

# Upload coverage to Codecov
bash ./codecov -Q "bitrise-step-3.0.0" -Z ${other_options}
