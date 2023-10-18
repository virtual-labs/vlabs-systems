# Phase-iii Experiment Repo Creation

## Introduction 
This document outlines the step-by-step process for creating experiment repositories within the github Virtual Labs Engineer Forum repository. 
These repositories are essential for the hosting and rehosting of labs within the AWS cloud infrastructure.

## Motivation
- By following the steps outlined in this document, a system engineer can effortlessly create a virtual labs experiment repo as per the requirement.

## Prerequisites
- Before we start, you will need a GitHub account and access to Virtual Labs Github [Organisation](https://github.com/virtual-labs).

## Target Audience 
- This document is intended for Systems Engineers, DevOps Engineers, and other team members at Virtual Labs responsible for creating a repo in Virtual Labs Github organisation.

## Process
## 1. Issue Creation:
- In the Virtual Labs Engineer Forum, create a new issue for the following purposes:
   - Creation of Experiment Repository
   - Hosting/Rehosting of a lab
- To access these issues, visit: [Virtual Labs Engineer Forum Issues](https://github.com/virtual-labs/engineers-forum/issues)

## 2. Contents of the Issue:
- Within the issue, provide the following information:
  - Approver's Name.
  - Approved Proposal (a PDF file with all the necessary details).
  - Github Handle or Email ID for granting permissions.
 
## 3. Download and Open the PDF File:
- Download the PDF file attached to the issue.
- Inside the PDF file, locate the 'List of Experiments' header, which contains the names of the experiments.

## 4. Creating a New Repository:
- For each experiment listed, a new repository will be created.
- Navigate to GitHub and click on the 'New Repository' icon.
- Configure the repository settings as follows:
- Under 'Repository template,' select "virtual-labs/ph3-exp-template."
- For 'Owner,' choose "Virtual Labs."
- In 'Repository name,' enter the data as follows: "exp-<experiment name>-<institute name>."(Institute name in short format)
- In the 'Description' field, specify: "This experiment belongs to <Labname> Lab at <institutename>. Full Name: <Experiment Full name>."
- Select the 'Public' radio button to make the repo public
- Finally, click on the 'Create repository' button.

## 5. Creating Branches:
- After the repository is created, establish the following branches:
- Create a testing branch from the main branch.
- Create a development (dev) branch from the testing branch.

## 6. Setting Collaborators and Teams:
- In the repository settings, navigate to 'Collaborators and teams.'
- Click on 'Add teams' if the team already exists, or click on 'Create team' to add a new one.
- Include the institute team and save the changes.
- Add individuals as per requirements.
- This will allow the developers to access the repo to develop the experiments.

## 7. Configuring GitHub Pages:
- Access the 'Pages' tab within the repository.
- Under 'Branch,' select "gh-pages" and click the 'Save' button.
- It may take some time to generate the link under 'GitHub Pages.'
- This will create a sample experiment page with all the sections in standard format.
- Copy the URL. Navigate to the 'Code' tab, click on the 'Settings' icon under 'About.'
- In the 'Website' field, paste the URL.
- Under 'Topics,' add "<institute name>" and "ext-ph3," then click 'Save changes.'
- Repeat this process for each experiment, creating separate repositories as needed.

## 8. Completing the Issue:
- Return to the issue related to this repository.
- In the comments, mention write "In comments @<institute name> Please find the links for **<lab Name>** experiments and populate the repositories with sources of the experiments as detailed in Step 4 of the [migration document](https://github.com/virtual-labs/engineers-forum/blob/master/migration-process.md)"""
- Provide the links to the experiments

This comprehensive guide ensures a streamlined process for setting up experiment repositories in the Virtual Labs Engineer Forum, 
facilitating efficient lab hosting and rehosting within AWS.









