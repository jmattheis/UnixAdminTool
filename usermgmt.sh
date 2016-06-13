#!/bin/bash

function userView {
	title
	echo 'Eingeloggte Nutzer:'
	w
	echo ''
	echo 'Alle Nutzer:'
	cut -d: -f1 /etc/passwd
	read -n 1
}

function groupView {
	echo 'Alle Gruppen:'
	cut -d: -f1 /etc/group
	read -n 1
}

function userCreate {
	echo 'Geben Sie den Nutzernamen ein:'
	read username

	if ! id "$username" >/dev/null 2>&1; then
		echo "Möchten Sie ein Homeverzeichnis für $username erstellen? (J=Ja)"
		read homedir -n 1
		if [ ${homedir^^} == "J" ]; then
			useradd $username -m
		else
			useradd $username
		fi
		passwd $username
	else
		echo 'Nutzer existiert bereits!'
	fi
	read -n 1
}

function userChangeName {
	echo "Geben Sie den neuen Nutzernamen für $1 ein:"
	read newusername

	usermod -l $newusername $1
	read -n 1
}

function userChangePassword {
	passwd $username
	read -n 1	
}

function userChangeNewHome {
	echo 'Geben Sie den Pfad für das neue Home-Verzeichnis ein:'
	read directory
	if [ -d "$directory" ]; then
	echo 'Soll der Inhalt des aktuellen Home-Verzeichnisses in das neue Home-Verzeichnis verschoben werden? (J=Ja)'
	read moveHome -n 1
	echo -ne "\r" # remove input

		if [ ${moveHome^^} == "J" ]; then
			usermod -d $directory -m $1
		else
			usermod -d $directory $1
		fi
	fi
	read -n 1
}

function userAddGroup {
	userListGroups

	read -n 1
}

function userRemoveGroup {
	userListGroups

	read -n 1
}

function userListGroups {
	echo "Aktuelle Gruppen von $1:"
	groups $1	
}

function userChange {
	echo 'Geben Sie den aktuellen Nutzernamen ein:'
	read username
	
	if id "$username" >/dev/null 2>&1; then
		echo "Was möchten Sie für $username ändern?"
		echo '  (1) Nutzername'
		echo '   (2) Passwort'
		echo '    (3) Neues Homeverzeichnis'
		echo '     (4) Gruppenzugehörigkeit hinzufügen'
		echo '      (5) Gruppenzugehörigkeit entfernen'
		read -n 1 selection
		echo -ne "\r" # remove input

		case $selection in
		1) userChangeName $username; ;;
		2) userChangePassword $username; ;;
		3) userChangeNewHome $username; ;;
		4) userAddGroup $username; ;;
		5) userRemoveGroup $username; ;;
		esac
	else
		echo 'Nutzer existiert nicht!'
	fi

	read -n 1
}

function userDelete {
	echo 'Geben Sie den Nutzernamen des zu löschenden Nutzers ein:'
	read delusername

	if id "$delusername" >/dev/null 2>&1; then
	# Möchte man für Shell-Skripte nur den Rückgabewert eines Programms verwenden und somit 	  sämtliche Ausgaben nach /dev/null umleiten, kann die folgende Syntax verwendet werden: 		  >/dev/null 2>&1
		echo 'Möchten Sie das Home-Verzeichnis und den Mailspool entfernen? (J=Ja)'
		read delhome
		if [ ${delhome^^} == "J" ]; then
			userdel -r $delusername
		else
			userdel $delusername
		fi
		
	else
		echo 'Nutzer existiert nicht!'
	fi

	read -n 1
}

function groupCreate {
	echo 'Geben Sie den Gruppennamen ein:'
	read groupname

	if ! grep ^$groupname: /etc/group >/dev/null 2>&1; then
		echo 'Möchten Sie ein Passwort für die Gruppe festlegen? (J=Ja)'
		read password

		groupadd $groupname
		if [ ${password^^} == "J" ]; then
			gpasswd $groupname
		fi
	else
		echo 'Gruppe existiert bereits!'
	fi
	read -n 1
}

function groupChange {
	echo 'groupChange'
}

function groupDelete {
	echo 'groupDelete'
}

function userGroupAdd {
	echo 'userGroupAdd'
}

function userGroupDelete {
	echo 'userGroupDelete'
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
	echo '  (1) Benutzerübersicht'
	echo '   (2) Gruppenübersicht'
	echo '    (3) Benutzer erstellen'
	echo '     (4) Benutzer ändern'
	echo '      (5) Benutzer löschen'
	echo '       (6) Gruppe erstellen'
	echo '        (7) Gruppe ändern'
	echo '         (8) Gruppe löschen'
	echo '          (9) Benutzer einer Gruppe zuordnen'
	echo '           (a) Benutzer aus einer Gruppe entfernen'
	echo '            (x) Hauptmenü'
	title
	read -n 1 selection
	echo -ne "\r" # remove input
	
	case $selection in
		1) userView; ;;
		2) groupView; ;;
		3) userCreate; ;;
		4) userChange; ;;
		5) userDelete; ;;
		6) groupCreate; ;;
		7) groupChange; ;;
		8) groupDelte; ;;
		9) userGroupAdd; ;;
		a) userGroupDelete; ;;
		x) 
			exit;
		;;
	esac
done
