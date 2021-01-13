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

### ~man to show details about a command
```man ls``` <br />
It will show what is the work of **ls**, and what are the available options for **ls** .<br /> Actually **man** command show the manuals of a command. Try <br />
```man man``` <br /> and guess what will happen. :grinning:

### ~find to find a file in the system 
```find -name "filename.txt"```  
by default it will search in the current directory.  
```find / -name "filename.txt"```  
it will search all the directories in the system.   
```find /home/username/Documents -name "filename.txt"```  
it will search only in the Documents directory. 

By default Linux is case sensitive. To avoid this  
```find /home/username/Documents -iname "filename.txt"```  
i means case insensitive. 

```sudo find /home/sarouarhossain/Documents/prac -type d -iname "test"```  
here -type means file type. d means directory, f implies file. 

### ~locate to find a file in the system
This needs database to search by default. So database needs to be up to date.
