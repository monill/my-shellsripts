#!/bin/bash

#Need to put this file in /bin and run as command

#Convert UPPERCASE files and directories do lowercase
#First convert files/directories in main root

for foo in *; do
    if [[ ! -a "`echo $foo | tr /[A-Z]/ /[a-z]/`" ]]; then
        mv "$foo" "`echo $foo | tr /[A-Z]/ /[a-z]/`"
        #Alter the contents of foo, if it is a directory, second part does inside it
        foo=`echo $foo | tr /[A-Z]/ /[a-z]/`
    fi
    #It does with the contents of each directory.
    if [[ -d $foo ]]; then
        echo "entering $foo"
        cd $foo
        converter.sh
        echo "leaving $foo"
        cd ..
    fi
done
