#!/bin/bash

set -e

bash <(curl -s https://codecov.io/bash) -Q "bitrise-step" -Z ${other_options}
