-- Chamado #1170 — alguém criou a coluna entre aspas
-- CREATE usou "Nome". O SELECT nome (minúsculo, sem aspas) não acha a coluna.
-- Tarefa: o SELECT tem que achar o nome. Ou recrie a tabela sem aspas nos identificadores.
-- Sem JOIN.

DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  "Nome" VARCHAR(80) NOT NULL
);

INSERT INTO cliente ("Nome") VALUES ('Ana Souza');

SELECT nome
FROM cliente;

-- Correção:
-- O que estava errado: usar aspas duplas ("Nome") força o banco a diferenciar maiúsculas de minúsculas. Fiz sem aspas.

DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

INSERT INTO cliente (nome) VALUES ('Ana Souza');

SELECT nome
FROM cliente;