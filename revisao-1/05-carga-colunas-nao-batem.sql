-- Chamado #1088 — carga da planilha de clientes
-- O estagiário exportou 3 colunas e o INSERT só declara 2. O servidor recusou.
-- Tarefa: faça a carga entrar. Sem inventar tabela nova.

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  telefone VARCHAR(20)
);

INSERT INTO cliente (nome, telefone) VALUES
  ('Ana Souza', '51980001111', 'ana@email.com'),
  ('Bruno Lima', '51980002222', 'bruno@email.com');

-- Correção:
-- O que estava errado: estavam passando o campo de e-mail mas a tabela não tinha essa coluna. Adicionei a coluna email com ALTER TABLE e adicionei no INSERT.

ALTER TABLE cliente ADD COLUMN email VARCHAR(100);

INSERT INTO cliente (nome, telefone, email) VALUES
  ('Ana Souza', '51980001111', 'ana@email.com'),
  ('Bruno Lima', '51980002222', 'bruno@email.com');