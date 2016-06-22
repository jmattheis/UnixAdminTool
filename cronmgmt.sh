#!/bin/bash

function showAllCrontabs {
	for user in $(cut -f1 -d: /etc/passwd)
	do 
		echo ''
		echo "$user Begin"
		crontab -u $user -l
		echo "$user End"
	done
	read -n 1
}

function showUserCrontabs {
	echo 'Geben Sie den Namen des Nutzers ein:'
	read user
	crontab -u $user -l
	read -n 1
}

function changeCrontab {
	echo 'Geben Sie den Namen des Nutzers ein:'
	read user
	crontab -u $user -e
	read -n 1
}

function deleteCrontab {
	echo 'Geben Sie den Namen des Nutzers ein:'
	read user
	crontab -u $user -i -r
	read -n 1
}

function installFileAsCrontab {
	echo 'Für welchen Nutzer möchten Sie einen Crontab installieren?'
	read user
	echo 'Geben Sie den Dateipfad der zur installierenden Datei ein:'
	read filepath
	crontab -u $user $filepath
}

function title {
	
	printf '%s\n%s\n%s\n'
}

while true; do
	clear
	echo
	echo '            ____                   __                 '
	echo '           / __ )___  ____  __  __/ /_____  ___  _____'
	echo '          / __  / _ \/ __ \/ / / / __/_  / / _ \/ ___/'
	echo '         / /_/ /  __/ / / / /_/ / /_  / /_/  __/ /    '
	echo '        /_____/\___/_/ /_/\__,_/\__/ /___/\___/_/     '
	echo '                                     ____                   '
	echo '     _   _____  ______      ______ _/ / /___  ______  ____ _'
	echo '    | | / / _ \/ ___/ | /| / / __ `/ / __/ / / / __ \/ __ `/'
	echo '    | |/ /  __/ /   | |/ |/ / /_/ / / /_/ /_/ / / / / /_/ / '
	echo '    |___/\___/_/    |__/|__/\__,_/_/\__/\__,_/_/ /_/\__, /  '
	echo '                                                   /____/   '
	echo 
	echo '  (1) Alle Crontabs anzeigen'
	echo '   (2) Nutzerspezifische Cronjobs anzeigen'
	echo '    (3) Crontab bearbeiten'
	echo '     (4) Crontab löschen'
	echo '      (5) Datei als Crontab installieren'
	echo '       (x) Hauptmenü'
	title
	read -n 1 selection
	echo -ne "\r" # remove input
	
	case $selection in
		1) showAllCrontabs; ;;
		2) showUserCrontabs; ;;
		3) changeCrontab; ;;
		4) deleteCrontab; ;;
		5) installFileAsCrontab; ;;
		x) 
			exit;
		;;
	esac
done
