# Web-AI 

```Powershell
docker run  -e PORT=80 -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://172.19.250.189:11434 --name web-ai --restart always ghcr.io/open-webui/open-webui:main


curl http://localhost/
curl http://10.11.12.150/

```