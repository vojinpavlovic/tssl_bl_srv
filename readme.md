# ☀ TSSL Bannerlord Server

TSSL is a **dockerized** **Bannerlord server** setup that allows you to **quickly deploy** to Dedicated server. This guide provides instructions for setting up the server manually, as well as automating the build and deployment process using **GitHub Actions** and **Docker**.

#### 💡 Features:
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

#####  ⚙️ Enviornment Variables:
- `-e TW_TOKEN="Your Taleworld Server Token"`
    - Sets your Taleworld server token required for authentication on Taleworld API. Replace value with generated and valid token.

- `-e MODULES="_MODULES_*Native*Multiplayer*_MODULES_"`
    - Defines the modules that will be loaded upon run. You can customize this to include other modules.

- `-e TICK_RATE=60`
    - This variable controls the game's tick rate, which affects how often the game logic is updated. 

- `-e SERVER_CFG="Native/server.txt"`
    - This variable specifies the server configuration path from `Module/` directory inside container.

For more informations about Taleworld Token, check out [Taleworld - Hosting a Custom Server](https://moddocs.bannerlord.com/multiplayer/hosting_server/)

For more informations about Custom Modules, check out [Taleworld - Custom Game Modules](https://moddocs.bannerlord.com/multiplayer/custom_game_mode/)

##### 👉 Note: 

You can use [Github Actions](https://docs.github.com/en/actions) to streamline the process of building images for to [Docker Hub](https:/hub.docker.com) these images can be deployed to a Dedicated Server. 

- ! Workflows actions so far have been **only** **tested** on **Dedicated Sever** with `Debian GNU/Linux 12 (bookworm)` installed.

You must have linux with Docker pre-installed on Dedicated Server and an linux user with permissions to run `docker` command. 
- ! Do not use `root` access. The large part of Linux ecosystem is designed to be run as a limited user, not as root. Running applications as root is very insecure and it can lead you to break your entire system without warning if you're not careful.

---

## 🚀 Worfklows

![Deploy To Dedicated Server Deployment Badge](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/deploy-instance.yml/badge.svg) ![Build Image to Docker Hub Deployment Badge](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/build-image.yml/badge.svg) ![Instance actions on Dedicated Server Deployment Badge](https://github.com/vojinpavlovic/tssl_bl_srv/actions/workflows/instance-actions.yml/badge.svg)

A workflow is a **configurable, automated process** defined by a **YAML file** in your repository, workflows can be triggered by repository manually.

Workflows are **stored** in the `.github/workflows directory`. A repository can **have multiple** workflows, each performing tasks, such as:
- **Building** and **Deploying** Docker Images
- **Control** Docker Containers on Dedicated Server
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

## Contributing

A huge thanks to [Fief Eviction Notice](https://github.com/fiefevictionnotice) for his contributions and fixes to this project!  

His **forked repository** can be found here:  
👉 [fief_tssl_bl_srv](https://github.com/fiefevictionnotice/fief_tssl_bl_srv)

If you’re interested in hosting a Bannerlord server using his fork, check out his YouTube guide:  
🎬 [Run a Bannerlord Server for $20-30 per month (Docker on Azure)](https://www.youtube.com/watch?v=tsPM8uUUVvQ&t=881s)

⚠️ **Note:** This tutorial uses the forked repository, not this original repository.  
If you’re not sure how to run it, especially on Azure, it’s recommended to use the forked repository instead of this one.

---

This project is licensed under the **MIT** License. See the [LICENSE](https://github.com/vojinpavlovic/tssl_bl_srv/blob/main/LICENSE) file for more details.
