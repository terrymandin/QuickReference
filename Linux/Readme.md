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
