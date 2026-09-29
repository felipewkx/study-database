-- Chamado #1051 — relatório para o WhatsApp
-- Pedido: telefone dos mecânicos em ordem de nome.
-- O colega usou o apelido que o Excel tinha. O Postgres recusou.
-- Tarefa: alinhe as colunas às que existem. Sem JOIN.

CREATE TABLE mecanico (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  telefone VARCHAR(20)
);

INSERT INTO mecanico (nome, telefone) VALUES
  ('Diego Alves', '51981110001'),
  ('Elisa Prado', '51981110002');

SELECT nome, celular
FROM mecanico
ORDER BY nome;

-- Correção:
-- O que estava errado: a coluna se chama telefone no banco, mas a consulta chamava celular.

SELECT nome, telefone
FROM mecanico
ORDER BY nome;