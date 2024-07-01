# Web-AI 

Install pre-requiste
```bash
sudo apt update && sudo apt upgrade
sudo apt install ca-certificates curl  gnupg lsb-release


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-compose

sudo usermod -aG docker $USER
newgrp docker

# logout and login back 
docker --version
docker-compose --version

```


```bash

# docker stop web-ai
# docker rm  web-ai

docker run  -e PORT=80 -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://10.11.12.150:11434 --name web-ai --restart always ghcr.io/open-webui/open-webui:main

```

<!-- #### Firewall - allow traffic
```powershell 
New-NetFirewallRule -DisplayName "Allow Open AI traffic" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow

``` -->


#### Test Connection
```bash

curl http://localhost/
curl http://10.11.12.150/

```


The First Signed up user will be admin one. The subsequent users need to the admin approval