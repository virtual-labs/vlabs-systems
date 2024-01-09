# Introduction 
This document will list out the current alarms of Virtual Labs in aws as on 08th January 2024.

# Alarms 
At present there are three alarms active in Virtual Labs AWS. 

S.No.| Name of the alarm (Link) | Condition of Alarm| Instance Name | Comments|
| :---------:| :---------:| :--------:| :--------:| :--------:|
|1| [Outreach-Server-Check-Unhealthy](https://ap-south-1.console.aws.amazon.com/cloudwatch/home?region=ap-south-1#alarmsV2:alarm/Outreach-Server-Check-Unhealthy?) | CPUUtilization > 80 for 1 datapoints within 5 minutes | Outreach (Prod) | This Alarm will trigger if Outreach (Prod) CPU utilization reaches more than 80%| 
|2|[ALB-NITK-Phase-2-TG-Unhealthy-Alarm](https://ap-south-1.console.aws.amazon.com/cloudwatch/home?region=ap-south-1#alarmsV2:alarm/ALB-NITK-Phase-2-TG-Unhealthy-Alarm?) | UnHealthyHostCount > 0 for 1 datapoints within 1 hour | 3 Phase 2 Labs (ALB) | This Alarm will trigger if the 3 Phase 2 Labs (ALB) any of the status check fails|
|3|[ALB-IITR-Phase-3-TG-Unhealthy-Alarm](https://ap-south-1.console.aws.amazon.com/cloudwatch/home?region=ap-south-1#alarmsV2:alarm/ALB-IITR-Phase-3-TG-Unhealthy-Alarm?) | UnHealthyHostCount > 0 for 1 datapoints within 1 minute | 5 Phase 3 Labs (ALB 2)| This Alarm will trigger if the 5 Phase 3 Labs (ALB 2) any of the status check fails


# Adding New Alarms from 09th January 2024
S.No.| Name of the alarm (Link) | Condition of Alarm| Instance Name | Comments|
| :---------:| :---------:| :--------:| :--------:| :--------:|
|1| [3 Phase 2 Labs (ALB) CPU Utilization Alarm 80%](https://ap-south-1.console.aws.amazon.com/cloudwatch/home?region=ap-south-1#alarmsV2:alarm/3+Phase+2+Labs+(ALB)+Instance+Status+Check+Failed?) | CPUUtilization > 80 for 1 datapoints within 5 minutes | 3 Phase 2 Labs (ALB) | This Alarm will trigger if 3 Phase 2 Labs (ALB) CPU utilization reaches more than 80%| 
|2| [3 Phase 2 Labs (ALB) Instance Status Check Failed](https://ap-south-1.console.aws.amazon.com/cloudwatch/home?region=ap-south-1#alarmsV2:alarm/3+Phase+2+Labs+(ALB)+CPU+Utilization+Alarm+80$25?)|Instance status check failure|3 Phase 2 Labs(ALB)|This Alarm will trigger if the 3 Phase 2 Labs (ALB instance status check fails|





