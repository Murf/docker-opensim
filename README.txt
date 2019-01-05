This is a simple step by step guide to quickly get a single region opensimulator running and connected to OSGrid
The method is similar for all platforms, the main requirement is "docker" and "docker-compose"
Please see http://www.docker.com for instructions on how to install docker on your platform.
Once docker is installed:

1) Download the starter files from https://github.com/Murf/docker-compose-osgrid
2) In CMD/bash/terminal change to the directory you downloaded the files in step 1
3) Type "docker-compose up -d"
4) For a once off config of your first region type " docker exec -it os-osgrid-1 after_install.sh"
5) Answer all of the questions per a normal OSGrid first time installation (see some of the other tutorials in this forum or https://github.com/Murf/docker-compose-osgrid/blob/master/README.md for more info)
6) Type "quit" to exit from the configuration step

Thats it! Your region should be up at the co-ordinates you specified and reachable from within OSGrid

