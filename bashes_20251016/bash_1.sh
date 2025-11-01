read -p "Введите ваше имя: " name
read -p "Введите ваш возраст: " age

age_after_year=$((age+1))
echo "Привет, $name! Через год тебе будет $age_after_year лет."
