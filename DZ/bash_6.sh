ls "$1" 2> error.log && {
	cat "$1"
	wc -l "$1" > output.txt
}
