-- Chamado #1093 — script colado do Excel
-- Os nomes foram colados sem aspas. O Postgres acha que Ana é coluna.
-- Tarefa: a carga tem que entrar. Sem JOIN.

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

INSERT INTO cliente (nome) VALUES
  (Ana Souza),
  (Bruno Lima);
