# TSSL Bannerlord Server

## Get Started

#### 1. Clone Repository
`git clone https://github.com/vojinpavlovic/tssl`

#### 2. Install Docker 
- [Linux Debian](https://docs.docker.com/engine/install/debian/)
- [Windows](https://docs.docker.com/desktop/setup/install/windows-install/) 

#### 3. Build Docker Image
`docker build -t blsrv .`

#### 4. Run Docker Image
`docker run -d --name {{server_name}} -p 7210:7210/tcp -p 7210:7210/udp blsrv`

**Note:** Replace `{{server_name}}` with proper name e.g `tssl_groupfighting`

## Github Actions
- [Build](https://github.com/vojinpavlovic/tssl/actions/workflows/deploy.yml) `Manual Execution`
Builds the latest Docker image from the [dockerfile](https://github.com/vojinpavlovic/tssl/blob/main/dockerfile) and pushes it to Docker Hub

- [Deploy Training Server](https://github.com/vojinpavlovic/tssl/actions/workflows/deploy_training_srv.yml) `Manual Execution`
Deploys a container on the Training Server (remote server) using the latest image from Docker Hub.
