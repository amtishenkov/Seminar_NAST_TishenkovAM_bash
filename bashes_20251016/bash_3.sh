\read -p "Введите полный путь к директории: " dir_path

if [ ! -d "$dir_path" ]; then
	echo "Директория не найдена"
	exit 1
fi
tar -czf "backup_$(date +%Y-%m-%d).tar.gz" -C "$(dirname "$dir_path")" "$(basename "$dir_path")"
