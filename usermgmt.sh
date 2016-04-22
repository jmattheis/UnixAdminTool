#!/bin/bash

function userView {
	clear
	title
	echo 'Eingeloggte Nutzer:'
	w
	read -n 1
}

function groupView {
	echo 'groupView'
}

function userCreate {
	echo 'userCreate'
}

function userChange {
	echo 'userChange'
}

function userDelete {
	echo 'userDelete'
}

function groupCreate {
	echo 'groupCreate'
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
	printf '%s\n%s\n%s\n'
}

end=false
until [$"end" = true]; do
	clear
	title
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
	echo '            (0) Hauptmenü'

	read -n 1 selection

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
		*) clear
		   end=true;
		   ./admin.sh; ;;
	esac
done
