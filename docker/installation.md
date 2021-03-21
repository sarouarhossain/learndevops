## Linux Ubuntu
1. `sudo apt update`  
2. `sudo apt install apt-transport-https ca-certificates curl software-properties-common`  
3. `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`  
4. `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"`  
5. `sudo apt update`  
6. `apt-cache policy docker-ce`  
7. `sudo apt install docker-ce`  
8. `sudo systemctl status docker`  
9. `sudo usermod -aG docker ${USER}`  
10. `su - ${USER}`  

11. `sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`  
12. `sudo chmod +x /usr/local/bin/docker-compose`  

13. `docker --version`
14. `docker-compose --version`  
