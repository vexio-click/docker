Instructions:

1) Goto frontend and follow instructions in README file
2) Goto backend and follow instruction in README file

3) Goto docker/docker-compose-build.yml and in 
```
 acme:
    image: neilpang/acme.sh
    command: >
      sh -c "acme.sh --issue --webroot /frontend/release -d vexio.click --keylength ec-256 --accountemail vektoralgoritml@gmail.com 
```
change domain name (vexio.click) and email (vektoralgoritml@gmail.com) to yours
4) Goto docker/docker-compose-released.yml and in 
```
 acme:
    image: neilpang/acme.sh
    command: >
      sh -c "acme.sh --issue --webroot /frontend/release -d vexio.click --keylength ec-256 --accountemail vektoralgoritml@gmail.com 
```
change domain name (vexio.click) and email (vektoralgoritml@gmail.com) to yours
It's needed to support https, static files are accessible from both http and https, but backend api only https

5) install docker and docker compose in your aws instance:
to install docker/latest
```
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker $(whoami)
newgrp docker
```
to install docker-compose/latest
```
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version
```
Now you are ready to deploy!

There are 2 ways of releasing server, build and release
    in build all building is gonna be executed in aws instance
    in released you building of static files for frontend, js for backend is executed locally -> files are being transferred to aws (this will greatly reduce memory/time requirements for compilation) and your downtime
(PS: if you are wondering why does frontend is being compiled into static files and backend wasn't compiled to linux executable, the reason is it has no sense, you will need your own loader to bundle node-sqlite, sharp and a lot of any other node_modules, all that are using .bindings, those node_modules are just not made the way to be compiled, no cross-compilation etc, you should choose ZIG/GO/C++ instead of JS if that's important for you :)


6) Optional: To execute build-option:
Make adjustments in local-aws-build.sh file, (edit your aws ip, and folder path, .ssh path), and run
it will transfer your files (needed for build) into the aws server
6) Optional: To execute released-option:
Make adjustments in local-aws-released.sh file, (edit your aws ip, and folder path, .ssh path), and run
it will transfer your files (needed to run) into the aws server

7) Make adjustments of ip and path in aws.cmd file, to connect into aws instance, run it and you will have bash to aws
cd /vexio/docker and  ```docker-compose -f docker-compose-released.yml up``` 

Enjoy

Hint: to prune docker cache (if you make some changes in source and wanna see changes on aws, use and google)
```bash
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker volume rm $(docker volume ls -q)
docker system prune -a
```
