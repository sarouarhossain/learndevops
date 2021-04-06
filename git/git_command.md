### Squash
* `git rebase -i HEAD~n` -> n is the number of commits to be squashed  
* `s` -> for squash  
* `#` -> comment out unnecessary comments
* `git push origin branch_name -f` -> force push

### Rebase Master/Develop
* pull the target branch (master/develop)  
* `git rebase -i origin/master`  
* resolve conflict  
* `git add .`  
* `git rebase --continue`  
* conflict resolve
* `git add .`
.  
.  
.  
* `git push origin branch_name -f`  

