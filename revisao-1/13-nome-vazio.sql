-- Chamado #1162 — ficha sem nome
-- A planilha veio com célula vazia. NOT NULL recusou a carga inteira.
-- Tarefa: só entram linhas com nome. A linha vazia fica de fora (ou vira um valor que você justifique).
-- Sem JOIN. Sem apagar a regra NOT NULL — ela está certa.

CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  telefone VARCHAR(20)
);

INSERT INTO cliente (nome, telefone) VALUES
  ('Ana Souza', '51980001111'),
  (NULL, '51980009999'),
  ('Bruno Lima', '51980002222');

-- Correção: Substituí o INSERT NULL por uma string de identificação padrão (Justificativa: Salva o telefone para o suporte ligar e descobrir o nome)

INSERT INTO cliente (nome, telefone) VALUES 
('Ana Souza', '51980001111'),
('NOME NÃO INFORMADO NA PLANILHA', '51980009999'),
('Bruno Lima', '51980002222');

