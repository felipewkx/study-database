# 19 — Loja de peças

O balcão anota numa linha só: “filtro do Gol, fornecedor AutoSul, R$ 45”.

## Tarefa

1. Duas entidades em 1:N: `fornecedor` e `peca` (cada peça tem um fornecedor).
2. `CREATE TABLE` + pelo menos 2 fornecedores e 4 peças.
3. Duas perguntas em português, cada uma com `SELECT` + `WHERE` e/ou `ORDER BY`.

Sem `JOIN`. Sem terceira entidade.

Pasta sugerida: `loja-pecas/` (`er.md`, `schema.sql`, `massa.sql`, `consultas.sql`).

-- Correção:

- 1 e 2. Criação das Tabelas e Carga de Dados:

```sql
-- schema.sql
CREATE TABLE fornecedor (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  telefone VARCHAR(20)
);

CREATE TABLE peca (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  preco NUMERIC(10, 2) NOT NULL,
  fornecedor_id INTEGER NOT NULL
);

-- massa.sql
INSERT INTO fornecedor (nome, telefone) VALUES
  ('AutoSul', '5133331111'),
  ('Peças RS', '5133332222');

INSERT INTO peca (nome, preco, fornecedor_id) VALUES
  ('Filtro do Gol', 45.00, 1),
  ('Pastilha de Freio', 80.00, 1),
  ('Vela de Ignição', 25.00, 2),
  ('Filtro de Ar', 35.00, 2);


```

- 3: Pergunta 1: Quais peças custam mais de 40 reais, ordenadas pelo preço do mais caro para o mais barato?
  SELECT nome, preco, fornecedor_id
  FROM peca
  WHERE preco > 40.00
  ORDER BY preco DESC;

-- Pergunta 2: Quais são as peças cadastradas do fornecedor AutoSul (fornecedor_id = 1)?
SELECT nome, preco
FROM peca
WHERE fornecedor_id = 1
ORDER BY nome ASC;
