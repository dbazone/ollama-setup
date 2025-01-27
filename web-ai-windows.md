# Web-AI 


Ensure the Host Setting enabled in Docker Desktop

Navigate to setting 

Docker Desktop --> Features in Development --> Enable Host Networking


```Powershell

docker stop web-ai
docker rm  web-ai

docker run  -e PORT=80 -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://0.0.0.0:11434 --name web-ai --restart always ghcr.io/open-webui/open-webui:main

```

#### Firewall - allow traffic
```powershell 
New-NetFirewallRule -DisplayName "Allow Open AI traffic" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow

```


#### Test Connection
```powershell

curl http://localhost/
curl http://10.11.12.150/

```


The First Signed up user will be admin one. The subsequent users need to the admin approval
