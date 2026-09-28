-- Chamado #1060 — “acha quem começa com Eli”
-- A busca com = não acha Elisa. Precisa de pedaço de texto.
-- Tarefa: corrija o filtro. Sem JOIN.

CREATE TABLE mecanico (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

INSERT INTO mecanico (nome) VALUES
  ('Diego Alves'),
  ('Elisa Prado'),
  ('Fabio Nunes');

SELECT nome
FROM mecanico
WHERE nome = 'Eli%'
ORDER BY nome;
