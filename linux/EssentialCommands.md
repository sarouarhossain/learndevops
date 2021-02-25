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

### create/copy/move/rename/delete file or directory
**File**  
1. create - ```touch filename.txt```  
2. copy - ```cp /path/filename.txt /path/directory``` or ```cp /path/filename.txt /path/directory/filename.txt```  
3. move - ```mv /path/filename.txt /path/directory``` or ```mv /path/filename.txt /path/directory/filename.txt```  
4. rename ```mv filename.txt file_new_name.txt```  
5. delete ```rm /path/filename.txt ``` or ```rm -f /path/filename.txt ``` here **-f** means force delete.  

**Directory**
1. create - ```mkdir directory_name``` or ```mkdir /path/directory_name```  
2. remove - ```rm -r directory_name``` or ```rm -r /path/directory_name``` this may throw permission error sometimes. In that case use ```rm -rf directory_name```, here **-f** means force delete.   

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


### ~diff/comm/cmp
```diff``` -> Compare two files or directories line by line.  
```comm``` -> Compare two sorted files.  
```cmp``` -> Compare two files byte by byte, and returns the position of the first difference.  

```diff fileone.txt filetwo.txt```  
```diff -c fileone.txt filetwo.txt``` context(-c) option will help to understand more clearly.  
``` diff -c ./dir1 ./dir2``` to compare directory.  

```comm file1 file2``` file1 and file2 must have to be sorted. 

```cmp file.txt file2.txt``` will return the first difference line number.  

### input output redirection
**stdin(0)** -> standard input  
**stdout(1)** -> standard output  
**stderr(2)** -> standard error   
**| (pipe)**    
**> (create/override)**  
**>> (create/append)**  
**< (input)**  

```ls -l /etc | less```  
```cat file.txt | sort | head -10``` -> This will cat contents of file.txt, then sort the lines, then output the first 10 lines.   
```ls -l /etc > etclist.txt``` -> This list out all contents of **/etc** and print this to **etclist.txt** file.  
```ls -l ./ >> file.txt``` -> This will also do the same thing. But if **file.txt** is already exists, it will not override the file. Instead it will append the new data.  

```less file.txt```  
```less < file.txt```  
Both commands will do the same thing. Showing the contents of **file.txt** . In second command we are passing as input file.txt.  

Lets consider we don't have any file named **filex.txt** , and we command -  
```cat filex.txt``` -> it will create a standard error.  
```cat filex.txt 2>>error.txt``` -> it will write the error messages to the error.txt.  
```cat filex.txt 2>>/dev/null``` -> **/dev/null** is like black hole. It is maintained by operating system. If something goes to there , there is no way to retrieve that.   

### Basic Regex
**^** Start of a string or a line
**$** End of a string or a line
**.** wildcard which can match any character except new line
**|** Matches a specific character or group of characters
**\*** Used to escape a special character
**t** the character "t"
**az** the string "az"

```grep '^The' filename.txt```  -> It will output all the lines start with **The** from the file.  
```grep '^T[a-z]^e' search.txt``` ->  
```grep '\<[tT]he\>' search.txt``` -> Find all **the** uppercase or lower case.  
```grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b" search.txt``` -> search all email address from the file.   
```grep -E -o -i "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b" search.txt``` also same .  

### TAR - Tape ARchive
```tar -cvf mybackup.tar /home/sarouarhossain/Documents/prac/toarchive/``` -> to archive file

```tar -cvfz mybackup.tar.gz /home/sarouarhossain/Documents/prac/toarchive/``` -> to zip the file

```tar -xvfz mybackup.tar.gz ``` -> to unzip the file
```tar -xvfz mybackup.tar.gz --directory=torestore ``` -> to unzip in a directory

```tar -tvf mybackup.tar ``` -> to see the contents of a tar file


### creating and managing hard and soft links
**Hard Link**  
1. Direct pointer to the file. (Same inode value)  
2. Only used for file  
3. Share the same inode, must be on the same filesystem. 
4. As long as hard link exists , data exists
  
create - ```ln file.txt hardlinkname```
show inode - ```ls -li```  

If we update the data of hardlink , original file data will also be updated. If we delete the original file, still data will be remain in the hardlink file. 

**Soft Link**  
1. A redirect to file (shortcut in windows or alias in mac)   
2. Can be a file or directory   
3. Has a unique inode
4. Can be on different filesystem  
5. If the source file is deleted the softlink file will be broken   

create - ```ln -s file.txt hardlinkname```  

### File Permissions


![permission](https://user-images.githubusercontent.com/26240597/104897466-c1cb1380-59bb-11eb-973e-9b1a6666ecc9.png)


```sudo chown new_user_name file``` -> change the user of the file.  
```sudo chown :new_group_name file``` -> change the group of the file.  
```sudo chown new_user:new_group file``` -> change the user and group of the file.  


### Doc about commands
```man command_name```  
```info command_name```  
```command_name --help```  
```whatis command_name```  

### Permission, User, Group change using `find` command 
For example we are changing user and group of ```/opt/mypage``` directory elements. Give read/write permissions to some files and read/write/execute permission to other all files.    
1. ```sudo -i```  change to super user    
2. `find /opt/mypage -ls`  
check the file list of mypage directory
3. `find /opt/mypage -exec chown user_name:group_name {} \;`  
here `-exec` means execute, `{}` means all output files of find command.  
4. `find /opt/mypage -name "d*" -exec chmod 660 {} \;`  
here `d*` means files that start with letter d. 
5. `find /opt/mypage '!' -name "d*" -exec chmod 770 {} \;` 
here `'!'` means not. Files that are not start with d letter. 

Lets we have a directory called home, and we have some files which has no user and groups. We want to set username and group to those files. 

1. `sudo -i`  
2. `find /home -nouser -a -nogroup -ls`  
here `-a` means and. 
3. `find /home -nouser -a -nogroup -exec chown user_name:group_name {} \;`


### Copy through SSH channel
