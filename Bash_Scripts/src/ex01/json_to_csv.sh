#!/bin/sh


if [ ! -f "../ex00/hh.json" ]; then # Проверка: существует ли файл hh.json в папке ex00/
  echo "Error: hh.json not found in ../ex00/"
  exit 1
fi


jq -f filter.jq ../ex00/hh.json > hh.csv # Запускаем фильтрацию


if [ $? -eq 0 ]; then # Проверяем успешность выполнения
  echo "Converted to CSV successfully."
else
  echo "Conversion failed."
  exit 1
fi