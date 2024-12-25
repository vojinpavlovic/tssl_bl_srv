# TSSL Bannerlord Groupfight Battle Server

## Get Started

#### 1. Clone Repository
`git clone https://github.com/vojinpavlovic/tssl_groupfighting`

#### 2. Install Docker 
[Linux Debian](https://docs.docker.com/engine/install/debian/)
[Windows](https://docs.docker.com/desktop/setup/install/windows-install/) 

#### 3. Build Docker Image
`docker build -t bannerlord-server .`

#### 4. Run Docker Image
`docker run -d --name bannerlord-server -p 7210:7210/udp bannerlord-server`

#### 5. Check your container
*The container should be called **tssl-groupfighting*** 

`docker ps`

## Configuration Options

*In progress*

