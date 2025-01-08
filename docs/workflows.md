## 🚀 Worfklows

### [📦 Build Image to Docker Hub](https://github.com/vojinpavlovic/tssl/actions/workflows/deploy.yml)
Builds the latest Docker image from the [dockerfile](https://github.com/vojinpavlovic/tssl/blob/main/dockerfile) and pushes it to Docker Hub

![Build Image to Docker Hub Deployment Badge](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/build-image.yml/badge.svg)

#### 🪶 Arguments

1. ✍️ **♻️ Enviornment Configuration Key**
    - 🏷️ `Type:` string
    - ✔️ `Required:` true
    - ✏️ `Default Value:` none (must be existing)
    - 📙 `Description:` Github Enviornment repository name for deployment  
2. ✍️ **Docker Image Version**
    - 🏷️ `Type:` string
    - ✔️ `Required:` true
    - ✏️ `Default Value:` latest
    - 📙 `Description:` Uploading new build to the Docker Image Version e.g `stable` (production ready) version instead of `latest` (experimental)
    


### [🚀 Deploy to Remote Server](https://github.com/vojinpavlovic/tssl/actions/workflows/deploy.yml)
Deploys a container on the Remote Server using the latest image from Docker Hub.

![Deploy To Remote Server Deployment Badge](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/deploy-instance.yml/badge.svg)

#### 🪶 Arguments

1. ✍️ **♻️ Enviornment Configuration Key**
    - 🏷️ `Type:` string
    - ✔️ `Required:` true
    - ✏️ `Default Value:` none 
    - 📙 `Description:` Github Enviornment repository name for deployment  
2. ✍️ **⚙️ Server Configuration**
    - 🏷️ `Type:` string
    - ✔️ `Required:` true
    - ✏️ `Default Value:` server.txt
    - 📙 `Description:` Server Configuration file for Container Deployment 
3. ✍️ **Module Startup Command**
    - 🏷️ `Type:` string
    - ✔️ `Required:` true
    - ✏️ `Default Value:` `_MODULES_*Native*Multiplayer*_MODULES_`
    - 📙 `Description:` Module list that Bannerlord Server will run.
4. ✍️ **Tick Rate**
    - 🏷️ `Type:` number
    - ✔️ `Required:` true
    - ✏️ `Default Value:` 60
    - 📙 `Description:` A higher tickrate means more updates per second for the clients

### [🕹️ Instance actions on Remote Server](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/instance-actions.yml)
Run an action upon server container using SSH and Docker. The available actions are **`START | RESTART | STOP | DELETE`** in workflow.

![Instance actions on Remote Server Deployment Badge](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/instance-actions.yml/badge.svg)


#### 🪶 Arguments

1. ✍️ **♻️ Enviornment Configuration Key**
    - 🏷️ `Type:` string
    - ✔️ `Required:` true
    - ✏️ `Default Value:` none (must be existing)
    - 📙 `Description:` Github Enviornment repository name for deployment.
2. ✍️ **🎬 Remote Server Action for Server Instance**
    - 🏷️ `Type:` choice
    - ✔️ `Required:` true
    - ✏️ `Default Value:` START
    - ☰  `Options`: 
        - START `docker start`
        - RESTART `docker restart`
        - STOP `docker stop`
        - DELETE `docker delete, docker rm`
    - 📙 `Description:` Choose an action to run upon Remote Server using Docker if container found.
