#!/bin/bash

MY_PATH="`dirname \"$0\"`"

while true; do
	clear
	echo 
	echo '            ___       __          _       __              __'
	echo '           /   | ____/ /___ ___  (_)___  / /_____  ____  / /'
	echo '          / /| |/ __  / __ `__ \/ / __ \/ __/ __ \/ __ \/ / '
	echo '         / ___ / /_/ / / / / / / / / / / /_/ /_/ / /_/ / /  '
	echo '        /_/  |_\__,_/_/ /_/ /_/_/_/ /_/\__/\____/\____/_/   '
	echo
	echo
	echo
	echo '  (1) Benutzerverwaltung'
	echo '   (2) Berechtigungsverwaltung'
	echo '    (3) Packageverwaltung'
	echo '     (4) Backupverwaltung'
	echo '      (5) Prozessverwaltung'
	echo '       (6) Hardwareverwaltung'
	echo '        (7) Cronjobverwaltung'
	echo '         (x) exit'
	echo 
	echo 

	read -n 1 selection

	case $selection in
		1) $MY_PATH/usermgmt.sh; ;;
		2) $MY_PATH/permmgmt.sh; ;;
		3) $MY_PATH/packagemgmt.sh; ;;
		4) $MY_PATH/backupmgmt.sh; ;;
		5) $MY_PATH/processmgmt.sh; ;;
		6) $MY_PATH/hardwaremgmt.sh; ;;
		7) $MY_PATH/cronmgmt.sh; ;;
		"x") exit; ;;
	esac
done
