token="7536328686:AAHRP7ZmeABygm8Eo5-LAXOw3yld93zXD5k"
chat_id="428522427"
message="$1"

curl -s -X POST "https://api.telegram.org/bot$token/sendMessage" \
	-d chat_id="$chat_id" \
	-d text="$message" \
	-d parse_mode="Mardown" > /dev/null
