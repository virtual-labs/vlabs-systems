# Overview of the Infrastructure

## Introduction
This document provides a high-level overview of the infrastructure at [Virtual Labs](https://vlead.vlabs.ac.in/). It covers the main components, their relationships, and their purposes in the context of the organization's infrastructure operations.

## 1. [Servers and Compute Resources](./servers-compute-resources.md)
   ### a. On-Premise Servers
   - 6 physical Vlead servers are located at IIITH, used for hosting labs and other applications internally
   ### b. Cloud Servers
   - [AWS](https://ap-south-1.console.aws.amazon.com/console/home?region=ap-south-1#) is used for hosting and serving Virtual Labs(Applications/Services)      - [20 EC2 instances](https://ap-south-1.console.aws.amazon.com/ec2/home?region=ap-south-1#Instances:instanceState=running;sort=instanceTypeFilter) across various regions and availability zones

## 2. [Storage Systems](./storage.md)
   ### a. On-Premise Storage
   - [RAID](https://gitlab.com/vlead-systems/lenovo-servers/-/blob/master/procedure.org) configured with 25-30TB of storage available for hosting and serving Virtual Labs(Applications/Services)
   ### b. Cloud Storage
   - Amazon [S3](https://s3.console.aws.amazon.com/s3/home?region=ap-south-1) and [EC2](https://ap-south-1.console.aws.amazon.com/ec2/home?region=ap-south-1#Instances:instanceState=running;sort=instanceTypeFilter) instances are used for storing data on the cloud


## 3. [Networking](./network.md)
   ### a. Wide Area Network (WAN)
   - [IIIT-Hyd](https://www.iiit.ac.in/) provides internet connectivity
   - [IIIT VPNs](https://vpn.iiit.ac.in/) for connecting remote users to servers at IIIT-H
   ### b. Cloud Networking
   - Amazon [VPC](https://ap-south-1.console.aws.amazon.com/vpc/home?region=ap-south-1#vpcs:VpcId=vpc-0d118dc847a0f46fe)

## 4. [Security](./security.md)
   ### a. Firewalls
   - [AWS Security Groups](https://ap-south-1.console.aws.amazon.com/ec2/home?region=ap-south-1#SecurityGroups:) and [Application Load Balancer](https://ap-south-1.console.aws.amazon.com/ec2/home?region=ap-south-1#LoadBalancers:) for network protection and traffic filtering
   ### b. Intrusion Detection/Prevention Systems (IDS/IPS)
   - [Fail2Ban(IPS)](https://www.fail2ban.org/wiki/index.php/Main_Page) for monitoring and mitigating security threats

## 5. [Backup and Recovery](./backup-recovery.md)
   ### a. On-Premise Backup
   - [Cronjob](https://itsfoss.com/cron-job) for creating and managing local backups
   ### b. Cloud Backup
   - AWS Volumes backup solution for redundancy and quick recovery of EC2 instances

## 6. [Monitoring and Management Tools](./monitoring-and-management-tools.md)
   ### a. Infrastructure Monitoring
   - Amazon [CloudWatch](https://ap-south-1.console.aws.amazon.com/cloudwatch/home?region=ap-south-1#) for a comprehensive view of infrastructure performance and health, metrics, logs, and alarms.
   ### b. Log Management
   - Amazon CloudWatch Logs for collecting, analyzing, and storing logs
   ### c. Configuration Management
   - [Ansible](https://www.ansible.com/) for managing cloud server configurations

## 7. [DevOps and CI/CD Pipeline](./ci-cd-pipeline.md)
   ### a. Version Control System
   -  [GitHub](https://github.com/virtual-labs) and [GitLab](https://gitlab.com/vlead-projects) for managing code and configuration files
   ### b. Continuous Integration and Continuous Deployment (CI/CD)
   - [GitHub CI/CD](https://github.blog/2022-02-02-build-ci-cd-pipeline-github-actions-four-steps/)  for automating test application(lab) deployment
   ### c. Containerization and Orchestration
   - containerization and orchestration are still in the implementation phase. 
