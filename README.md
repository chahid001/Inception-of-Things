
# Inception of Things

This project aims to deepen your knowledge by making you use K3d and K3s with
Vagrant.

# Tech used in the project

![Markup](https://img.shields.io/badge/Vagrant-1868F2?style=for-the-badge&logo=Vagrant&logoColor=white)
![Markup](https://img.shields.io/badge/Argo%20CD-1e0b3e?style=for-the-badge&logo=argo&logoColor=#d16044) 
![Markup](https://img.shields.io/badge/kubernetes-326ce5.svg?&style=for-the-badge&logo=kubernetes&logoColor=white)
![Markup](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) 
![Markup](https://img.shields.io/badge/Rancher-0075A8?style=for-the-badge&logo=rancher&logoColor=white) 
![Markup](https://img.shields.io/badge/GitLab-330F63?style=for-the-badge&logo=gitlab&logoColor=white) 
![Markup](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white) 
![Markup](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white) 
![Markup](https://img.shields.io/badge/Cent%20OS-262577?style=for-the-badge&logo=CentOS&logoColor=white) 

## Deployment

p1 & p2

```bash
  vagrant up
```

p3

```bash
  vagrant up
```

then you will need to connect with the virtual machine

```bash
  vagrant ssh
```
then run the scripts
```bash
  sh /scha/scripts/init.sh
```
```bash
  sh /scha/scripts/setup.sh
```

Bonus

same thing as Part 3.
You need to create a Gitlab repository and add the runner token to your values.yaml
before starting setup.sh 


## About the project

**Part 1**

Run two virtual machines using Vagrant and install K3S on them
the first one will be installed in controller mode and the second will be installed in agent mode.

**Part 2**

Run one virtual machine with K3s in server mode installed. You will set up 3 web applications of your choice that will run in your K3s instance.
You will have to be able to access them depending on the HOST used when making a request to the IP address 192.168.56.110.
When a client inputs the ip 192.168.56.110 in his web browser with the HOST app1.com,
the server must display the app1. When the HOST app2.com is used, the server must dis-
play the app2. Otherwise, the app3 will be selected by default. (you need to setup /etc/hosts)

**Part 3**

Run a virtual machine with K3D, and you have to set up a small infrastructure following the logic illustrated by the diagram below:

![](https://github.com/chahid001/Inception-of-Things/blob/main/assets/Screenshot%20from%202023-07-09%2017-32-58.png)

**Bonus**

The same thing as part 3, unless here we gonna add Gitlab CI, so instead of deploying the existing 
docker image in Docker Hub, we can modify the Dockerfile or index.html in the GitLab [repository](https://gitlab.com/chahid001/iot-bonus)
and that will trigger the GitLab CI pipeline and it's going to push a new image version to Docker Hub and modify the manifest file in the Github repo so can 
the app be deployed with Argo CD.
    


    




