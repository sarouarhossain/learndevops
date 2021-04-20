### useradd 
`sudo useradd username` -> this command available in all distros. only create account, set default shell to /bin/sh  
`cat /etc/passwd` -> to see if user is created  
`id usernmame` -> to see the id of new user  . it will also show the groups this user is associated with.
`sudo useradd -m -s /bin/bash username` -> create user with home directory and set default shell as bash.  
`sudo passwd username` -> to add the password for the user 

example:
`sudo useradd -u 2000 container-user-0`  
`sudo groupadd -g 3000 container-group-0`  
`cut -d: -f1 /etc/passwd` -> to see all users

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

`echo "Hello, World!" | sudo tee -a /etc/message/message.txt`  -> The tee command reads from the standard input and writes to both standard output and one or more files at the same time. tee is mostly used in combination with other commands through piping. -a means append


