#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SOURCE_DIR="${SCRIPT_DIR}/../ffmpeg"
OUT_DIR="${SCRIPT_DIR}/output"

mkdir -p $OUT_DIR

docker build -t ffmpeg-linux-arm - < ${SCRIPT_DIR}/Dockerfile

cp "${SCRIPT_DIR}/compile.sh" "${SOURCE_DIR}"

docker run -v "${SOURCE_DIR}:/ffmpeg/sources" -v "${OUT_DIR}:/ffmpeg/bin" ffmpeg-linux-arm /ffmpeg/sources/compile.sh
