Creation of Lab repo and hosting a lab
After the experiment repos are created the developer will develop the experiments and create a hosting request in by creating Github issue.
1.	Creation of Lab repo

Will create and lab repo based on the issue
  
 


Scroll down for lab repo license should be added.

 
Click on create repository 

2.	Adding Lab-Descriptor.json file 

Once repo is created we need to add the “lab-descriptor.json” file.  template is in the ph3-lab-mgmt.

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
broadArea: name is lab name and
 link: lab link in the vlab.co.in
Lab : Name of the lab (Special characters are not allowed)
Lab display name: Name of the lab where it can have the spl characters. 
Deploylab: Boolean (true or false) 
College name is the developing institute name in short form as per analytics
baseUrl: link to the lab
 introduction: it is available in the issue
experiments: List of all the experiments of the lab 
{
“name”: “experiment name”
“short-name”: “exp short name”
“repo”: “github experiment repo link”
“tag”: “tag”(v.1.0.3)
“deploy”: Boolean (true or false) if you want to deploy this exp then make it true else make it false.
}
 
Objective, Course Alignment, Description, Universities are mentioned in the issue. 

Once all the things are added. Commit changes. 


3.	AWS 
Go to [Google sheet](https://docs.google.com/spreadsheets/d/1WXJA_1QkLg-5S0YYBRKyhEXwOgTSbKvm972Fy-thCUc/edit#gid=263424893)
file under Phase 3 will get the Gateway IP address 



Gateway IP is 10.100.3.36 and there are two more VM’s 10.100.2.245 and 10.100.2.149. We are maintaining three VM’s for security purpose. 

•	Open the terminal  “ssh vlead@13.232.165.229” this command is used to login into the ansible server. 
•	From here we will connect to Gateway “ssh -l root@10.100.3.36” 

 

•	Go to home directory “cd /home/ubuntu/host/” check for the lab repo  

•	If lab repo is not present clone the repo from the GitHub 

•	Open the lab repo “cd lab repo name”  

•	Open the lab descriptor.json file in the lab repo“vi lab-descriptor.json” and Check for the tag name mentioned in it with the lab issue tag are matching.

•	Now go to ph3-lab-mgmt repo “cd /home/ph3-lab-mgmt/”

•	Once you are in ph3-lab-mgmt repo run the following command “npm run labgen -- /home/ubuntu/host/lab_repo_name/” 
 
•	Now copy the path remove the stage and run the command “/var/www/html/lab_repo_name”

•	“ls” here to see the content 

•	Now run the following command “rsyn -avz /var/www/html/lab_repo_name root@10.100.2.245:/root/builds”

•	Note: the ip address will be in the Hosted AWS sheet check which ip address does the lab is hosted.

•	If the lab is hosted in two VM’s run the command “rsyn -avz /var/www/html/lab_repo_name root@10.100.2.149:/root/builds”

•	It will copy the file to both the machine (VM’s)

•	Now login to the 10.100.2.149 server by running “ssh -l root@10.100.2.149” 

•	Run ls command you will see a repo name “builds” 

•	Now will move the files from builds to html by running the command “rm -rf /var/www/html/lab_name/* && mv * /var/www/html/lab_name/ 

•	Check the hosted lab in the browser. 





