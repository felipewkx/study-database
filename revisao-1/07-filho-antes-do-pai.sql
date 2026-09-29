-- Chamado #1102 — carga noturna
-- O job inseriu veículo antes do cliente. cliente_id 1 ainda não existe.
-- Hoje não há FOREIGN KEY, mas o assistente não grava órfão de propósito.
-- Tarefa: reordene a carga (e os INSERT) para o pai existir primeiro.

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

CREATE TABLE veiculo (
  id SERIAL PRIMARY KEY,
  placa VARCHAR(8) NOT NULL,
  cliente_id INTEGER NOT NULL
);

INSERT INTO veiculo (placa, cliente_id) VALUES
  ('ABC1D23', 1);

INSERT INTO cliente (nome) VALUES
  ('Ana Souza');

-- Correção:
-- O que estava errado: o veículo estava sendo inserido antes do cliente. Inverti a ordem dos INSERTs.

INSERT INTO cliente (nome) VALUES
  ('Ana Souza');

INSERT INTO veiculo (placa, cliente_id) VALUES
  ('ABC1D23', 1);