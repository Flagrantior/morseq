#/bin/bash
# flagrantior@gmail.com
# Script for train your Morse knowledge

morze=(
	A ".-"
	B "-..."
	C "-.-."
	D "-.."
	E "."
	F "..-."
	G "--."
	H "...."
	I ".."
	J ".---"
	K "-.-"
	L ".-.."
	M "--"
	N "-."
	O "---"
	P ".--."
	Q "--.-"
	R ".-."
	S "..."
	T "-"
	U "..-"
	V "...-"
	W ".--"
	X "-..-"
	Y "-.--"
	Z "--.."

	0 "-----"
	1 ".----"
	2 "..---"
	3 "...--"
	4 "....-"
	5 "....."
	6 "-...."
	7 "--..."
	8 "---.."
	9 "----."
	
	. ".-.-.-"
	, "--..--"
	? "..--.."
)

GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

printf "
0) print alphabet
1) Morse to letter
2) letter to Morse

MODE: "
read -n1 mode;
printf "\n"
case $mode in
	0) for (( i=0; i<${#morze[*]}; i+=2 )); do
		printf "${morze[i]} ${morze[i+1]}\n"
	done ;;

	1) while true; do
		l=$(( $(shuf -i 1-${#morze[*]} -n 1) -1 )); l=$(( l - l%2 ))
		printf -- "${morze[l+1]} "
		while read -n1 c; do
			case "$c" in
				.) play -qn synth .05 sin 440;;
				-) play -qn synth .2 sin 440;;
			esac
		done < <(echo -n "${morze[l+1]}")
		read -sn1 a
		a=${a^^}
		if [[ $a == ${morze[l]} ]]; then
			printf "${GREEN}$a${NC}\n"
		else
			printf " ${RED}$a${NC} ${morze[l]}\n"
		fi
	done ;;

	2) while true; do
		l=$(( $(shuf -i 1-${#morze[*]} -n 1) -1 )); l=$(( l - l%2 ))
		printf -- "${morze[l]} "
		read a
		if [[ $a == ${morze[l+1]} ]]; then
			printf " ${GREEN}${morze[l+1]}${NC}\n"
		else
			printf " ${RED}${morze[l+1]}${NC}\n"
		fi
	done ;;
esac

