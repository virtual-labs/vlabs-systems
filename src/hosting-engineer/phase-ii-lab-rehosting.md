## Introduction 
- This document offers a comprehensive, step-by-step guide detailing the process of hosting a Phase 2 virtual lab in the AWS cloud infrastructure.

## Motivation
- By following the steps outlined in this document, a hosting engineer can effortlessly deploy a phase 2 virtual lab within the AWS environment while gaining a clear and comprehensive understanding of the entire process.

## Prerequisites
- Before we start, you will need a GitHub account and access to [Virtual Labs](https://www.vlab.co.in/) Github [Organisation](https://github.com/virtual-labs) and access to Virtual Labs AWS.

## Target Audience 
- This document is intended for Systems Engineers, DevOps Engineers, and other team members at Virtual Labs responsible for deploying the labs into AWS cloud infrastructure.

## Process
- This process is for the phase 2 labs for which the lab repos are already created. It will rehosting of the phase 2 labs.

## 1. SSH into Ansible Server:
- Open your terminal and run the command: ssh vlead@13.232.165.229
- This command allows you to log in to the Ansible server.
- This step initiates a secure shell (SSH) connection to the Ansible server. SSH is a network protocol that allows secure access to a remote system. You log in using the provided username (vlead) and the server's IP address (13.232.165.229).

## 2. Connect to the Gateway:
- From the Ansible server, establish a connection to the gateway using the command: ssh root@<gateway_ip>
- After logging into the Ansible server, you establish an SSH connection to a gateway. The gateway serves as an intermediary or bridge to access other network segments or systems. Replace <gateway_ip> with the actual IP address of the gateway you intend to connect to.

## 3. Verify Gateway Configuration:
- To ensure that the gateway is correctly configured, you run the route -n command. This command displays the kernel routing table, and you're looking for the presence of the gateway with the IP address 10.100.1.1.

## 4. Add Default Gateway:
- In cases where the default gateway is not present (as confirmed in step 3), you add it using the below command.
~~~
route add default gw 10.100.1.1
~~~
- This step is crucial to enable internet access for the virtual machine, which might not have direct internet connectivity.

## 5. Verify Gateway Addition:
- To verify that the default gateway has been added successfully, run:
~~~
  route -n
~~~
## 6. Update Lab Repository:
- Navigate to the lab repository and update it by running: git pull
- If git pull doesn't work as expected, attempt the following:
- Remove the existing repository: rm -rf lab-repo-name/
- Clone the repository with a depth of 1:
~~~
git clone --depth 1 https://github.com/virtual-labs/lab-repo-name
~~~

## 7. Build Lab Source Code:
- You move into the "src" folder within the lab repository and execute the make all command. This command compiles, builds, or processes the source code for the lab, depending on the project's requirements.

## 8. Remove Default Gateway:
- Once the build process is finished, delete the default gateway with: route del default gw 10.100.1.1

## 9. Verify Gateway Deletion:
- Confirm the removal of the default gateway by running:
~~~
 route -n
~~~

## 10. Create a Backup:
- Change to the "bckups" folder from your home directory.
- As a precautionary measure, you create a backup of the current state of the lab repository. This backup includes all necessary files and data, allowing you to revert to this snapshot if any issues arise during the update process.
- Take a backup of the current repository version using the command: cp -rf /var/www/html/lab-id .
- This backup ensures that you can revert to the previous state in case of any issues.

## 11. Access the Build Folder:
- Enter the "build" folder within the lab repository with: cd build

## 12. Deploy Updated Code:
- Finally, you deploy the updated code to the server by removing existing files in the deployment directory (/var/www/html/lab-id/) and moving the newly compiled code (mv *) into that directory. This step ensures that the latest lab version is available for access.
- Deploy the updated code to the server by executing the command:
~~~
rm -rf /var/www/html/lab-id/* && mv * /var/www/html/lab-id/
~~~
## 13. Verification - Hosted Lab in the Browser:**
- Finally, open your web browser and confirm the hosted lab by navigating to the appropriate URL or IP address.
