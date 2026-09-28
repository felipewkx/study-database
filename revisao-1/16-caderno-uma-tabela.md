# 16 — Caderno numa tabela só

A oficina te entregou este caderno e pediu “vira banco”:

| nome | telefone | placa | modelo | mecanico |
|------|----------|-------|--------|----------|
| Ana Souza | 51980001111 | ABC1D23 | Gol | Diego |
| Ana Souza | 51988881111 | EFG4H56 | Onix | Diego |
| Bruno Lima | 51980002222 | IJK7L89 | Civic | Elisa |

## Tarefa

Não crie uma tabela com essas cinco colunas.

1. Liste os **fatos** que se repetem sem necessidade.
2. Desenhe as tabelas (nome, colunas, PK). Tem 1:N?
3. Escreva o `CREATE TABLE` no PostgreSQL.
4. Em uma frase: o que aconteceria com o telefone da Ana se tudo ficasse numa tabela só?

Sem `JOIN` no SQL de hoje. `cliente_id` no veículo pode existir sem `FOREIGN KEY`.
