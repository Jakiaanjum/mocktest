#!/bin/bash
echo " enter u r age "
read age
if [ $age -le 13 ]
then 
	echo " child "
elif [ $age -eq 14 ]&&[ $age -ge 19 ]
then
	echo " u r teenager "
elif [ $age -ge 20 ]
then
	echo " u r adult "
else
	echo " oldage "
fi	
