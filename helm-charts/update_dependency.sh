#!/bin/bash

# Copyright (C) 2024 Intel Corporation
# SPDX-License-Identifier: Apache-2.0

UPD_DIR=$(cd $(dirname "$0") && pwd)
export -f helm
find ${UPD_DIR}/common -maxdepth 1 -type d | xargs -I {} -P 8 bash -c 'echo "Update dependency for $(basename {})..."; rm -f {}/Chart.lock; rm -rf {}/charts/; helm dependency update {}'
