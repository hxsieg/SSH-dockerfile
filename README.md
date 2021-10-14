# Docker ausfuehren
```
docker build -t my-ubu .

docker run -dp 2022:22 --name ubu my-ubu

ssh -i id_rsa -p 2022 test@0.0.0.0
```
# Sicherheit
1. Ggf. fuer mehr Sicherheit einen eigenen id_rsa[.pub] mit ```ssh-keygen``` erzeugen und in der sshd_config
```PasswordAuthentication no```
# Sonstiges
1. Port 2022 muss bei mehreren Maschinen individuel sein
2. Um die nervige Nachfrage abzuschalten muss die locale ~/.ssh/config diesen Schalter haben:
```
# for all hosts
Host *
    StrictHostKeyChecking no

```
