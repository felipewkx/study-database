-- Chamado #1130 — placa Mercosul
-- VARCHAR(5) corta ABC1D23. O INSERT quebra ou a placa fica mutilada.
-- Tarefa: a placa inteira tem que caber (7 ou 8 caracteres). Sem JOIN.

DROP TABLE IF EXISTS veiculo;

CREATE TABLE veiculo (
  id SERIAL PRIMARY KEY,
  placa VARCHAR(5) NOT NULL,
  modelo VARCHAR(40) NOT NULL
);

INSERT INTO veiculo (placa, modelo) VALUES
  ('ABC1D23', 'Gol');

-- Correção:
-- O que estava errado: VARCHAR(5) é pequeno demais para placas padrão Mercosul/antigo (que usam de 7 a 8 dígitos). Mudei para VARCHAR(8).

DROP TABLE IF EXISTS veiculo;

CREATE TABLE veiculo (
  id SERIAL PRIMARY KEY,
  placa VARCHAR(8) NOT NULL,
  modelo VARCHAR(40) NOT NULL
);

INSERT INTO veiculo (placa, modelo) VALUES
  ('ABC1D23', 'Gol');