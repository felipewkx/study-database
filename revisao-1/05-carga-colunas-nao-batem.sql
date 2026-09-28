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
