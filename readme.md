# ☀ TSSL Bannerlord Server
TSSL is a customizable Bannerlord server setup that allows you to quickly deploy a dedicated server using Docker. This guide provides instructions for setting up the server on both local and remote machines, as well as automating the build and deployment process using GitHub Actions.

---

## 🏠 Local Server Setup

##### 1. Install Docker
 Docker is a platform for creating, deploying, and managing lightweight, portable containers for applications. It simplifies development by packaging code and dependencies into isolated environments that work seamlessly across different systems.

Installation Links:
- [Linux Debian](https://docs.docker.com/engine/install/debian/)
- [Windows](https://docs.docker.com/desktop/setup/install/windows-install/) 

#### 2. Build Docker Image
`docker build -t blsrv .`

#### 3. Run Docker Image
`docker run -d --name tssl_sample_srv -p 7210:7210/tcp -p 7210:7210/udp blsrv`

**Note:** Replace `tssl_sample_srv` with desired container name

---

## 🌐 Remote Server Setup (Linux Debian)

##### 1. Install Docker
 Docker is a platform for creating, deploying, and managing lightweight, portable containers for applications. It simplifies development by packaging code and dependencies into isolated environments that work seamlessly across different systems.

Installation Links:
- [Linux Debian](https://docs.docker.com/engine/install/debian/)
- [Windows](https://docs.docker.com/desktop/setup/install/windows-install/) 

#### 2. Run Docker Image
`docker run -d --name tssl_sample_srv -p 7210:7210/tcp -p 7210:7210/udp blsrv`

**Note:** Replace `tssl_sample_srv` with desired container name

We recommend to use [Github Actions](https://docs.github.com/en/actions) to streamline the process of building images for to [Docker Hub](https://hub.docker.com) these images can be deployed to a remote server. 

In order to enable workflow, it is required to setup secrets. To find more informations visit 
`🔐 Github Stored Secrets` section.

---

## 🔐 Github Stored Secrets

Secrets are stored in [Actions secrets and variables](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions) on GitHub.

In order to enable deployment workflow you need [Docker Hub](https://hub.docker.com) account.

**Secrets Docker Hub**
- DOCKER_USERNAME `Account Username from Docker Hub.`
- DOCKER_PASSWORD `Account Password from Docker Hub.`
- DOCKER_REPOSITORY `Repository from Docker Hub for Bannerlord Server`

**Secrets for Deployment (SSH)**
- BL_SRV_TOKEN_**{INSTANCE_ID}**: `TaleWorld token.`
- REMOTE_SERVER_IP_**{INSTANCE_ID}**: `IPv4`, 
- REMOTE_SERVER_USER_**{INSTANCE_ID}** `Remote Server User.`
- REMOTE_SSH_KEY_**{INSTANCE_ID}}** `Remote Server SSH Access Key.`

Valid **INSTANCE_ID** is required in deployment workflow for pulling secrets for individual instance.

---

## 🚀 Worfklows
[Build](https://github.com/vojinpavlovic/tssl/actions/workflows/deploy.yml) `Manual Execution`
Builds the latest Docker image from the [dockerfile](https://github.com/vojinpavlovic/tssl/blob/main/dockerfile) and pushes it to Docker Hub

#### Arguments

**Docker Image Version**
- Type: `string`
- Required: `true`
- Default Value: `latest`

[Deploy](https://github.com/vojinpavlovic/tssl/actions/workflows/deploy.yml) `Manual Execution`
Deploys a container on the Training Server (remote server) using the latest image from Docker Hub.

#### Arguments

**Docker Image Version**
- Type: `string`
- Required: `true`
- Default Value: `latest`

**Instance Id**
- Type: `string`
- Required: `true`

---

## 🧾 License

This project is licensed under the **MIT** License. See the [LICENSE](https://github.com/vojinpavlovic/tssl/blob/main/LICENSE) file for more details.
