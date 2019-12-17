[![Build Status](https://travis-ci.com/ckaserer/docker-template.svg?branch=master)](https://travis-ci.com/ckaserer/docker-template)
![Docker Pulls](https://img.shields.io/docker/pulls/ckaserer/hello-world)
![GitHub](https://img.shields.io/github/license/ckaserer/docker-template)
![Maintenance](https://img.shields.io/maintenance/yes/2020)
<br>
<br>

# docker-template

CentOS 7 container image with ...

---

# Getting started

1) Create a new repository and use this repo as **template**
2) Update the badge links in `README.md`
3) add docker credentials to be able to push your image to dockerhub
4) add build notifications (slack and/or google hangout)
5) remove the "Getting started" section in `README.md`
6) write your own Dockerfile and enjoy CI and notifications

## Add docker credentials

1) use ckaserer/docker-travis-cli to encrypt your docker credentials

```
git clone https://github.com/ckaserer/docker-travis-cli.git
source docker-travis-cli/bashrc
add-docker-credentials "dockerUsername"
```

or run following command directly 

```
docker run --rm -i -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/travis-cli add-docker-credentials "dockerUsername"
```

## How to set up slack notifications

1) login to https://team-gepardec.slack.com/
2) go to https://team-gepardec.slack.com/apps/A0F81FP4N-travis-ci
3) Click add to slack
4) Choose channel #travis
5) Click "Add Travis Integration"
6) Customize the name and icon for integration e.g. your repo name "docker-template" + icon of the key technology in this case "docker"
7) on top you will find setup instructions. You can't just copy and paste them!
8) use ckaserer/docker-travis-cli to encrypt your slack token

```
git clone https://github.com/ckaserer/docker-travis-cli.git
source docker-travis-cli/bashrc
add-slack-token "workspace:myToken"
```

or run following command directly

```
docker run --rm -i -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/travis-cli add-slack-token "workspace:myToken"
```

## How to set up google chat notifications

1) open google chat
2) open the room that you would like to add notifications too (e.g. Builds)
3) click on the Dropdown next to the name of the room
4) click on "Configure webhooks"
5) Set a name (preferably the repo slug) and an avatar url
6) Click "Save"
6) Copy the webhook url
7) use ckaserer/docker-travis-cli to encrypt your slack token 

```
git clone https://github.com/ckaserer/docker-travis-cli.git
source docker-travis-cli/bashrc
add-googlechat-webhook "myWebhookUrl"
```

or run following command directly

```
docker run --rm -i -e TZ=Europe/Vienna -v $(pwd):/root -w=/root ckaserer/travis-cli add-googlechat-webhook "myWebhookUrl"
```