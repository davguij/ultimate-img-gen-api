#!/bin/bash

echo "Worker Initiated"

echo "Starting WebUI API"
python /stable-diffusion-webui/webui.py --ckpt-dir=/runpod-volume/models --skip-python-version-check --skip-torch-cuda-test --no-tests --skip-install --opt-sdp-attention --disable-safe-unpickle --port 3000 --api --nowebui --skip-version-check --no-hashing --no-download-sd-model &

echo "Starting RunPod Handler"
python -u /rp_handler.py
