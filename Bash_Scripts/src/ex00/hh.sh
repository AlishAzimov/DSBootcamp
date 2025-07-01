#!/bin/sh

if [ $# -eq 0 ]; then # Проверка на наличие аргумента
  echo "Invalid request: please provide a vacancy name as an argument." 
  echo "Example: ./hh.sh \"data scientist\""
  exit 1
fi

SEARCH="$*"

ENCODE=$(echo "$SEARCH" | sed 's/ /+/g') # Редактирование data убрать пробелы и вместо них ставит +

if curl -s "https://api.hh.ru/vacancies?text=$ENCODE&per_page=20"| jq .  > hh.json; then # Готово
  echo "Saved in hh.json"
else # Проверка на ошибку получение JSON от сервера
  echo "Request error during JSON processing"
  exit 1
fi