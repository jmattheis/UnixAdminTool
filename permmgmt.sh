#!/bin/bash
while true; do
	clear
	echo 
	echo '    ____                      __    __  _       '                      
	echo '   / __ )___  ________  _____/ /_  / /_(_)___ ___  ______  ____ ______'
	echo '  / __  / _ \/ ___/ _ \/ ___/ __ \/ __/ / __ `/ / / / __ \/ __ `/ ___/'
	echo ' / /_/ /  __/ /  /  __/ /__/ / / / /_/ / /_/ / /_/ / / / / /_/ (__  ) '
	echo '/_____/\___/_/   \___/\___/_/ /_/\__/_/\__, /\__,_/_/ /_/\__, /____/  '
    echo '                                      /____/            /____/        '
	echo '                                     ____                   '
	echo '     _   _____  ______      ______ _/ / /___  ______  ____ _'
	echo '    | | / / _ \/ ___/ | /| / / __ `/ / __/ / / / __ \/ __ `/'
	echo '    | |/ /  __/ /   | |/ |/ / /_/ / / /_/ /_/ / / / / /_/ / '
	echo '    |___/\___/_/    |__/|__/\__,_/_/\__/\__,_/_/ /_/\__, /  '
	echo '                                                   /____/   '
	echo
	echo
	echo '  (1) Inhalt vom aktuellen Verzeichnis'
	echo '   (2) Setzen von einer Berechtigung'
	echo '    (3) Ändern vom Besitzer einer Datei/Ordner'
	echo '     (4) Ändern von der Gruppe einer Datei/Ordner'
	echo '      (x) exit'
	echo 
	echo 

	read -n 1 selection

	ls -la
	
	case $selection in
		1) 
			echo ">>> Zurück zum Menü, irgenteine Taste drücken <<<"
			read -n 1 x
		;;
		2)
			echo "Für welche Datei/Ordner soll die Berechtigung verändert werden?"
			read file
			echo "Welche Rechte soll die Datei/Ordner bekommen? z.B. 777"
			read berechtigung
			chmod $berechtigung $file
		;;
		3)
			echo "Für welche Datei/Ordner soll der Besitzer verändert werden?"
			read file
			echo "Wer soll der neue Besitzer sein?"
			read besitzer
			chown $besitzer $file
		;;
		4) 
			echo "Für welche Datei/Ordner soll die Gruppe verändert werden?"
			read file
			echo "Welche Gruppe soll es sein?"
			read grp
			chgrp $grp $file
		;;
		"x") exit; ;;
	esac
done