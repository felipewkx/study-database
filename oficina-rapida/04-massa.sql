-- Oficina Rápida: Inserção de dados iniciais
-- Aluno: Felipe Walker

-- Inserindo Clientes
INSERT INTO cliente (nome, telefone) VALUES ('Ana Souza', '51980001111');
INSERT INTO cliente (nome, telefone) VALUES ('Bruno Lima', '51980002222');
INSERT INTO cliente (nome, telefone) VALUES ('Carla Dias', '51980003333');

-- Inserindo Veículos vinculados aos clientes (Ana tem id 1, Bruno id 2, Carla id 3)
INSERT INTO veiculo (placa, modelo, cliente_id) VALUES ('ABC1D23', 'Gol', 1);
INSERT INTO veiculo (placa, modelo, cliente_id) VALUES ('EFG4H56', 'Onix', 1);
INSERT INTO veiculo (placa, modelo, cliente_id) VALUES ('IJK7L89', 'Civic', 2);
INSERT INTO veiculo (placa, modelo, cliente_id) VALUES ('MNO0P12', 'Ka', 3);

-- Inserindo Mecânicos
INSERT INTO mecanico (nome) VALUES ('Diego Alves');
INSERT INTO mecanico (nome) VALUES ('Elisa Prado');
INSERT INTO mecanico (nome) VALUES ('Fabio Nunes');