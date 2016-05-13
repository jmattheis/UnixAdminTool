#!/bin/bash

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
echo '     (4) Datensicherung'
echo '      (5) Prozessverwaltung'
echo '       (6) Hardwareverwaltung'
echo '        (7) Cronjobverwaltung'
echo '         (?) Something special?'
echo '          (x) exit'
echo 
echo 

read -n 1 selection

case $selection in
	1) ./usermgmt.sh; ;;
	2) ./permmgmt.sh; ;;
	3) ./packagemgmt.sh; ;;
	4) ./backupmgmt.sh; ;;
	5) ./processmgmt.sh; ;;
	6) ./hardwaremgmt.sh; ;;
	7) ./cronmgmt.sh; ;;
	"x") exit; ;;
	?) ./special.sh; ;;
esac

clear

./admin.sh






