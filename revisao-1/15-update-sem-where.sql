-- Chamado #1188 — PARE ESTE SCRIPT
-- Um colega quer “corrigir o telefone da Ana”. O UPDATE não tem WHERE.
-- Se rodar assim, todos os clientes ficam com o mesmo número.
-- Tarefa: 1) não rode o UPDATE como está; 2) corrija para mudar SÓ a Ana;
-- 3) conferira com um SELECT depois.
-- Sem JOIN. Sem apagar a tabela.

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  telefone VARCHAR(20)
);

INSERT INTO cliente (nome, telefone) VALUES
  ('Ana Souza', '51980001111'),
  ('Bruno Lima', '51980002222'),
  ('Carla Dias', '51980003333');

UPDATE cliente
SET telefone = '51989990000';

SELECT id, nome, telefone
FROM cliente
ORDER BY id;

-- Correção:
-- O que estava errado: o UPDATE não possuía filtro WHERE, o que alteraria o telefone de todos os clientes da tabela.

UPDATE cliente
SET telefone = '51989990000'
WHERE nome = 'Ana Souza';

SELECT id, nome, telefone
FROM cliente
ORDER BY id;