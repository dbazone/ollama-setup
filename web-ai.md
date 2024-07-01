# Web-AI 


Ensure the Host Setting enabled in Docker Desktop

Navigate to setting 

Docker Desktop --> Features in Development --> Enable Host Networking


```Powershell
docker run  -e PORT=80 -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://localhost:11434 --name web-ai --restart always ghcr.io/open-webui/open-webui:main


curl http://localhost/
curl http://10.11.12.150/

```

The First Signed up user will be admin one. The subsequent users need to the admin approval