Preparation
```shell script
mkdir -p ~/wine/sources
mkdir -p ~/wine/.wine
cd ~/wine

# Downlad XQARTZ https://dl.bintray.com/xquartz/downloads/XQuartz-2.7.8.dmg 
# Run dmg and install XQARTZ 
# DO NOT USE  > 2.7.8 (problem with video drivers)
# Relogin

# Open XQuartz app in Applications/Utils/XQuartz
# Настройки - Безопасность - Разрешить подключение из клиентских сетей
# Relogin

# Install brew if not exist
brew install pulseaudio
brew services start pulseaudio

# Build image
docker build -t wine .

# Download HOTA https://vk.com/h3hota
# http://download.h3hota.com/HotA_full_setup 
# and save to ./sources/
 
```

Checks before start
```bash
# Check sound
./sound_test.sh
# Should make a noise // Press Ctrl+C to stop

# Check x11
./x11_test.sh
# Should open windows notepad // Close by x in ui 

```

Start wine
```shell script
# Open XQuartz app in Applications/Utils/XQuartz
# Start script
./start_wine.sh
```

Installation HOTA
```shell script
./start_wine.sh

# In docker
wine sources/HOTA****.exe

# Accept all MONO,Gecko and other installations
# Install Heroes
```

Run HOMM
```shell script
./start_h3hota.sh
# Играть / Play
```