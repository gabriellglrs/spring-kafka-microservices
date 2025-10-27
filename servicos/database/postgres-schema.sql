-- ---------- Banco de Produtos ----------
CREATE DATABASE icomprasprodutos;

-- Conectar e criar tabela de produtos
\c icomprasprodutos;

CREATE TABLE produtos (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor_unitario DECIMAL(16,2) NOT NULL
);

-- ---------- Banco de Clientes ----------
CREATE DATABASE icomprasclientes;

\c icomprasclientes;

CREATE TABLE clientes (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    logradouro VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    telefone VARCHAR(20)
);

-- ---------- Banco de Pedidos ----------
CREATE DATABASE icompraspedidos;

\c icompraspedidos;

CREATE TABLE pedido (
    codigo SERIAL PRIMARY KEY,
    codigo_cliente INT NOT NULL,
    data_pedido TIMESTAMP NOT NULL DEFAULT NOW(),
    chave_pagamento TEXT,
    observacoes TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'REALIZADO' CHECK (
        status IN ('REALIZADO', 'PAGO', 'FATURADO', 'ENVIADO', 'ERRO_PAGAMENTO', 'PREPARANDO_ENVIO')
    ),
    total DECIMAL(16,2) NOT NULL,
    codigo_rastreio VARCHAR(255),
    url_nf TEXT
);

CREATE TABLE item_pedido (
    codigo SERIAL PRIMARY KEY,
    codigo_pedido INT NOT NULL,
    codigo_produto INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    valor_unitario DECIMAL(16,2) NOT NULL
);
