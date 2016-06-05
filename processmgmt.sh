#!/bin/bash
while true; do
	clear
	echo 
	echo '             ____                                  '
	echo '            / __ \_________  ____  ___  __________ '
	echo '           / /_/ / ___/ __ \/_  / / _ \/ ___/ ___/ ' 
	echo '          / ____/ /  / /_/ / / /_/  __(__  |__  )  '
	echo '         /_/   /_/   \____/ /___/\___/____/____/   '                        
	echo '                                     ____                   '
	echo '     _   _____  ______      ______ _/ / /___  ______  ____ _'
	echo '    | | / / _ \/ ___/ | /| / / __ `/ / __/ / / / __ \/ __ `/'
	echo '    | |/ /  __/ /   | |/ |/ / /_/ / / /_/ /_/ / / / / /_/ / '
	echo '    |___/\___/_/    |__/|__/\__,_/_/\__/\__,_/_/ /_/\__, /  '
	echo '                                                   /____/   '
	echo
	echo
	echo '  (1) Prozesse anzeigen'
	echo '   (2) Prozesse mit einem bestimmten Namen anzeigen'
	echo '    (3) Prozess TÖTEN'
	echo '     (x) exit'
	echo 
	echo 

	read -n 1 selection
	
	case $selection in
		1) 
			ps aux
			
			echo ">>> Zurück zum Menü, irgendeine Taste drücken <<<"
			read -n 1 uselessvariable
			
		;;
		2)
			echo "Welcher Name soll der Prozess enthalten?"
			read name
			ps aux|grep $name
			
			echo ">>> Zurück zum Menü, irgendeine Taste drücken <<<"
			read -n 1 uselessvariable
		;;
		3)
			ps aux
			echo
			echo "Welcher Prozess soll getötet werden? (ID)"
			read process
			kill -9 $process
		;;
		"x") exit; ;;
	esac
done
