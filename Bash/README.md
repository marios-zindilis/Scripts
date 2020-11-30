BASH Scripts
============

is_ip.sh
--------
A function that checks if the parameter passed is an IP Address. It 
exits with code 0 if it is, code 1 if it is not. For a more verbose 
version, see validate_ip.sh.

ping_c_class.sh
---------------
Accepts an IP as parameter, pings all hosts in the Class C subnet in
which that IP belongs and prints a report.

re_ip.sh
--------
A function that checks if the parameter passed is an IP Address, using
a regular expression. Exits with code 0 if it is, 1 if it is not.

validate_ip.sh
--------------
A function that checks if the parameter passed is a valid IP Address,
meant to be used for user input validation. For a version that only
returns True/False, see is_ip.sh.

## ResizeAll ##

A Nautilus plugin to resize all pictures in a directory.

