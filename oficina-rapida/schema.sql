-- Oficina Rápida: Criação das tabelas
-- Aluno: Felipe Walker

CREATE TABLE cliente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT NOT NULL
);

CREATE TABLE veiculo (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    placa TEXT NOT NULL,
    modelo TEXT NOT NULL,
    cliente_id INTEGER NOT NULL
);

CREATE TABLE mecanico (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);