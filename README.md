## IntelliJ inside Docker

Run IntelliJ Idea Community 2018.2 inside a Docker container, together with OpenJDK 8.

## Getting Started

These instructions will get you a copy of the project up and run on your local machine.

### Prerequisites

1. You must install X11 forwarding support ('xauth') on your local machine.

##### With CentOS
```bash
yum install xorg-x11-xauth
```

##### With Ubuntu
```bash
apt-get install xauth
```

2. Follow the link [System Watcher](https://blog.jetbrains.com/idea/2010/04/native-file-system-watcher-for-linux/) in order to override the default limit of  inotify max user watches


### Installing

By running the following command you'll be able to start the container

```bash
docker run -d \
           --net=host \
           --env=DISPLAY \
           --add-host=$HOSTNAME:127.0.0.1 \
           -v $HOME/.Xauthority:/root/.Xauthority:rw \
           -v $HOME/intellij-settings:/root/.IdeaIC2018.2:rw \
           -v $HOME/projects:/root/IdeaProjects:rw \
           -v $HOME/gradle-cache:/root/.gradle:rw \
           --name intellij \
           rozidan/docker-intellij:ideaIC-2018.2-jdk8-alpine
```

You can change this command accordingly by which location you wish to store IntelliJ settings.

### About DPI Settings

##### Windows
In case of blurry fonts using MobaXterm, it is because of high DPI configuration within your OS.
To avoid that, you should right-click the MobaXterm shortcut, go to properties -> compatibility -> change high DPI settings and check the "override high DPI scaling behavior".

## License

This project is licensed under the Apache License, Version 2.0 - see the [LICENSE](http://www.apache.org/licenses/LICENSE-2.0.txt) file for details.

