-- Chamado #1110 — cadastro de usuários do sistema
-- O colega criou a tabela user. No PostgreSQL isso é palavra reservada.
-- Tarefa: o CREATE tem que passar. Renomeie com critério (ex.: usuario). Sem JOIN.

CREATE TABLE user (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

INSERT INTO user (nome) VALUES ('admin');

SELECT nome FROM user;

-- Correção:
-- O que estava errado: USER é uma palavra reservada do SQL/PostgreSQL. Renomeei a tabela para usuario.

CREATE TABLE usuario (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

INSERT INTO usuario (nome) VALUES ('admin');

SELECT nome FROM usuario;