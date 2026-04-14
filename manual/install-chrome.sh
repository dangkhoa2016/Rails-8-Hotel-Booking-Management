# 1. Download the official Chrome package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# 2. Install Chrome and dependencies
sudo apt-get update
sudo apt-get install -y ./google-chrome-stable_current_amd64.deb

# 3. (Optional) Remove the installation file to keep the system clean
rm google-chrome-stable_current_amd64.deb
