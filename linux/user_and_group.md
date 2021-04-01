### useradd 
`sudo useradd username` -> this command available in all distros. only create account, set default shell to /bin/sh  
`cat /etc/passwd` -> to see if user is created  
`id usernmame` -> to see the id of new user  . it will also show the groups this user is associated with.
`sudo useradd -m -s /bin/bash username` -> create user with home directory and set default shell as bash.  
`sudo passwd username` -> to add the password for the user  

### adduser
`adduser username` -> high level utility, not available in all distros. Will create account and home directory, then promt for password.

### usermod
`sudo usermod -c "test1234..." username`  
`sudo usermod -aG group_name username` -> to add secondary group. here -a means append, G means secondary group.
`cat /etc/group` -> to see all the groups  

### userdel
`sudo userdel username` -> to delete user. available in all distros. combine with -r to delete home directory also.  

### deluser 
`sudo deluser username` -> can create a backup of home directory before deleting user. may not be avaialable in all distros.
`sudo deluser --backup --backup-to /home --remove-home username` -> delete user , backup home dir and delete the home dir.

`kill -9 process_id` -> to kill a process


