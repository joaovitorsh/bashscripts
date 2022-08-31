#!/usr/bin/env bash
#
# listUsers.sh - Extracts users from /etc/passwd
#
# Site:       https://github.com/joaovitorsh
# Autor:      João Vítor
# Manutenção: João Vítor
#
# ------------------------------------------------------------------------ #
#  It will extract the users from /etc/passwd, with the possibility of putting 
#  in capitalized and alphabetical order.
#
#  Exemplos:
#      $ ./listUsers.sh -s -m
#      In this example it will be capitalized and in alphabetical order.
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 31/08/2022, João Vítor:
#       - Add -s, -h, -v
#	v1.1 31/08/2022, João Vítor:
#		- Change IF to CASE
#		- Add basename
#	v1.2 31/08/2022, João Vítor:
#		- Add -m
#		- Add 2 flags
#	v1.3 31/08/2022, João Vítor:
#		- Add while with shift and variable testing
#		- Add 2 flags
# ------------------------------------------------------------------------ #
# Tetesd on:
#   bash 5.1.16(1)-release	
# ------------------------------------------------------------------------ #

# ------------------------------- VARIABLES ----------------------------------------- #

USERS="$(cat /etc/passwd | cut -d : -f 1)"
MESSAGE_USE="
 $( basename $0) - [OPTIONS]
	
	-h - Help menu
	-v - Version
	-s - Order output
	-m - Capitalize all
"
VERSION="v1.3"
KEY_ORDERS=0
KEY_CAPITALIZE=0
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUTION ----------------------------------------- #

while test -n "$1"
do
 case "$1" in
  -h) echo "$MESSAGE_USE" && exit 0                 ;;
  -v) echo "$VERSION" && exit 0                     ;;
  -s) KEY_ORDERS=1                                  ;;
  -m) KEY_CAPITALIZE=1                              ;;
   *) echo "Opção inválida, valide o -h." && exit 1 ;;
 esac
 shift
done

[ $KEY_ORDERS -eq 1 ]     && USERS=$(echo "$USERS" | sort)
[ $KEY_CAPITALIZE -eq 1 ] && USERS=$(echo "$USERS" | tr [a-z] [A-Z])

echo "$USERS"
# ------------------------------------------------------------------------ #
