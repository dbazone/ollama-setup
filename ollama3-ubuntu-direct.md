## Ollama3
Setup in Ubuntu (Server)


### Static IP Address (WIP - Yet to be Tested)
```yaml
network:
    ethernets:
        ens18:
            addresses:
            - 10.11.12.254/24
            nameservers:
                addresses:
                - 10.11.12.1
                search: []
            routes:
            -   to: default
                via: 10.11.12.1
    version: 2
```

### Download and install Ollama latest version

System Update and Ollama setup  
```bash
sudo apt update && sudo apt upgrade


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


### Monitor
Nivida latest driver should be installed before running this command

```bash
watch -n 1 nvidia-smi #GPU

watch -n 1 ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head #process
```
