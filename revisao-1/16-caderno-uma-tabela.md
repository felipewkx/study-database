# 16 — Caderno numa tabela só

A oficina te entregou este caderno e pediu “vira banco”:

| nome       | telefone    | placa   | modelo | mecanico |
| ---------- | ----------- | ------- | ------ | -------- |
| Ana Souza  | 51980001111 | ABC1D23 | Gol    | Diego    |
| Ana Souza  | 51988881111 | EFG4H56 | Onix   | Diego    |
| Bruno Lima | 51980002222 | IJK7L89 | Civic  | Elisa    |

## Tarefa

Não crie uma tabela com essas cinco colunas.

1. Liste os **fatos** que se repetem sem necessidade.
2. Desenhe as tabelas (nome, colunas, PK). Tem 1:N?
3. Escreva o `CREATE TABLE` no PostgreSQL.
4. Em uma frase: o que aconteceria com o telefone da Ana se tudo ficasse numa tabela só?

Sem `JOIN` no SQL de hoje. `cliente_id` no veículo pode existir sem `FOREIGN KEY`.

-- Correção:

### 1. Fatos que se repetem sem necessidade:

- O nome da cliente "Ana Souza" aparece em duas linhas.
- O telefone da Ana aparece com números diferentes.
- O nome do mecânico "Diego" fica duplicado como texto solto em vez de ser um cadastro próprio.

### 2. Tabelas e Relacionamento (1:N):

- `cliente` (id PK, nome, telefone)
- `veiculo` (id PK, placa, modelo, cliente*id) -> \_1 Cliente tem N Veículos*
- `mecanico` (id PK, nome)

### 3. Scripts CREATE TABLE:

```sql
CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  telefone VARCHAR(20) NOT NULL
);

CREATE TABLE veiculo (
  id SERIAL PRIMARY KEY,
  placa VARCHAR(8) NOT NULL,
  modelo VARCHAR(40) NOT NULL,
  cliente_id INTEGER NOT NULL
);

CREATE TABLE mecanico (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);
```

### 4. Telefone duplicado:

- Os dois telefones ficariam espalhados em linhas diferentes, fazendo o sistema achar que o Gol e o Onix pertencem a duas "Anas" distintas em vez de uma cliente com dois números.
