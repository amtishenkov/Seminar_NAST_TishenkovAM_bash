count=$(grep -o -w "$2" "$1" | wc -l)

echo $count
