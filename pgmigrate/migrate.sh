#!/bin/bash
POSTGRES_USER=postgres
POSTGRES_DB=library

# Выполняем все .sql файлы в правильном порядке
for sql_file in $(ls /migrations/*.sql | sort); do
  echo "Applying migration: $sql_file"
  psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f "$sql_file"
done

