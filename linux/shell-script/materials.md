* [Target 1: Youtube list](https://www.youtube.com/playlist?list=PLH4mzrKSvtSL5-koYZlE9So24mL7VEaRX)
* [Target 2: Youtube link](https://www.youtube.com/watch?v=6ue2luv2I-Y)

## Lets Start
* All the shells available on your system
  `cat /etc/shells`  
*  `which bash` or `which sh` -> shows the path of bash or sh.  
*  `#! /bin/bash` or `#! /bin/sh` -> start a shell script with on of those.  
*  `cat > file_name.txt` -> whatever you write in the script will be save on the file.  
* multiline comment    
  ```
  : '
  multiline comment...
  multiline comment...'
  ```  
* If I have some comments and I also want to show those comments in the output.  HereDocDelemeter  
  ```
  cat << kreative
  some line 
  some line ...
  kreative
  ```  
  it will print those two lines in the console.  
  

### Script Input/Output
This Programme will expect 3 command line arguments and print them. 
```
#! /bin/bash
echo $1 $2 $3
```

For unlimited number of inputs 
```
#! /bin/bash
args=("$@")
for p in "${args[@]}"
do
  echo $p
done
```

#### Read from file
```
#! /bin/bash
while read line
do
  echo $line
done < "${1:-/dev/stdin}"
```
It will take file name as input from standard input. If not give a file name as input, it will consider the whole terminal as input. LOL

#### Standard output
```
#! /bin/bash
ls -al 1>output.txt 2>error.txt
```
Here 1 means standard output, 2 means standard error. 

```
#! /bin/bash
ls -al >file.txt 2>&1
```
or
```
#! /bin/bash
las -al >& file.txt 
```
One file will be used for standard input and output also

### Array
* Lets consider `args` is an array , to print all the elements of args -> `echo ${args[@]}` or `echo $@` , to print particular index element of an array -> `echo ${args[1]}`  
* Length of an array -> `echo $#` oe `echo ${#args[@]}`

### Conditional Statements 
Operators
-> `-eq` equals  
-> `-en` not equals  
-> `-gt` greater then  
-> `-lt` lower then  
-> `-ge` greater the equal  
-> `-le` less then equal  
-> `&&` `-a` both means and 
-> `||` `-o` both means or

* if-else Statement
  ```
  count=9
  if [ $count -gt 10 ]
  then 
          echo "value is greater then 10..."
  elif [ $count -le 10 ]
  then
          echo "value is less the 10..."
  else 
          echo "the is equal 10..."
  fi
  ```  

  ```
  #! /bin/bash
  age=12
  if [ "$age" -gt 10 ] && [ "$age" -lt 20 ]
  then 
          echo "value is greater then 10 and less then 20 "
  else 
          echo "the is equal meh!!!"
  fi  
  ```

  ```
  #! /bin/bash
  age=22
  if [ "$age" -lt 10  -o  "$age" -gt 20 ]
  then 
          echo "value is less then 10 or greater then 20 "
  else 
          echo "the is equal meh!!!"
  fi 
  ```

##### Switch Case
  ```
  name="Kalama"
  case $name in 
          "Rahim")
                  echo "Hello Rahim..lol"
                  ;;
          "Kalam")
                  echo "Hello Kalam .. lol"
                  ;;
          *)
                  echo "I don't know you .. lol"
  esac

  ```

### Loops

#### while
```
number=0
while [ $number -le 5 ]
do
  echo Number: $number
  number=$((number+1))
done
```

```
```

#### until
```
num=1;
until [ $num -gt 5 ]
do
  echo $num
  num=$((num+1)) 
done
```

#### for
```
# {start_limit_increament}
for i in {1..10..2}
do
  echo $i
done
```

Same
```
for (( i=1; i<=10; i++ ))
do
  echo $i
done
```

##### use of break command
```
for (( i=1; i<=10; i++ ))
do
  if [ $i -eq 5 ]
  then
    break
  fi	
  echo $i
done
```

##### use of continue command
```
#! /bin/bash
for (( i=1; i<=10; i++))
do
  if [ $i -eq 5 ] || [ $i -eq 8 ]
  then
    continue
  fi
  echo $i
done
```

#### Sequence 
```
seq 1 10 | while read i
do
  echo $i 
done
```

### BC
basic calculator
```
num=5;
echo $num+3|bc
```

### Sending output from one script to another script
test.sh
```
#! /bin/bash
MESSAGE="Hello world from roman"
export MESSAGE
./test1.sh
```

test1.sh
```
#! /bin/bash
echo "Message from test: $MESSAGE"
```

### String 
String match check
```
#! /bin/bash
echo "enter 1st string: "
read string1
echo "enter 2nd string: "
read string2

if [ "$string1" == "$string2" ]
then
	echo "Both String are same. "
else
	echo "Strings are not equal. "
fi
```