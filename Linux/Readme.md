# Terry's Linux Quick Reference

- Find
  ```
  find . -type f -name file.ext
  find . -type f -exec grep "example" '{}' \; -print
  ```
- Path
  ```
  printenv PATH
  ```
- Top 10 directories by disk space
  ```
  du -a / | sort -n -r | head -n 10
  ```
  Files greater than a certain size
  ```
  find . -name *.gz -type f -size +1M -exec ls -l {} \;
  ```
- Append a SD card, update docker to use SD card
  ```
  mount |grep /dev/mmcblk0p1
  umount /mnt/sd-mmcblk0p1
  mkfs.ext4 -m 0 -L sdcard /dev/mmcblk0p1
  mkdir /mnt/SD
  mount -t ext4 /dev/mmcblk0p1 /mnt/SD
  Update /etc/docker/daemon.json file
  ```
- Diretory sizes
```
 du -h --max-depth=1 | sort -hr
 ```
- Clean Docker
```
docker system prune -a -f
```
- Export a variable
```
export <var>=<value>
```
- Enable SSH
```
sudo apt install openssh-server
```
- Open Ports
```
ufw enable
ufw allow <port>
```
- Watch the output of a linux command
```
watch iotedge list
```
- See free memory
```
free -m
```
- Resize disk

  See [Linux: extend a partition](https://rdr-it.com/en/troubleshooting/linux-extend-a-partition/#:~:text=Hyper%2DV%3A%20extend%20a%20virtual%20disk,-This%20can%20be&text=From%20the%20parameters%20of%20the,by%20clicking%20on%20Finish%201.)
- Memory size
```
grep MemTotal /proc/meminfo
```

- OS Version

```
cat /etc/issue
```

- Generate a SSH key pair.  It creates two files in .ssh: 
  - private key: ```id-rsa```
  - public key:  ```id_rsa.pub```

```
ssh-keygen -m PEM -t rsa -b 4096
```

Install on an existing vm.  

```
ssh-copy-id -i ~/.ssh/id_rsa.pub user@linuxservername
```

- Initializing Data Disks ([details](https://learn.microsoft.com/en-us/training/modules/add-and-size-disks-in-azure-virtual-machines/))

List messages from the kernel for SCSI devices
```
dmesg | grep SCSI
```

Create a new primary partition.  Choose disk from command above.  In this case it is "sdc"
```
(echo n; echo p; echo 1; echo ; echo ; echo w) | sudo fdisk /dev/sdc
```

Write the filesystem:

```
sudo mkfs -t ext4 /dev/sdc1
```

Mount the drive:
```
sudo mkdir /data && sudo mount /dev/sdc1 /data
```
