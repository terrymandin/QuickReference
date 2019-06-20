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
  Top 10 directories by disk space
  ```
  du -a / | sort -n -r | head -n 10
  ```
