#!/bin/bash
token="7536328686:AAHRP7ZmeABygm8Eo5-LAXOw3yld93zXD5k"
chat_id="428522427"
offset=0

while true; do
	data=$(curl -s "https://api.telegram.org/bot$token/getUpdates?offset=$((offset+1))")
	new_offset=$(echo "$data" | grep -o '"update_id":[0-9]*' | tail -1 | grep -o '[0-9]*')
	if [ ! -z "$new_offset" ] && [ "$new_offset" -gt "$offset" ]; then
		MSG=$(echo "$data" | grep -o '"text":"[^"]*"' | tail -1 | sed 's/"text":"//;s/"//')
		[ "$MSG" = "Date" ] && curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" -d "chat_id=$chat_id" -d "text=$(date '+%d.%m.%Y')" > /dev/null
		[ "$MSG" = "Time" ] && curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" -d "chat_id=$chat_id" -d "text=$(date '+%H:%M:%S')" > /dev/null
		[ "$MSG" = "Hi" ] && curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" -d "chat_id=$chat_id" -d "text=Привет, кожаный" > /dev/null
        	offset=$new_offset
	fi
	sleep 2
done
