# Building the Docker image

`depot build --push -t davguij/ultimate-img-gen-api:{0} --platform linux/amd64 .`

`DOCKER_BUILDKIT=1 docker build -t davguij/ultimate-img-gen-api:{0} .`

# Docker images

- [DEPRECATED] davguij/ultimate-img-gen-api:no-worker -> special version, designed for being spin as a Runpod pod directly, to check models, etc
- [DEPRECATED] davguij/ultimate-img-gen-api:1 -> first try, no custom model/checkpoint bundled in the Docker image
- [WORKING] davguij/ultimate-img-gen-api:2 -> only default SD1.5 model bundled in the Docker image; uses CLI arg to load models from Runpod network volume
- [PRODUCTION] davguij/ultimate-img-gen-api:3 -> Sane than 2, but loads also Loras form network volume

# Network Volume Folders

- `/runpod-volume/models` for checkpoints
- `/runpod-volume/lora` for Loras

# Model API names

## OW

- "hassaku.safetensors" (Classic)
- "meina-21.safetensors" (NextGen)
- "meina-3.safetensors" (NextGen Dark)
- "aom3a1b.safetensors" (Artistic)

## Futa

- [BAD RESULTS] "futagen.safetensors" (Futamany)
- [PRODUCTION] "aom3a1b.safetensors" -> https://civitai.com/models/9942?modelVersionId=17233 (Oh my Futanari)
  - To be used with the following Loras:
    - [PRODUCTION] https://civitai.com/models/7327/esthetic-futanari-trap
    - [TO DO] https://civitai.com/models/36056/futaveiny

## OnlyBabes

- ✅ "aazrul-2.safetensors" (Aazrul)
- ✅ "korean-25d.safetensors" (Asian Love) -> https://civitai.com/models/7371/rev-animated
- ✅ "rev-122.safetensors" (Dramatic)
- ✅ "babes-20.safetensors" (Elegance) -> https://civitai.com/models/2220?modelVersionId=61372
- ✅ "perfect-deliberate-4.safetensors" (Perfection) -> https://civitai.com/models/24350/perfectdeliberate
- ✅ "meina-unreal-3.safetensors" (Smooth)
- ✅ "babes-11.safetensors" (Spicy)
- "dreamshaper-631.safetensors" (Surreal)

---

<div align="center">

<h1>Automatic1111 | Worker</h1>

[![CI | Test Worker](https://github.com/runpod-workers/worker-template/actions/workflows/CI-test_worker.yml/badge.svg)](https://github.com/runpod-workers/worker-template/actions/workflows/CI-test_worker.yml)
&nbsp;
[![Docker Image](https://github.com/runpod-workers/worker-template/actions/workflows/CD-docker_dev.yml/badge.svg)](https://github.com/runpod-workers/worker-template/actions/workflows/CD-docker_dev.yml)

This worker is a RunPod worker that uses the Stable Diffusion model for AI tasks. The worker is built upon the Stable Diffusion WebUI, which is a user interface for Stable Diffusion AI models.

</div>

## Model

The worker uses the Stable Diffusion model, which has been optimized for RunPod. This model is stored as a SafeTensors file, which is a format that facilitates efficient loading and execution of AI models. You may download the model file from the following link: here.

## Building the Worker

The worker is built using a Dockerfile. The Dockerfile specifies the base image, environment variables, system package dependencies, Python dependencies, and the steps to install and setup the Stable Diffusion WebUI. It also downloads the model and sets up the API server using supervisor.

The Python dependencies are specified in requirements.txt. The primary dependency is runpod==0.9.4.

## Running the Worker

The worker can be run using the start.sh script. This script starts the init system and runs the serverless handler script.

## API

The worker provides an API for inference. The API is set up using supervisor, and the configuration is specified in webui_api.conf. The API runs on port 3000.

## Serverless Handler

The serverless handler (rp_handler.py) is a Python script that handles inference requests. It defines a function handler(event) that takes an inference request, runs the inference using the Stable Diffusion model, and returns the output.
