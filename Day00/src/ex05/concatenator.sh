#!/bin/sh

OUTPUT="hh_concatenated.csv"

# Удаляем файл, если он уже существует
if [ -f "$OUTPUT" ]; then
  rm "$OUTPUT"
fi

# Пишем заголовок
echo "\"id\",\"created_at\",\"name\",\"has_test\",\"alternate_url\"" > "$OUTPUT"

# Склеиваем все файлы *.csv, пропуская заголовок в каждом файле
for file in *.csv; do
  # Исключаем сам выходной файл из обработки
  if [ "$file" != "$OUTPUT" ]; then
    tail -n +2 "$file" >> "$OUTPUT"
  fi
done

# Проверка успешности
if [ $? -eq 0 ]; then
  echo "Concatenation completed successfully."
else
  echo "Error during concatenation."
  exit 1
fi