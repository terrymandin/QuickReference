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
