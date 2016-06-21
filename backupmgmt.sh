#!/bin/bash

function backup {
    fromDir=$1
	toDir=$2
	isTar=$3
	if [ ${isTar^^} == "Y" ]; then
		tar -cpf $toDir $fromDir
	else
		cp $fromDir $toDir
	fi
	echo ">>> Zurück zum Menü, irgendeine Taste drücken <<<"
	read -n 1 
}

while true; do
	clear
	echo
	echo '            ____             __             '
	echo '           / __ )____ ______/ /____  ______ '
	echo '          / __  / __ `/ ___/ //_/ / / / __ \ '
	echo '         / /_/ / /_/ / /__/ ,< / /_/ / /_/ /'
	echo '        /_____/\__,_/\___/_/|_|\__,_/ .___/ '
	echo '                                   /_/      '
	echo '                                     ____                   '
	echo '     _   _____  ______      ______ _/ / /___  ______  ____ _'
	echo '    | | / / _ \/ ___/ | /| / / __ `/ / __/ / / / __ \/ __ `/'
	echo '    | |/ /  __/ /   | |/ |/ / /_/ / / /_/ /_/ / / / / /_/ / '
	echo '    |___/\___/_/    |__/|__/\__,_/_/\__/\__,_/_/ /_/\__, /  '
	echo '                                                   /____/   '
	echo '  (1) Backup erstellen'
	echo '   (2) Backup vom Home Verzeichnis erstellen'
	echo '    (x) Exit '

	read -n 1 selection
	echo -ne "\r" # remove input
	
	case $selection in
		1) 
			echo 'Von welchem Verzeichnis/Datei soll ein Backup erstellt werden?'
			read fromDir
			echo 'Soll das backup in eine tar Datei gepackt werden? y=yes'
			read -n 1 isTar
			
			if [ ${isTar^^} == "Y" ]; then
				echo 'Mit welchen Pfad + Dateinamen soll der tar Datei gespeichert werden'
			else
				echo 'In welchem Verzeichnis soll das Backup geschpeichert werden?'
			fi
		
			read toDir
			
			
			backup $fromDir $toDir $isTar
		;;
		2) 
			backup ~ /backup/$USER.$DATE.tar Y
		;;
		x) 
			exit;
		;;
	esac
done;