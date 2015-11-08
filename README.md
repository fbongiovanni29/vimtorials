IF FILE DOESNT RUN WITH **vim** COMMAND USE **vi** instead. 

This is a project I created to learn how to Script Vim in Ruby. It's built so anyone can drop in files and create a Vim based tutorial for anything! It opens up two windows, one for the file to display and another one for the tutorial steps/instructions. 

It only accepts three tutorial files currently to fix you must go into next.rb and extend the arrays.

The tutorial md files must be ordered by tut_one.md, tut_two.md, tut_three.md...

The display file can have any extension name, it looks for files with the file basename of *one.*, *two.*, *three.*...

To run first create a README.md file then run the command 
```$ vi README.md```
