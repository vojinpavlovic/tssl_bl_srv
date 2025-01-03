# ☀ TSSL Bannerlord Server
TSSL is a dockerized Bannerlord server setup that allows you to quickly deploy a dedicated server. This guide provides instructions for setting up the server manually, as well as automating the build and deployment process using GitHub Actions and Docker.

---

## 🚀 Get Started

##### 1. Install Docker
 Docker is a platform for creating, deploying, and managing lightweight, portable containers for applications. It simplifies development by packaging code and dependencies into isolated environments that work seamlessly across different systems.

Installation Links:
- [Linux Debian](https://docs.docker.com/engine/install/debian/)
- [Windows](https://docs.docker.com/desktop/setup/install/windows-install/) 

#### 2. Build Docker Image
`docker build -t blsrv .`

#### 3. Run Docker Image
`docker run -d --name tssl_sample_srv -p 7210:7210/tcp -p 7210:7210/udp blsrv`

Replace `tssl_sample_srv` with desired container name

#### Note: 

We recommend to use [Github Actions](https://docs.github.com/en/actions) to streamline the process of building images for to [Docker Hub](https://hub.docker.com) these images can be deployed to a remote server. 

In order to enable workflow, it is required to setup secrets. To find more informations visit 
`🔐 Github Stored Secrets` section.

---

## 🔐 Github Stored Secrets

Secrets are stored in [Actions secrets and variables](https://docs.github.com/en/actions/security-for-github-actions/security-guides/using-secrets-in-github-actions) on GitHub.


#### 🐳 Secrets for Docker Hub Account 
- DOCKER_USERNAME `Account Username from Docker Hub.`
- DOCKER_PASSWORD `Account Password from Docker Hub.`
- DOCKER_REPOSITORY `Repository from Docker Hub for Bannerlord Server`

#### 🌐 Secrets for Deployment on Remote Server
Your Secret Repository name should be called **DEPLOYMENT_CONFIG**

Content of secret is **JSON** format. Please use [minifier](https://www.minifier.org) to minify your JSON before uploading/updating secret in `Github Stored Secrets`

```json
{
    "unique_instance_id": {
        "token": "Taleworld Server Token",
        "remote_ip": "Remote Server IPv4 Address",
        "remote_user": "Remote Server User with docker permissions",
        "remoter_ssh_key": "Remote Server SSH access key",
        "remote_port": "Instance Bannerlord Server Port",
    }
}
```

**Note:** Instance Identifier must be **unique** accross all secrets. 

---

## 🚀 Worfklows
[Build](https://github.com/vojinpavlovic/tssl/actions/workflows/deploy.yml) `Manual Execution`
Builds the latest Docker image from the [dockerfile](https://github.com/vojinpavlovic/tssl/blob/main/dockerfile) and pushes it to Docker Hub

#### 🪶 Arguments

✍️ **Docker Image Version**
- 🏷️ Type: `string`
- ✔️ Required: `true`
- ✏️ Default Value: `latest`

[Deploy](https://github.com/vojinpavlovic/tssl/actions/workflows/deploy.yml) `Manual Execution`
Deploys a container on the Training Server (remote server) using the latest image from Docker Hub.

#### 🪶 Arguments

1. ✍️ **Instance Id**
- 🏷️ Type: `string`
- ✔️ Required: `true`

2. ✍️ **Docker Image Version**
- 🏷️ Type: `string`
- ✔️ Required: `true`
- ✏️ Default Value: `latest`

---

## 🧾 License

This project is licensed under the **MIT** License. 

See the [LICENSE](https://github.com/vojinpavlovic/tssl/blob/main/LICENSE) file for more details.
