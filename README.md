# Docker deploy
```
docker build -t my-ubu .

docker run -dp 2022:22 --name ubu my-ubu

ssh -i ssh/keys/id_docker_rsa -p 2022 test@0.0.0.0
```
# Security
1. Create your own key `id_docker_rsa[.pub]` with ```ssh-keygen``` and add to sshd_config
```PasswordAuthentication no```. But be careful that `id_docker_rsa` have mode 600!
# Other
1. The port 202x must be uniqe for all container
2. To switch of the annoying confirmation must the local `~/.ssh/config` add an entry like this
```
# for all local hosts
Host *0.0.0.0*
    StrictHostKeyChecking no

```
