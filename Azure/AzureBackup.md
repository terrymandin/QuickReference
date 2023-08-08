# Azure Backup

- Recovery Services Vault is an older location.  A Backup Vault is for newer workloads.

## Q & A

- When to use a bare metal or system state backup?
- Do customers usually use file backups?
- When do you go with a IaC approach instead of backup?
- Do you often discuss database backups, or is it usuall IaaS?
- How do customers decide if they will use a partner / ISV?
  - Do we help them decide?
  - Do customers typically use ISV's for on-prem?
- Do you help them script their restore?
- What is zonal DR w.r.t. backup?
- Do you build Runbooks as part of this VBD?

## Customer Questions

- Will your recovery services vault be available from the public internet or only on the private network?
- Do you have any Trusted VMs.  Trusted VMs are not configurable with Azure Site Recovery, but will with with Azure Backup Enhanced mode.
- What are your regions?
- Do you want to backup to another region?  (ie. Site Recovery)
- Do you need a Crash or App consistent backup?
- What is your RPO and RTO?
- Does the customer have their own monitoring system?

## To Do

### Azure Site Recovery

- [Slide](https://microsoft.sharepoint.com/:p:/r/teams/ASDIPRelease/IP%20Release/Secure%20Infrastructure/VBD/Attaching%20Azure%20Backup%20and%20Azure%20Site%20Recovery%20to%20Virtual%20Machines/Technical%20Upskilling%20Plan/Attaching%20Azure%20Backup%20and%20ASR%20Chalk%20%26%20Talk.pptx?d=wd6f5ed0ad0e1493eacae891b848951dc&csf=1&web=1&e=zqzPBb&nav=eyJzSWQiOjI5NywiY0lkIjo0MjI4Mjc0MDYwfQ)

## Scenarios

### Backup and Restore On-Prem Server

### Backup and Restore Azure Server
