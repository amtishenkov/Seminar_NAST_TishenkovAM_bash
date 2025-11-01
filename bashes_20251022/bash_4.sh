ping -c 1 -W 1 $1 > /dev/null 2>&1 && echo "Доступен" || echo "Недоступен"
