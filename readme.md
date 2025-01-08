# ☀ TSSL Bannerlord Server

TSSL is a **dockerized** **Bannerlord server** setup that allows you to **quickly deploy** to Dedicated server. This guide provides instructions for setting up the server manually, as well as automating the build and deployment process using **GitHub Actions** and **Docker**.

#### Features:
- **Building** and **Deploying** [Bannerlord Server](https://moddocs.bannerlord.com/multiplayer/hosting_server/) on **Dedicated Server** using [Docker](https://docker.com), [Docker Hub](https://hub.docker.com) and [Github Actions](https://github.com/features/actions)
- **Control** server instance and manage [Docker Container](https://www.docker.com/resources/what-container/) on **Dedicated Server**.
- [Enviornments for Deployment](https://docs.github.com/en/actions/managing-workflow-runs-and-deployments/managing-deployments/managing-environments-for-deployment) as a **Secret Vault**. 


---

## 🚀 Get Started

##### 📥 Install Docker
 Docker is a platform for creating, deploying, and managing lightweight, portable containers for applications. It simplifies development by packaging code and dependencies into isolated environments that work seamlessly across different systems.

Installation Links:
- [Linux Debian](https://docs.docker.com/engine/install/debian/)
- [Windows](https://docs.docker.com/desktop/setup/install/windows-install/) 


##### 🔧 Build Docker Image
```
docker build -t tssl_bl_srv .
```

##### 🚀 Run Docker Image
```
    docker run -d --name tssl_bl_srv \
    -e TW_TOKEN="Your Taleworld Server Token" \
    -e MODULES="_MODULES_*Native*Multiplayer*_MODULES_" \
    -e TICK_RATE=60 \
    -e SERVER_CFG="Native/server" \
    -p 7210:7210/tcp
    -p 7210:7210/udp
    tssl_bl_srv
```

####  ⚙️ Variables:
- `TW_TOKEN="Your Taleworld Server Token"`
    - This variable sets your Taleworld server token, which is required to authenticate and connect to the Taleworld multiplayer system. Replace "Your Taleworld Server Token" with your actual server token.

- `MODULES="_MODULES_*Native*Multiplayer*_MODULES_"`
    - This variable defines the modules that will be loaded into the server. By default it loads "Native" and "Multiplayer" modules. You can customize this to include other modules.

- `TICK_RATE=60`
    - This variable controls the game's tick rate, which affects how often the game logic is updated. 

- `SERVER_CFG="Native/server"`
    - This variable specifies the server configuration to use. It points to the default "Native" configuration. You can customize this to load a different configuration from or a path.


For more informations about Taleworld Token, check out [Taleworld - Hosting a Custom Server](https://moddocs.bannerlord.com/multiplayer/hosting_server/)

For more informations about Custom Modules, check out [Taleworld - Custom Game Modules](https://moddocs.bannerlord.com/multiplayer/custom_game_mode/)

##### 👉 Note: 

You can use [Github Actions](https://docs.github.com/en/actions) tostreamline the process of building images for to [Docker Hub](https:/hub.docker.com) these images can be deployed to a remote server. 

Workflows actions so far have been **only** **tested** on **Remote Server** with `Debian GNU/Linux 12 (bookworm)` installed.

You must have linux with Docker pre-installed on Remote Server and an linux user with permissions to run `docker` command. 
- ! Do not use `root` access. The large part of Linux ecosystem is designed to be run as a limited user, not as root. Running applications as root is very insecure and it can lead you to break your entire system without warning if you're not careful.

---

## 🚀 Worfklows

![Deploy To Remote Server Deployment Badge](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/deploy-instance.yml/badge.svg) ![Build Image to Docker Hub Deployment Badge](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/build-image.yml/badge.svg) ![Instance actions on Remote Server Deployment Badge](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/instance-actions.yml/badge.svg)

A workflow is a **configurable, automated process** defined by a **YAML file** in your repository, workflows can be triggered by repository manually.

Workflows are **stored** in the `.github/workflows directory`. A repository can **have multiple** workflows, each performing tasks, such as:
- **Building** and **Deploying** Docker Images
- **Control** Docker Containers on Remote Server
- **Configure** by enviornment or in default enviornment

**For more informations please read [Workflow Documentation](https://github.com/vojinpavlovic/tssl_bl_srv/blob/main/docs/workflows.md)**

---

## 🔐 Github Stored Secrets

Secrets are variables that you create in an organization, repository, or repository environment. The secrets that you create are available to use in GitHub Actions workflows. GitHub Actions can only read a secret if you explicitly include the secret in a workflow.

**For more informations please read [Secrets Documentation](https://github.com/vojinpavlovic/tssl_bl_srv/blob/main/docs/secrets.md)**

---

## 📁 Importing Server Files

Anything **placed** in the `modules/` directory will be copied to the `Modules/` directory in **[Docker Container](https://www.docker.com/resources/what-container/)**. This includes custom **scripts**, **assets**, **configurations**, or even **new modules**.

**For more informations please read [Server Files Documentation](https://github.com/vojinpavlovic/tssl_bl_srv/blob/main/docs/server-files.md)**

---

This project is licensed under the **MIT** License. See the [LICENSE](https://github.com/vojinpavlovic/tssl_bl_srv/blob/main/LICENSE) file for more details.
