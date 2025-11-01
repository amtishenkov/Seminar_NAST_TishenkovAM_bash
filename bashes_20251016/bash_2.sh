read -p "Введите полный путь к файлу: " file_path

if [ -f "$file_path" ]; then
	echo "Файл найден"
else
	echo "Файл не найден"
fi
