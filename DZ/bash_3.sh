read -p "Число: " number

if [ "$number" -gt 0 ]; then
	echo "Положительное"
elif [ "$number" -lt 0 ]; then
	echo "Отрицательное"
else
	echo "Ноль"
fi

if [ "$number" -gt 0 ]; then
	counter=1
		while [ "$counter" -le "$number" ]; do
			echo "$counter"
			((counter++))
		done
fi
