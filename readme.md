## Description

[Laradock](https://laradock.io/)-like development and production environment based on Docker containers with Docker Compose.

Images build with alpine (not all).

Easy to start from an PHP project.

## Installation

>  Tested on Debian 9 / 10 

### Download repo

```bash
git clone https://github.com/mayocream/Runtime.git
```

### Install Docker CE

#### from script

```bash
curl -sSL https://get.docker.com/ | sh
```

#### manual (China mirror source)

```bash
apt update    
apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common    
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/debian/gpg | apt-key add -    
add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/debian $(lsb_release -cs) stable"    
apt update      
apt-cache policy docker-ce    
apt install docker-ce       
```

check docker status `systemctl status docker `

### Install Docker Compose

from Github:

```bash
curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose   
```

from DaoCloud (China mirror source)

```bash
curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
```

then:

```
chmod +x /usr/local/bin/docker-compose  
```

### Replace with China mirror source

edit `/etc/docker/daemon.json`

```json
{    
  "registry-mirrors": [    
      "https://registry.docker-cn.com",    
      "http://hub-mirror.c.163.com"    
    ]    
}    
```

```bash
systemctl daemon-reload    
systemctl restart docker
```

## Usage

### Before start

edit docker-compose.yml file, comment the part you don't need.

```bash
cp docker-compose.example.yml docker-compose.yml
nano docker-compose.yml
```

edit .env file.

```bash
cp env-example .env
nano .env
```

check the permissions of work folders.

```bash
mkdir /var/www # Your work folder.
chmod 777 -R /var/www
chmod 777 -R /var/runtime # Repo download path
```

### Start instances

```bash
docker-compose up -d
```

## Other things

### Docker Settings

Change Docker default hub mirror and expose docker's control port.

edit `/etc/docker/daemon.json`

```json
{
    "registry-mirrors": [
        "https://610w9y8k.mirror.aliyuncs.com"
    ],
    "hosts": [
        "tcp://0.0.0.0:2375",
        "unix:///var/run/docker.sock"
    ]
}
```

### FAQ - Temporary solutions

**Q: Database won't work on Shared Folders on Windows.**

A: Known as Windows' file system and permission problem, there's no a common solution.
