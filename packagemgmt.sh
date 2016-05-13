#!/bin/bash

while true; do
	clear

	echo '            ____             __                  '
	echo '           / __ \____ ______/ /______ _____ ____ '
	echo '          / /_/ / __ `/ ___/ //_/ __ `/ __ `/ _ \ '
	echo '         / ____/ /_/ / /__/ ,< / /_/ / /_/ /  __/'
	echo '        /_/    \__,_/\___/_/|_|\__,_/\__, /\___/ '
	echo '                                    /____/       '
	echo '                                     ____                   '
	echo '     _   _____  ______      ______ _/ / /___  ______  ____ _'
	echo '    | | / / _ \/ ___/ | /| / / __ `/ / __/ / / / __ \/ __ `/'
	echo '    | |/ /  __/ /   | |/ |/ / /_/ / / /_/ /_/ / / / / /_/ / '
	echo '    |___/\___/_/    |__/|__/\__,_/_/\__/\__,_/_/ /_/\__, /  '
	echo '                                                   /____/   '
	printf '%s\n%s\n%s\n'
	echo '  (1) Packageübersicht'
	echo '   (2) Aktualisierbare Packages Übersicht'
	echo '    (3) Aktualisiere alle Packages'
	echo '     (4) Package aktualisieren'
	echo '      (5) Package installieren'
	echo '       (6) Package entfernen'
	echo '        (7) Zurück'
	echo 
	read -n 1 selection
    echo -ne "\r" # remove input
	
	case $selection in
		1)
			IFS=: read -ra dirs_in_path <<< "$PATH"

			cancel=false;
			index=0
			for dir in "${dirs_in_path[@]}"; do
				for file in "$dir"/*; do
					[[ -x $file && -f $file ]] && echo -e "${file##*/}"
					(( index+=1 ))
					if [ $index -gt 10 ]; then
					   echo -e ">>> Mehr anzeigen: irgendeine Taste drücken; q für Abbrechen <<<\c"
					   read -n 1 s
					   if [ "$s" == "q" ]; then
							cancel=true
							break;
						else
							echo -e "\033[1A"
							echo -ne "\033[2K"
							index=0
					   fi;
					fi
				done
				if [[ $cancel == true ]]; then
					break;
				fi
			done
			if [ $cancel != true ]; then
				while true; do
					echo "Alle Programme angezeigt; q für Abbrechen"
					read -n 1 isq
					if [[ $isq == "q" ]]; then
						break;
					fi;
				done
			fi
		;;
		2)
			apt-get update
			apt-get -u upgrade --assume-no
			echo "Irgendeine Taste drücken"
			read -n 1 uselessvariableisuseless
		;;
		3) 
			apt-get update
			apt-get upgrade
		;;
		4)
			echo "Welches Package soll geupdated werden?"
			read prog
			apt-get install --only-update $prog
		;;
		5)
			echo "Welches Package soll installiert werden?"
			read prog
			apt-get install $prog
		;;
		6) 
			echo "Welches Package soll entfernt werden?"
			read prog
			apt-get purge --auto-remove $prog
		;;
		?) 
			exit	
		;;
	esac
done
