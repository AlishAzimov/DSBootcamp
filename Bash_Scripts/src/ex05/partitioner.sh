#!/bin/sh

INPUT="../ex03/hh_positions.csv"

# Проверяем наличие входного файла
if [ ! -f "$INPUT" ]; then
  echo "Error: $INPUT not found."
  exit 1
fi

# Сохраняем заголовок в отдельную переменную
HEADER=$(head -n 1 "$INPUT")

tail -n +2 "$INPUT" | while IFS=, read -r id created_at name has_test alternate_url; do
  # Чисто извлекаем дату из created_at
  DATE=$(echo "$created_at" | cut -d 'T' -f 1 | cut -d '"' -f 2)
  OUTPUT="$DATE.csv"

  # Если файл ещё не существует — пишем заголовок
  if [ ! -f "$OUTPUT" ]; then
    echo "$HEADER" > "$OUTPUT"
  fi

  # Дописываем строку в файл
  echo "$id,$created_at,$name,$has_test,$alternate_url" >> "$OUTPUT"
done

echo "Partitioning completed successfully."