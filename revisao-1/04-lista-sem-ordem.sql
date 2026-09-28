-- Chamado #1072 — lista da recepção
-- Pedido: placas em ordem alfabética. O script “funciona”, mas a ordem muda a cada execução.
-- Tarefa: a lista tem que ser estável e alfabética. Sem JOIN.

CREATE TABLE veiculo (
  id SERIAL PRIMARY KEY,
  placa VARCHAR(8) NOT NULL,
  modelo VARCHAR(40) NOT NULL
);

INSERT INTO veiculo (placa, modelo) VALUES
  ('IJK7L89', 'Civic'),
  ('ABC1D23', 'Gol'),
  ('EFG4H56', 'Onix');

SELECT placa, modelo
FROM veiculo;
