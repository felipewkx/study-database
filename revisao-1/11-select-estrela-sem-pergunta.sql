-- Chamado #1141 — pedido do chefe
-- “Me manda os clientes.” O estagiário mandou SELECT *.
-- O chefe quer: nome e telefone, só quem tem telefone preenchido, ordem de nome.
-- Tarefa: troque o SELECT * por uma consulta que responde essa pergunta. Sem JOIN.

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  telefone VARCHAR(20)
);

INSERT INTO cliente (nome, telefone) VALUES
  ('Carla Dias', NULL),
  ('Ana Souza', '51980001111'),
  ('Bruno Lima', '51980002222');

SELECT *
FROM cliente;
