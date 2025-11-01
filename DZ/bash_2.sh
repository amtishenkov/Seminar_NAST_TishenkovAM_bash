if [ $# -ne 1 ]; then
	echo "Не указана новая директория для добавления в PATH или более 1 аргумента"
	exit 1
fi

dir="$1"

echo "Текущий PATH:"
echo "$PATH"

if [ ! -d "$dir" ]; then
	echo "Указанная директория не существует"
	exit 1
fi

export PATH="$PATH:$dir"

echo -e "Новый PATH:"
echo "$PATH"
