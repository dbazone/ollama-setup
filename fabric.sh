sudo apt install ffmpeg
ffmpeg -version

sudo apt install pipx




# Clone Fabric to your computer
git clone https://github.com/danielmiessler/fabric.git

# Enter the project folder (where you cloned it)
cd fabric


pipx install .
pipx ensurepath

fabric --setup


fabric --remoteOllamaServer localhost --changeDefaultModel llama3:latest

yt --transcript https://www.youtube.com/watch?v=H5Q_-gIZIps  |  fabric --model llama3:latest  --stream --pattern extract_wisdom

