-- Chamado #1155 — choque de chave
-- Alguém forçou id = 1 duas vezes. A segunda linha não entra.
-- Tarefa: as duas pessoas têm que existir, cada uma com id próprio.
-- Prefira deixar o SERIAL gerar o id. Sem JOIN.

CREATE TABLE mecanico (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

INSERT INTO mecanico (id, nome) VALUES (1, 'Diego Alves');
INSERT INTO mecanico (id, nome) VALUES (1, 'Elisa Prado');

SELECT id, nome
FROM mecanico
ORDER BY nome;
