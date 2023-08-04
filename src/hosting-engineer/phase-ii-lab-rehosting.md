
1.	Open the terminal “ssh vlead@13.232.165.229” this command is used to login into the ansible server. 
2.	From here we will connect to Gateway “ssh -l root 10.100.2.112” 
3.	To check the gateway is added run “route -n”. If 10.100.1.1 gateway is not present then add the default gateway.
4.	Default gateway should be added as this vm will not have the internet access “route add  default gw 10.100.1.1”
5.	To check the gateway is added run “route -n”
6.	Go to the lab repo and run “git pull” to get the updates from the git repo to server. If git pull does work try to remove the repo “rm -rf metal-forming-virtual-simulation-lab-dei/” and clone it with depth 1 “git clone –depth 1 https://github.com/virtual-labs/metal-forming-virtual-simulation-lab-dei”
7.	After successful pull/clone go to “src” folder “cd src” and run “make all” command. Let the make command run.
8.	After the make completes now will delete the default gateway “route del default gw 10.100.1.1”
9.	Check the gateway is deleted or not by running “route -n” command.
10.	go to “bckups” folder from home 
11.	We take backup of the current version of the repo incase anything goes wrong to revert to it run the command “cp -rf /var/www/html/msvs-dei .”  for backup
12.	Go to build folder inside the lab repo “cd build”
13.	Run this command “rm -rf /var/www/html/msvs-dei/* && mv * /var/www/html/msvs-dei/”
