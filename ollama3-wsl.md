## Ollama3
Setup in WSL - Ubuntu

### Download and install Ollama latest version

Run following command in WSL - Ubuntu
```bash
sudo apt update
sudo apt upgrade


curl -fsSL https://ollama.com/install.sh | sh
```


#### Test model 

```bash
ollama run llama3 "hi there"
```



### Network Setup

Validate local address where ollama is listening
```bash
netstat -tunlp | grep 11434

```

change from 127.0.0.1 to localIP address 
```bash
sudo vim /etc/systemd/system/ollama.service
	Environment="OLLAMA_HOST=0.0.0.0"  # in [Service] section
sudo systemctl daemon-reload
sudo systemctl restart ollama
netstat -tunlp | grep 11434
```

### Validate 

#### Service Status 
WSL/windows host machine. Powrshell commands
```powershell
curl http://localhost:11434/ 
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
  connectaddress='172.26.97.50' `
  connectport=11434 

netsh interface portproxy show al

### delete the address
netsh interface portproxy delete v4tov4   listenaddress='10.11.12.150' listenport=11434


```

Firewall traffic
```powershell 
New-NetFirewallRule -DisplayName "Allow ollama traffic" -Direction Inbound -Protocol TCP -LocalPort 11434 -Action Allow

```



### Validate 
windows host machine. Powrshell commands
```powershell
curl http://localhost:11434/ 
curl http://10.11.12.150:11434/

```


### Monitor
Nivida latest driver should be installed before running this command

```bash
watch -n 1 nvidia-smi #GPU

watch -n 1 ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head #process
```


