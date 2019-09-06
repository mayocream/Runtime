Install on Debian 9  

Install     

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun    


Install docker  

> apt update    
> apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common    
> curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -    
> add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"    
> apt update      
> apt-cache policy docker-ce    
> apt install docker-ce    
> systemctl status docker    

Install docker-compose   

> curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose    
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