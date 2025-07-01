#!/bin/bash

# Профилирование с time.sleep(5)
python3 -m cProfile -s tottime financial.py 'MSFT' 'Total Revenue' > profiling-sleep.txt

# Профилирование без time.sleep(5)
python3 -m cProfile -s tottime financial.py 'MSFT' 'Total Revenue' > profiling-tottime.txt

# Профилирование с другой HTTP библиотекой
python3 -m cProfile -s tottime financial_enhanced.py 'MSFT' 'Total Revenue' > profiling-http.txt

# Профилирование по количеству вызовов
python3 -m cProfile -s ncalls financial_enhanced.py 'MSFT' 'Total Revenue' > profiling-ncalls.txt

# Сохраняем .prof файл для pstats
python3 -m cProfile -o profile.prof financial_enhanced.py 'MSFT' 'Total Revenue'

# Создаём pstats-cumulative.txt (TOP 5 по cumulative времени)
python3 -c "
import pstats
with open('pstats-cumulative.txt', 'w') as f:
    stats = pstats.Stats('profile.prof', stream=f)
    stats.sort_stats('cumulative').print_stats(5)
"