### ~ls (list of contents of the current directory)
```ls -l``` <br />
```ls -al``` <br />
```ls -lt``` <br />
```ls -ltr``` <br />
Here ***a*** means all contents including hidden files. <br /> **l** means all contents of the directory with details. <br /> **t** means sort contents based on time when the contents were created and **r** will sort the contents based on time but in descending order(old files show first). <br /> All those are called the options for command ***ls***.

Lets assume in a folder files are like bellow 
```
build  build.gradle  gradle  gradlew  gradlew.bat  settings.gradle  src

```

I wanna know details about **build.gradle** file specifically. Appropriate command will be <br />
```ls -l build.gradle``` <br />
here **ls** is the command, **-l** is the option and **build.gradle** is the argument.

In a command there may be three parts like bellow <br />
```command options argument```

### ~rm to remove a file or directory
```rm -f file_name``` <br />
```rm -r directory_name``` <br />
To remove a file option will be **-f** and to remove a directory option will be **-r**
