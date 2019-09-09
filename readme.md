Install on Debian 9  

Install curl -sSL https://get.daocloud.io/docker | sh

Install docker  

> apt update    
> apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common    
> curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/debian/gpg | apt-key add -    
> add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/debian $(lsb_release -cs) stable"    
> apt update      
> apt-cache policy docker-ce    
> apt install docker-ce    
> systemctl status docker    

Install docker-compose   

> curl -L https://get.daocloud.io/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose  
> chmod +x /usr/local/bin/docker-compose   

Docker China Mirror    

> nano /etc/docker/daemon.json    

```
{    
  "registry-mirrors": [    
      "https://registry.docker-cn.com",    
      "http://hub-mirror.c.163.com"    
    ]    
}    
```

> systemctl daemon-reload    
> systemctl restart docker