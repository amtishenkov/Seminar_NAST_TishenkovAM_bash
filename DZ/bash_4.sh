Hello() {
	echo "Hello, $1"
}

summa() {
	echo $(($1+$2))
}

Hello "$1"
echo "Сумма: $(summa "$2" "$3")"
