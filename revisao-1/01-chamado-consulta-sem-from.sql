-- Chamado #1044 — Assistente de BD
-- A recepção mandou: “lista os nomes dos clientes. O script do estagiário não roda.”
-- Tarefa: faça o SELECT executar. Não invente JOIN.
-- Entrega: este arquivo corrigido + comentário -- o que estava errado:

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  telefone VARCHAR(20)
);

INSERT INTO cliente (nome, telefone) VALUES
  ('Ana Souza', '51980001111'),
  ('Bruno Lima', '51980002222');

SELECT nome, telefone
cliente
ORDER BY nome;

-- Correção:
-- O que estava errado: faltou a palavra-chave FROM antes do nome da tabela (cliente).

SELECT nome, telefone
FROM cliente
ORDER BY nome;