## SSH without passwords
open .ssh/config file, the add as follows - 
```Host server_name
  Hostname server_ip
  User admin
  Port 22
  IdentityFile ~/.ssh/directory/private_key 
```

before that create a private and public key in `directory` folder. Then install public key to the server. command is as follows 
`ssh-keygen`
`ssh-copy-id -i ~/directory/rsa.pub username@server_ip`

done, yolla. 