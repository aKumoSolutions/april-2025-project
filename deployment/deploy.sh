#!/bin/bash

branch=main
repo=https://github.com/aKumoSolutions/april-2025-project.git
dir=april-2025-project
for file in $dir ; do
      git pull origin $branch || chmod 777  
      if [ $? = 0 ]; then 
	     cp -r april-2025-project/*  /var/www/html/ | echo "Pulling was succesfull"
     else 
	echo "there is some error with your script" 
      fi 
done       

