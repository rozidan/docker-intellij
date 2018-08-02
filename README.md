# Intellij inside Docker

Run IntelliJ Idea Community 2018.2 inside a docker container.
OpenJDK 8 and OpenJDK 10 installed.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Prerequisites

First, you must install X11 forwarding support ('xauth') on your local machine.

##### With CentOS

```bash
yum install xorg-x11-xauth
```

##### With Ubuntu

```bash
apt-get install xauth
```

### Installing

By running the following command you'll be able to start the container

```bash
docker run -it \
           --net=host \
           --env=DISPLAY \
           --add-host=$HOSTNAME:127.0.0.1 \
           -v $HOME/.Xauthority:/root/.Xauthority:rw \
           -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
           -v $HOME/intellij-settings:/root/.IntelliJIdea2018.2:rw \
           -v $HOME/projects:/root/IdeaProjects:rw \
           -v $HOME/gradle-cache:/root/.gradle:rw \
           --name intellij rozidan/intellij
```

You can change this command accordingly by which location you wish to store Intellij settings.

### About DPI Settings

In case of blurry fonts using MobaXterm, it is because high DPI configuration within your OS.
To avoid that, you should right-click the MobaXterm shortcut,
go to properties -> compatibility -> 
change high DPI settings and check the "override high DPI scaling behavior".

## License

This project is licensed under the Apache License, Version 2.0 - 
see the [LICENSE](http://www.apache.org/licenses/LICENSE-2.0.txt) file for details.

