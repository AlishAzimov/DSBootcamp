#!/bin/sh

INPUT="../ex03/hh_positions.csv"
OUTPUT="hh_uniq_positions.csv"

# Проверка наличия входного файла
if [ ! -f "$INPUT" ]; then
  echo "Error: $INPUT not found."
  exit 1
fi

# Пишем заголовок
echo "\"name\",\"count\"" > "$OUTPUT"

# Обработка данных
tail -n +2 "$INPUT" \
| awk -F ',' '{ print $3 }' \
| tr -d '"' \
| sort \
| uniq -c \
| sort -nr \
| awk '{ print "\"" $2 "\",\"" $1 "\"" }' \
>> "$OUTPUT"

# Проверка успешности последней команды
if [ $? -eq 0 ]; then
  echo "Counting completed successfully."
else
  echo "Error: Counting failed."
  exit 1
fi
