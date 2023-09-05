Creation of Lab repo and hosting a lab
After the experiment repos are created the developer will develop the experiments and create a hosting request in by creating Github issue.

**1.	Creation of Lab repo**

Will create and lab repo based on the issue
  
 


Scroll down for lab repo license should be added.

 
Click on create repository 

**2.	Adding Lab-Descriptor.json file** 

After creating repo add the “lab-descriptor.json” file. The template is in the [ph3-lab-mgmt](https://github.com/virtual-labs/ph3-lab-mgmt/blob/master/lab-descriptor.json).

Lab-descriptor.json consists of 
--------------------------------------------------------------------------------------------------------------
{
    "broadArea": {
        "name": "",
        "link": ""
    },
    "lab": "",
    "lab_display_name": "",
    "deployLab": ,
    "phase": ,
    "collegeName": "",
    "baseUrl": "",
    "introduction": "",
    "experiments": [],
    "targetAudience": {
        "UG": [],
        "PG": []
    },
    "objective": "",
    "courseAlignment": {
        "description": "",
        "universities": []
    }
} 

broadArea: lab name 

link: lab link in the vlab.co.in website

Lab : Name of the lab (Special characters are not allowed)

Lab display name: Name of the lab where it can have the spl characters and diplayed in the hosted webpage. 

Deploylab: Boolean make it true to deploy the lab or false to not to deploy the lab. 

College name: The developing institute name in short form as per analytics

baseUrl: link to the lab

introduction: it is available in the issue

experiments: List of all the experiments of the lab will be listed here 
{
“name”: “experiment name”

“short-name”: “exp short name”

“repo”: “github experiment repo link”

“tag”: “tag”(v.1.0.3)

“deploy”: Boolean (true or false) if you want to deploy this exp then make it true else make it false.
}

Objective, Course Alignment, Description, Universities are mentioned in the lab hosting issue. 

**3. Edit and commit changes** 

After adding necessary fields in the lab-descriptor.json file commit the changes. 


**4. Access the Google Sheet:**

•	Open your web browser and go to the [Google sheet](https://docs.google.com/spreadsheets/d/1WXJA_1QkLg-5S0YYBRKyhEXwOgTSbKvm972Fy-thCUc/edit#gid=263424893).

•	Navigate to the "Lab & Server - VM/S3" sheet to find the Gateway IP address.

**5. Gateway and VM Information:**

•	The Gateway IP is configured as 10.100.3.36.

•	Additionally, there are two more VMs with the IP addresses 10.100.2.245 and 10.100.2.149. This setup of three VMs is maintained for enhanced security.

**6. SSH into the Ansible Server:**
   
•	Open your terminal and use the following command to log in to the Ansible server: ssh vlead@13.232.165.229.

**7. Connecting to the Gateway:**
    
•	Once you've successfully logged into the Ansible server, establish a connection to the Gateway using the command: ssh -l root@10.100.3.36.

**8. Navigate to Your Home Directory:**
    
•	In the Gateway, navigate to your home directory with the command: cd /home/ubuntu/host/ and check for the presence of the lab repository.

**9. Cloning the Lab Repository:**
    
•	If the lab repository is not present, clone it from its GitHub source.

**10. Access the Lab Repository:**
    
•	Open the lab repository using the command: cd lab_repo_name.

**11. Inspect the Lab Descriptor:**
    
•	Inside the lab repository, open the lab-descriptor.json file using a text editor like vi lab-descriptor.json.

•	Verify that the tag name mentioned in the file matches the lab issue tag as intended.

**12. Navigate to the ph3-lab-mgmt Repository:**
    
•	Transition to the ph3-lab-mgmt repository with the command: cd /home/ph3-lab-mgmt/.

**13. Run Lab Generation:**
    
•	Within the ph3-lab-mgmt repository, execute the following command:
"npm run labgen -- /home/ubuntu/host/lab_repo_name/"

**14. Copying and Preparing Files:**
    
•	Copy the path and remove the staging area, then execute the command: /var/www/html/lab_repo_name.

•	Use the ls command to inspect the contents of the destination directory.

**15. Synchronize Lab Repository to 10.100.2.245:**
    
•	Copy the lab repository to another machine (VM) with IP 10.100.2.245 using the command:
"rsync -avz /var/www/html/lab_repo_name root@10.100.2.245:/root/builds"

**16. Important Note - IP Address Checking:**
    
•	Refer to the Hosted AWS sheet to identify the correct IP address where the lab is hosted.

**17. Synchronize Lab Repository to 10.100.2.149 (if needed):**
    
•	If the lab is hosted on a second VM, execute the following command to copy the files to that machine (VM) with IP 10.100.2.149:
"rsync -avz /var/www/html/lab_repo_name root@10.100.2.149:/root/builds"

**18. Logging into 10.100.2.149 Server:**
    
•	To access the server with IP 10.100.2.149, use the command: ssh -l root@10.100.2.149.

**19. Inspect the Repository:**
    
•	After successfully logging in, run the ls command to view the contents. You should see a repository named "builds."

**20. File Movement to HTML Directory:**
    
•	To transfer the files from the "builds" repository to the "html" directory, execute the following command:
"rm -rf /var/www/html/lab_name/* && mv * /var/www/html/lab_name/"

**21. Verification - Hosted Lab in the Browser:**
    
•	Finally, open your web browser and confirm the hosted lab by navigating to the appropriate URL or IP address.







