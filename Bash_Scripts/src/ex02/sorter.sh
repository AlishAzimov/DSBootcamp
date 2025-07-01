#!/bin/sh

input="../ex01/hh.csv"
output="hh_sorted.csv"

if [ ! -f "$input" ]; then # Проверяем: существует ли hh.csv
  echo "Error: $input not found."
  exit 1
fi

head -n 1 "$input" > "$output" # Извлекаем заголовок

tail -n +2 "$input" | sort -t ',' -k2,2 -k1,1 | cat >> "$output" # Сортируем данные без заголовка и добавляем их

if [ $? -eq 0 ]; then # Проверка успешности
  echo "Sorting completed successfully."
else
  echo "Sorting failed."
  exit 1
fi