#!bin/bash

echo "Installing Requirements" | lolcat -as 10
apt update -y
apt upgrade -y
apt install python
apt install openssl
apt install openssl-tool
pip install lolcat

echo "[-]This is a simple password generator.
[-]You can generate password of any length with this tool"
read -p "[+]Enter the length of your password: " passl || lolcat -as 10

echo "[-]To generate password with hexadecimal algorithm type hex
[-]To generate password with base64 algorithm type base64."
echo "[-]To know the difference between hex & base64 visit README.md"
read -p "[+]Which algorithm you wanna use?: " alg || lolcat -as 10

read -p "[+]How many passsword you wanna generate?: " itm || lolcat -as 10

case $alg in
	[bB][aA][sS][eE][6][4])
		touch base64_pass.txt
		for p in $(seq 1 $itm);
		do
			openssl rand -$alg 48 | cut -c1-$passl >> base64_pass.txt
		done
		echo "Check the file named base64_pass.txt" | lolcat -as 10
		;;
	[hH][eE][xX])
		touch hex_pass.txt
		for p in $(seq 1 $itm);
                do
                        openssl rand -$alg 48 | cut -c1-$passl >> hex_pass.txt
                done
                echo "Check the file named hex_pass.txt" | lolcat -as 10
		;;
	*)
		echo "Invalid Input" | lolcat -as 10
		exit 1
		;;
esac

echo "Thanks for using my tool" | lolcat -as 10
