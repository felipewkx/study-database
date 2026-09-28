-- Oficina Rápida: Consultas de Verificação
-- Aluno: Felipe Walker

-- 1. Clientes em ordem alfabética de nome
SELECT id, nome, telefone 
FROM cliente 
ORDER BY nome ASC;

-- 2. Veículos pertencentes à cliente Ana (cliente_id = 1)
SELECT id, placa, modelo, cliente_id 
FROM veiculo 
WHERE cliente_id = 1;

-- 3. Mecânicos cujo nome começa com a letra 'E'
SELECT id, nome 
FROM mecanico 
WHERE nome LIKE 'E%';