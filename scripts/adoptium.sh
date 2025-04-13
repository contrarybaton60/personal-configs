# This is a script for installing Adoptium OpenJDK on Debian-based GNU/Linux, make sure that your release codename is correctly specified. 


wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/bookworm/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list
sudo apt update
sudo apt install temurin-8-jdk temurin-17-jdk temurin-21-jdk