n=$(md5sum "$1"); l=$(cat "${1}.md5" 2>/dev/null); [ "$n" != "$l" ] && echo "Изменен"; echo "$n" > "${1}.md5"
