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
**i** means case insensitive. 

```sudo find /home/username/Documents/prac -type d -iname "test"```  
here **-type** means file type. **d** means directory, **f** implies file.  

```sudo find /home/username/Documents/prac -type d -user username -iname "test"```
here **-user** implies the owner of the file we are searching.

### ~locate to find a file in the system
locate uses a database to search by default. So database needs to be up to date.  
```sudo updatedb```  

```locate "search.txt"```   
this will locate the file.  

for case insensitive search
```locate -i "search.txt"``` 

### ~which
Return the location of a command based on the PATH settings  
```which python```  

```echo $PATH``` to show the path of the all commands

### ~whereis
```whereis python```  
Return all version of installed python information, also about the man information.  
Sometimes this is unreadable. To make it more readable  
```whereis python | tr " " '\n'```
**|** means pipes, **tr** means translate all **" "**(spaces) into **\n**(new lines)

### ~type
Returns the information about the command based on shell configuration.   
```type python```  

If we type ```type ls```, output will be like ```ls is an alias for ls --color=tty```  
**alias** means short formed command from an original long command.  
In this type of cases, type -  
```type -a ls```  

### ~cat/more/less/sort to view the contents of a file 
```cat filename.txt```  
but this is not convenient for a long file.  

For long file we can use **more** command, it will display one page at a time. Press **space** for next page.   
```more filename.txt```  

we can combine both this commands using a pipe **|**  
```cat filename.txt | more```  

**less** command is like **more** command, but more flexible. Using **less** command we can also scroll. We can also perform keyword search.  
```less filename.txt```  we can also search a keyword by ```/keyword```  
The most cool feature of this command is that it can watch file. Like watching log file in real time.  
```sudo less +F /path/log```  

**sort** command will sort the contents of a file. 
```sort filename.txt```  
```cat filename.txt | sort```  

To sort in reverse order  
```sort -r filename.txt```  
```cat filename.txt | sort -r```  

If we want to sort and save. In that case we have to redirect the sorted data in a new file. 
```sort filename.txt > sorted_filename.txt```  


### ~touch/vim/nano
```touch filename.txt``` will create a new file of 0 bytes. It also used to update the access and modification times. 

**vim/nano** is text editor like Notepad. 