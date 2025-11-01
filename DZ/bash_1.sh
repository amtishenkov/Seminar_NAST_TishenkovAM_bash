if [ $# -ne 1 ]; then
	echo "Не указано имя файла в качестве аргумента"
	exit 1
fi

target_file="$1"

echo "Список файлов в текущей директории:"
for file in *; do
	if [ -f "$file" ]; then
		type="файл"
	elif [ -d "$file" ]; then
		type="директория"
	else
		type="другой"
	fi
	echo "   $type: $file"
done

echo -e "Проверка файла '$target_file':"
if [ -e "$target_file" ]; then
	echo "Файл существует"
else
	echo "Файл не существует"
fi

echo -e "Права доступа:"
for file in *; do
	if [ -e "$file" ]; then
		perms=$(stat -c "%A" "$file" 2>/dev/null || ls -ld "$file" | awk '{print $1}')
		echo "   $file: $perms"
	fi
done
