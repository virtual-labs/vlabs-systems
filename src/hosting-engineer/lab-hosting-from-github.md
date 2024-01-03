
**Introduction:**
With new changes in the lab-template-repo creation. Now the lab can be hosted from github directly into aws s3. 
The lab-descriptor will have new fields **Code** and **Phase**. Code is for the branch of engineering which the lab belongs to ex: MECH, CSE,  and which phase is it ex: 2, 3, ext 3.

It can host only the static labs only. 

## Motivation
- By following the steps outlined in this document, a hosting engineer can effortlessly deploy a phase 3 virtual lab within the AWS environment from Github using workflows. 

## Prerequisites
- Before we start, you will need a GitHub account and access to [Virtual Labs](https://www.vlab.co.in/) Github [Organisation](https://github.com/virtual-labs) and access to Virtual Labs AWS.
- Add the Github handle of the users in [ph3-lab-deploy-s3.yml](https://github.com/virtual-labs/vlabs-workflows/blob/main/.github/workflows/ph3-lab-deploy-S3.yml) file under users sections.

## Target Audience 
- This document is intended for Systems Engineers, DevOps Engineers, and other team members at Virtual Labs responsible for deploying the labs into AWS cloud infrastructure.

## Process
- This process is for the phase 3 labs.

## Steps 
- Once the lab descriptor json file is ready in github.
- Click on Actions button
- On Actions page Click on production-deployment-lab-ph3 (main.yml)
- Click on Run Workflow dropdown button you will see the Run workflow button click it
- This will start the process of lab deployment.
- Once the process is complete the lab will be deployed.
- Manually add the lab details as below in [s3 domainmapping.js file](https://us-east-1.console.aws.amazon.com/lambda/home?region=us-east-1#/functions/vlabsphase?tab=code)

Example:

```bash
'mm2-nitk.vlabs.ac.in': {
    'bucket': 'default.ph2.vlabs.ac.in',
    'folder': 'mm2-nitk',
    'region': 'ap-south-1'
  }

