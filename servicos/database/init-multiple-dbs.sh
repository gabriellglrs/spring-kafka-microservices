#!/bin/bash
set -e
# Criação de múltiplos bancos de dados

for db in produtos_db pedidos_db clientes_db; do
  echo "Criando banco de dados: $db"
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE $db;
EOSQL
done
