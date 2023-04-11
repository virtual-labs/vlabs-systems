# Storage Systems

Virtual Labs infrastructure uses on-premise and cloud-based storage to store and manage its data. Both the on-premise and cloud storage systems are essential for hosting and serving Virtual Labs (Applications/Services).

## On-Premise Storage

The RAID 5 setup on 3 Lenovo Servers provides on-premise storage. Each server has 6 * 1.8 TB (Terabytes) of storage, resulting in a total storage capacity of 10.8 TB per server. After the RAID setup, each server has 9 TB of usable storage. The storage is partitioned and utilized for different purposes, including system files, user data, and lab-specific data.

The partitions for each server are as follows:

| Partition       | Size   |
|-----------------|--------|
| Logical /       | 200GB  |
| Primary /home   | 600GB  |
| Primary SWAP    | 50GB   |
| Primary EFI     | 500MB  |
| Primary /disk   | 3TB    |
| Primary /disk1  | 3TB    |
| Primary /disk2  | 2.99TB |

## Cloud Storage

Virtual Labs relies on Amazon Web Services (AWS) for cloud storage. Amazon S3 and EBS are the primary storage services for storing and managing data on the cloud. Amazon S3 provides object storage that will use for storing and retrieving any amount of data. We will primarily use it for hosting static assets, such as images, videos, and other files required by the Virtual Labs applications. Amazon EBS provides block storage that can be attached to Amazon EC2 instances for primary storage for databases, file systems, or other applications requiring low latency and high throughput.

