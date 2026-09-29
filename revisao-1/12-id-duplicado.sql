-- Chamado #1155 — choque de chave
-- Alguém forçou id = 1 duas vezes. A segunda linha não entra.
-- Tarefa: as duas pessoas têm que existir, cada uma com id próprio.
-- Prefira deixar o SERIAL gerar o id. Sem JOIN.

CREATE TABLE mecanico (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

INSERT INTO mecanico (id, nome) VALUES (1, 'Diego Alves');
INSERT INTO mecanico (id, nome) VALUES (1, 'Elisa Prado');

SELECT id, nome
FROM mecanico
ORDER BY nome;

-- Correção:
-- O que estava errado: id é PRIMARY KEY e não pode se repetir. Usei SERIAL e deixei o próprio banco gerar os IDs automaticamente.

DROP TABLE IF EXISTS mecanico;

CREATE TABLE mecanico (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

INSERT INTO mecanico (nome) VALUES 
  ('Diego Alves'),
  ('Elisa Prado');

SELECT id, nome
FROM mecanico
ORDER BY nome;