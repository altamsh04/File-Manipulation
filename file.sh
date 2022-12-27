#!/bin/bash
echo ""
echo ""
echo "********|---------------------------|********"
echo "********| File Manupulation In Bash |********"
echo "********|---------------------------|********"
echo ""
echo ""
echo "1.Search file or directory."
echo "2.Create or delete file or directory."
echo "3.Get or Set permission."
echo ""
echo ""
read -p "Enter your choice (1/2/3) : " ch

case $ch in
###1###
1)
echo
echo "***Search file or directory***"
echo
read -p "Enter File Name : " search

if [ -f $search ];
then 
	echo "File exist !"

elif [ -d $search ];
then
	echo "Directory exist"
else
	echo "Not exist !"
fi
;;

###2###
2)
echo
echo "***Create or delete file***"
echo

echo "1.Create file."
echo "2.Delete file."
read -p "Enter your choice : " ch2

	case $ch2 in 
	1)
	echo
	echo "***Create file***"
	echo
	read -p "Enter file name : " create
	if [ -f $create ];
	then
		echo "File already exist !"
	else
		$(touch $create)
		echo
		echo $(ls)
		echo
		echo "File created !"
	fi
	;;
	2)
	echo "***Delete file***"
	echo
	read -p "Enter file name : " delete
	if [ -f $delete ];
	then	
		$(rm $delete)
		echo	
		echo $(ls)
		echo
		echo "File deleted !"
	else
		echo "File not found !"
	fi
	;; 
	esac
;;

###3###
3)
echo
echo "***Get or set permission***"
echo

echo "1.Get Permission."
echo "2.Set Permission."
read -p "Enter your choice : " ch3

	case $ch3 in 
	1)
	echo
	echo "***Get Permission***"
	echo	
	read -p "Enter file name or directory : " per
	if [ -f $per ];
	then
		echo "$per permission is !"
		echo
		echo $(ls $per -l)
	elif [ -d $per ];
	then
		echo "$per permission is !"
		echo
		echo $(ls $per -l)
	else
		echo "Not found !"
	fi
	;;
	2)
	echo
	echo "***Set Permission***"
	echo		
	echo "1.Read"
	echo "2.Write"
	echo "3.Execute"
	echo "4.All"
	echo	
	read -p "Enter your choice : " ch4
	echo
	read -p "Enter file name or directory : " mod
	echo
	case $ch4 in 
	1)
	echo
	$(chmod 4 $mod)
	echo "Read permission set !"
	;;
	2)
	echo
	$(chmod 5 $mod)
	echo "Write permission set !"
	;;
	3)
	echo
	$(chmod 7 $mod)	
	echo "Execute permission set !"
	;;	
	4)
	echo
	$(chmod 777 $mod)	
	echo "All permission set !"
	;; 
	esac
;;
*)
	echo "Invalid choice !"
;;
esac
;;
esac
