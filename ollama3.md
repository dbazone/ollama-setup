## Ollama3
Setup in WSL - Ubuntu

### Download and install Ollama latest version

Run following command in WSL - Ubuntu
```bash
sudo apt install 
sudo apt update


curl -fsSL https://ollama.com/install.sh | sh
```

#### Redirect traffic
Redirect all ollama bound traffic on host machine to WSL-Ubuntu. Ensure you replace below command with the correct IP addresses.

Command need the elevated privilges

```powershell

  netsh interface portproxy add v4tov4 `
  listenaddress=<windows IP address> `
  listenport=11434 `
  connectaddress=<your wsl-ubuntu-ip> `
  connectport=11434 

## Exaxmple
  netsh interface portproxy add v4tov4 `
  listenaddress='10.11.12.150' `
  listenport=11434 `
  connectaddress='172.19.250.189' `
  connectport=11434 

```


### Validate 

#### Service Status 
windows host machine. Powrshell commands
```powershell
curl http://localhost:11434/ #on windows PS
curl http://10.11.12.150:11434/ #on windows PS
```

WSL-Ubuntu machine. Bash command
```bash
curl http://172.19.250.189:11434/
```

#### Test model 

```bash
ollama run llama3 "hi there"
```

#### notes for future

```bash
sudo vim /etc/systemd/system/ollama.service
	Environment="OLLAMA_HOST=0.0.0.0"  # in [Service] section
sudo systemctl daemon-reload
sudo systemctl restart ollama

```