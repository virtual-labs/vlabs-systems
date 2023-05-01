# Security

Ensuring the security of the infrastructure is a top priority for Virtual Labs. This section highlights the measures to protect the organization's on-premise and cloud-based resources.

## Firewalls

Virtual Labs utilizes firewalls to maintain the security of its infrastructure. For cloud resources, AWS Security Groups and Application Load Balancers protect the network and filter traffic. AWS Security Groups act as virtual firewalls, controlling inbound and outbound traffic at the instance level. Application Load Balancers inspect the incoming traffic, routing requests only to healthy targets and blocking malicious requests.

## Intrusion Detection/Prevention Systems (IDS/IPS)

Intrusion Detection and Prevention Systems (IDS/IPS) are vital in identifying and mitigating security threats. Virtual Labs uses Fail2Ban, an intrusion prevention software, to monitor system logs and detect potentially harmful activities. Fail2Ban helps protect the infrastructure by automatically updating firewall rules to ban IP addresses that show signs of malicious behavior, such as failed login attempts or attempts to exploit vulnerabilities.

Through firewalls and intrusion detection/prevention systems, Virtual Labs ensures a secure environment for its on-premise and cloud-based resources, safeguarding the organization's infrastructure from potential threats.