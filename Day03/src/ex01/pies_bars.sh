#!/bin/bash

# Legend (цветные квадраты + текст)
echo
echo -e "\033[35m■\033[0m Pies (magenta)"
echo -e "\033[32m■\033[0m Bars (green)"
../ex00/azimov/bin/termgraph data.dat \
  --color "magenta" "green" \
  --width  100\
  --format "{:.2f}" \
  --delim " "