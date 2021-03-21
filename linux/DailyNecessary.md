## Add alias
Create a `.aliases` file and add all the necessary aliases.   

Then for `bash`, type `exec bash` then open the `.bashrc`(`vim ~/.bashrc`) file and add the following program -   
```
if [ -f ~/.aliases ]; then
        . ~/.aliases
fi
```

then `source ~/.bashrc` run this command.   

For `zsh`, type `exec zsh` the open `.zshrc` (`vim ~/.zshrc`) file and add the following line -   
`source $HOME/.aliases
`