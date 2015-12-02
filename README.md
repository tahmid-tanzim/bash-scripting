# Bash Scripting
Bash version(s)
- Ubuntu 12.04 - 4.2.25
  - `$ echo $BASH_VERSION`

### 1. What's Bash?
- Bourne Again SHell
- A popular interactive command line interpreter
- Informations on [BASH Project](http://tiswww.case.edu/php/chet/bash/bashtop.html)

### 2. Very basic commands
- Print name of current/working directory
  - `$ pwd`
- List directory contents
  - `$ ls -la`
- An interface to the on-line reference manuals 
  - `$ man ls`
- Make directories 
  - `$ mkdir <directory-name>`
- Clear the terminal screen 
  - `$ clear`
- Copy files and directories 
  - `$ cp ~/Downloads/hello.txt ~/Desktop/world.txt`
- Remove files or directories 
  - `$ rm ~/Downloads/hello.txt`
- Concatenate files and print on the standard output 
  - `$ cat ~/Desktop/world.txt`
- File perusal filter for crt viewing 
  - `$ more ~/Desktop/world.txt`
- Output the first part of files 
  - `$ head ~/Desktop/world.txt`
- Output the last part of files 
  - `$ tail ~/Desktop/world.txt`

### 3. Brace expansion
- `$ touch {apple,banana,cherry,durian}`
- `$ touch file_{01..100}.txt`
- `$ echo {0..100..5}`
- `$ echo {A..Z}`
- `$ echo {A..Z..2}`
- `$ echo {A..z}`
- `$ touch {apple,banana,cherry,durian}_{01..100}{w..d}`
- Word count
  - `$ ls -1 | wc -l`

### 4. Redirection
- `$ ls | more`
- `$ cp -v * ../otherFolder &> ../log.txt`

### 5. *grep* - Print lines matching a pattern
Enable grep color option auto - 
  - `$ export GREP_OPTIONS='--color=auto'`
- Search POST request from Log file
  - `$ grep --color=auto POST development.log`
- Case insensitive search
  - `$ grep -i post development.log`
- Extract specific item with awk. 
  - For e.g. Date from
    - ```Started GET "/rails/mailers/member_mailer/account_activation" for 127.0.0.1 at 2015-11-30 15:38:21 +0600```
  - `$ grep -i get development.log | awk {'print $7'}`
  - `$ ping -c 1 example.com`

### 6. Displaying text with 'echo'
```greetings="hello"

echo $greetings, world \(planet\)!
# OUTPUT: hello, world (planet)!

echo '$greetings, world (planet)!'
# OUTPUT: $greetings, world (planet)!

echo "$greetings, world (planet)!"
# OUTPUT: hello, world (planet)!```

### 7. Working with variables
```#!/bin/bash
# This is a basic bash script.
a=Hello
b="Good Morning"
c=14

echo $a
# OUTPUT: Hello

echo $b
# OUTPUT: Good Morning

echo $c
# OUTPUT: 14

echo "$b!, I have $c apples"
# OUTPUT: Good Morning!, I have 14 apples```
##### 7.1 Adding attributes to variables
```# d is an integer
declare -i d=123

# e is read-only
declare -r e=456

# f is lolcats
declare -l f="LOLCats"

# g is LOLCATS
declare -u g="LOLCats"```
##### 7.2 Built-in variables
```# Returns user home directory
echo $HOME

# Returns current directory
echo $PWD

# Returns machine type
echo $MACHTYPE

# Returns system name
echo $HOSTNAME

# Returns version of Bash
echo $BASH_VERSION

# Returns the number of seconds the Bash session has run
echo $SECONDS

# Returns the name of the script
echo $0```
More [Internal Variables](http://tldp.org/LDP/abs/html/internalvariables.html)

### 8. Command Substitution
```a=$(ping -c 1 example.com | grep 'bytes from' | cut -d = -f 4)
echo "The ping was $a"```

### 9. Arithmetic operations
```val=$(( expression ))```

Operation | Operator
--------- | ---------
Exponentiation | $a ** $b
Multiplication | $a * $b
Division | $a / $b
Modulo | $a % $b
Addition | $a + $b
Subtraction | $a - $b