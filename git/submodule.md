## Create submodule 
In the root repository run following command 
```git submodule add https://github.com/<user>/submodule_repo_name submodule_repo_name```

Then run the following command 
```git submodule update --init --recursive```
Done

#### For new participants in the project
Normally we de ```git clone <project url>``` . Instead of that we should use ```git clone --recursive <project url>``` for submoduled projects. 
If unfortunatelly forgot to add ```--recursive``` , then you can run ```git submodule update --init --recursive``` this command and everything will be fine.

#### To update the submodule in appropriate commit 
```git submodule update```

#### Special Note
If you create a pull request from submodule: 
1. First merge the submoduled pull request
2. Then check out submodule in latest develop/master branch
3. Then again push submoduled update change from root module
4. Then merge the root module