# Servers and Compute Resources

Virtual Labs has a combination of on-premise and cloud-based servers to manage its infrastructure needs. The on-premise servers are mainly used for testing labs and other applications internally, while cloud servers are used for production hosting and serving Virtual Labs (Applications/Services).

## On-Premise Servers

Virtual Labs has 6 physical servers located at IIITH. Out of these 6 servers, 3 are up-to-date with the latest configuration, while the other 3 are outdated.

### Updated Servers Configuration

The 3 up-to-date servers have the following configuration:

#### CPU Information

- Architecture: x86_64
- CPU op-mode(s): 32-bit, 64-bit
- Byte Order: Little Endian
- CPU(s): 128
- On-line CPU(s) list: 0-127
- Thread(s) per core: 2
- Core(s) per socket: 16
- Socket(s): 4
- NUMA node(s): 4
- Vendor ID: GenuineIntel
- CPU family: 6
- Model: 85
- Model name: Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz
- Stepping: 7
- CPU MHz: 1000.166
- BogoMIPS: 4600.00
- Virtualization: VT-x
- L1d cache: 32K
- L1i cache: 32K
- L2 cache: 1024K
- L3 cache: 22528K
- NUMA node0 CPU(s): 0-15,64-79
- NUMA node1 CPU(s): 16-31,80-95
- NUMA node2 CPU(s): 32-47,96-111
- NUMA node3 CPU(s): 48-63,112-127

#### Memory

- RAM: 503GiB
- Swap: 46GiB

#### Storage and Partitions

RAID 5 is configured on the 3 Lenovo Servers.

| Server       | Disks & Storage | Capacity after RAID setup | Partitions                | Size     |
|--------------|-----------------|---------------------------|---------------------------|----------|
| Server 1     | 6 * 1.8 TB      | 9 TB                      | Logical 200GB /           | 200GB    |
|              |                 |                           | Primary 600GB /home       | 600GB    |
|              |                 |                           | Primary 50GB SWAP         | 50GB     |
|              |                 |                           | Primary 500MB EFI         | 500MB    |
|              |                 |                           | Primary 3TB /disk         | 3TB      |
|              |                 |                           | Primary 3TB /disk1        | 3TB      |
|              |                 |                           | Primary 2.99TB /disk2     | 2.99TB   |
|              |                 |                           |                           |          |
| Server 2     | 6 * 1.8 TB      | 9 TB                      | Same as Server 1          | -        |
|              |                 |                           |                           |          |
| Server 3     | 6 * 1.8 TB      | 9 TB                      | Same as Server 1          | -        |


#### Operating System

- Ubuntu server 20

## Cloud Servers (AWS EC2 Instances)

Virtual Labs uses 24 EC2 instances for its cloud infrastructure and hosting virtual labs (web applications). The instances are divided into the following types:

| Instance Type | Count |
|---------------|-------|
| t2.micro      | 5     |
| t2.nano       | 12    |
| t3a.micro     | 1     |
| t3a.nano      | 6     |

Currently, 4 instances are stopped and not being used:

- 1 t3a.micro
- 3 t2.nano

### Instance Details

| Instance Type | Instance Name             | Instance State |
|---------------|---------------------------|----------------|
| t2.micro      | Ansible                   | Running        |
| t2.micro      | Reverse Proxy             | Running        |
| t2.micro      | Outreach (prod)           | Running        |
| t2.micro      | Outreach (backup)         | Running        |
| t2.micro      | cdntest                   | Running        |
| t2.nano       | Router                    | Running        |
| t2.nano       | Private DNS               | Running        |
| t2.nano       | Public DNS                | Running        |
| t2.nano       | vc-DEI (SQL)              | Running        |
| t2.nano       | vm-DEI (SQL)              | Running        |
| t2.nano       | cse19-IIITH               | Running        |
| t2.nano       | nlp-IIITH                 | Running        |
| t2.nano       | cse22-IIITH               | Running        |
| t2.nano       | cl-IIITH                  | Stopped        |
| t2.nano       | Amrita University Labs    | Running        |
| t2.nano       | srip                      | Stopped        |
| t2.nano       | ps-iiith(new)             | Stopped        |
| t3a.micro     | comped                    | Stopped        |
| t3a.nano      | Hosting Base (ph3-ui)     | Running        |
| t3a.nano      | 1 Phase 2 Labs (1)        | Running        |
| t3a.nano      | 2 Phase 2 Labs (2)        | Running        |
| t3a.nano      | 3 Phase 2 Labs (ALB)      | Running        |
| t3a.nano      | 4 Phase 3 Labs (ALB 1)    | Running        |
| t3a.nano      | 5 Phase 3 Labs (ALB 2)    | Running        |

