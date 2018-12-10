# Terry's ESP Quick Reference

## References

* [Standard Setup of Toolchain for Windows](https://docs.espressif.com/projects/esp-idf/en/stable/get-started/windows-setup.html)
* [A MQTT Demo that Connects ESP device to Azure Cloud](https://github.com/espressif/esp-azure)

## Installation (Linux)

* Do not install as su
* [Standard Setup of Toolchain for Linux](https://docs.espressif.com/projects/esp-idf/en/stable/get-started/linux-setup.html)
* Add the following to ~/.profile
```
export PATH="$PATH:$HOME/esp/xtensa-esp32-elf/bin"
export IDF_PATH=~/esp/esp-idf
```

## Installation (Windows)

* Open ```C:\msys32\home\temandin\.bash_profile``` in Notepad.  Add the following:

```
export IDF_PATH="C:/msys32/home/<user-name>/esp/esp-idf"
```

* goto c:\msys32
* execute mingw32.exe
* cd esp

* Find the com port
```
ls -l /dev/tty*
```

* Deploy
```
make -j4 flash ESPPORT=COM<port-number> <monitor>
```

## Work in progress, finished here
[A MQTT Demo that Connects ESP device to Azure Cloud](https://github.com/espressif/esp-azure) Step 5
[Espressif IoT Development Framework](https://github.com/espressif/esp-idf/blob/master/README.md) Getting Started Guide for the stable ESP-IDF version
[Get Started](https://docs.espressif.com/projects/esp-idf/en/stable/get-started/) Setup Path to ESP-IDF
