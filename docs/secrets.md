## 🔐 Github Stored Secrets

Secrets are managed by [Environments for deployment](https://docs.github.com/en/actions/managing-workflow-runs-and-deployments/managing-deployments/managing-environments-for-deployment) on GitHub.

![Secret Repository Example](docs/assets/images/secret-repository.png)

- `DOCKER_USERNAME` and `DOCKER_PASSWORD` secrets are used for [Docker Hub](https://docs.docker.com/docker-hub/quickstart/) (Account) access so it can push or pull docker images.
- `DOCKER_REPOSITORY` [Docker Hub Repository](https://docs.docker.com/docker-hub/repos/) for storing images and it's build cache. 
- `SERVER_IPV4` [Public IP Address](https://wiki.teltonika-networks.com/view/Private_and_Public_IP_Addresses#:~:text=Public%20static%20-%20some%20times%20called,%2C%20device%2C%20server%20or%20website.) of your remote server where you want to deploy your Docker Image
- `SERVER_PORT` [Port](https://www.techtarget.com/searchnetworking/definition/port-number) of your Bannerlord Server that clients will listen to. Default value for Bannerlord Server by Taleworld is **7210**
- `SERVER_USER` [User](https://www.freecodecamp.org/news/how-to-manage-users-in-linux/) on remote server with ability to run Docker commands
- `SERVER_SSH_KEY` [SSH Key-Based Authentication on a Linux Server](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server) 
- `TW_TOKEN` In Multiplayer Bannerlord `press Alt+~` then type `customserver.gettoken`. 
    - This should generate token in `C:\Users\Your User\Documents\Mount and Blade II Bannerlord\Tokens\DedicatedCustomServerAuthToken`
