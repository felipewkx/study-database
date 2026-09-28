-- Chamado #1124 — tipo errado
-- Guardaram telefone como INTEGER. O zero à esquerda some; número grande pode estourar.
-- Tarefa: o telefone tem que entrar e sair como texto (incluindo o 0 inicial).
-- Recrie a tabela com o tipo certo e insira de novo. Sem JOIN.

DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  telefone INTEGER
);

INSERT INTO cliente (nome, telefone) VALUES
  ('Ana Souza', 051980001111);

SELECT nome, telefone
FROM cliente;
