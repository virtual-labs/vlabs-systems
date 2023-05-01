# Networking

Networking is crucial in the Virtual Labs infrastructure, enabling seamless communication between various components and providing connectivity for both on-premise and cloud-based resources. This section offers an overview of the networking systems the organization uses.

## Wide Area Network (WAN)

IIIT-Hyderabad provides Wide Area Network (WAN) connectivity, ensuring stable and reliable internet access for the on-premise servers and other resources. IIIT VPNs enable secure remote access to the on-premise resources, allowing users to connect to the servers at IIIT-Hyderabad securely from anywhere.

## Cloud Networking

Virtual Labs employs Amazon Web Services (AWS) for its cloud-based infrastructure and Amazon Virtual Private Cloud (VPC) for its cloud networking needs. VPCs enable the creation of a logically isolated network within the AWS cloud, where resources such as Amazon EC2 instances can launch in a secure and controlled environment.

The cloud resources are primarily in the `ap-south-1` region, distributed across two subnets: `ap-south-1a` and `ap-south-1b`. This setup ensures high availability and fault tolerance for the applications hosted in the cloud.

Virtual Labs leverages the following features of AWS VPC to maintain a secure and well-organized network environment:

- **Subnets**: Subnets divide the VPC IP address range into smaller segments, helping to organize and control network traffic. Virtual Labs utilizes two subnets, `ap-south-1a` and `ap-south-1b`, to distribute resources across availability zones.
- **Security Groups**: Security Groups act as a virtual firewall for the instances, controlling inbound and outbound traffic at the instance level. Virtual Labs uses a Security Group named `prod-lab` to manage and protect the production environment.
- **Network Access Control Lists (NACLs)**: NACLs provide an additional layer of security, acting as a virtual firewall at the subnet level. Virtual Labs configures one NACL to control the traffic flow in and out of the VPC.