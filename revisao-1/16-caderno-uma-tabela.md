# 16 — Caderno numa tabela só

A oficina te entregou este caderno e pediu “vira banco”:

| nome       | telefone    | placa   | modelo | mecanico |
| ---------- | ----------- | ------- | ------ | -------- |
| Ana Souza  | 51980001111 | ABC1D23 | Gol    | Diego    |
| Ana Souza  | 51988881111 | EFG4H56 | Onix   | Diego    |
| Bruno Lima | 51980002222 | IJK7L89 | Civic  | Elisa    |

A Ana não tem dois telefones. O número mudou, e o caderno guardou as duas versões: `51980001111` na linha do Gol e `51988881111` na linha do Onix. As duas não valem ao mesmo tempo.

## Tarefa

Não crie uma tabela com essas cinco colunas.

1. Liste os **fatos** que se repetem sem necessidade.
2. Desenhe as tabelas (nome, colunas, PK). Tem 1:N?
3. Escreva o `CREATE TABLE` no PostgreSQL.
4. Em uma frase: o que aconteceria com o telefone da Ana se tudo ficasse numa tabela só?

Sem `JOIN` no SQL de hoje. `cliente_id` no veículo pode existir sem `FOREIGN KEY`.

---

## Correção:

### 1. Fatos que se repetem sem necessidade:

- O nome da cliente "Ana Souza" aparece duplicado em duas linhas diferentes.
- O nome do mecânico "Diego" fica repetido como texto solto em vez de ter seu próprio cadastro.
- O telefone antigo da Ana (`51980001111`) continua registrado na linha do Gol mesmo estando desatualizado e não sendo mais válido.

### 2. Tabelas e Relacionamento (1:N):

- `cliente` (id PK, nome, telefone) -> Guardará apenas o telefone atual e válido da Ana.
- `veiculo` (id PK, placa, modelo, cliente*id) -> 1 Cliente tem N Veículos.*
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

### 4. O que aconteceria com o telefone da Ana se tudo ficasse numa tabela só?

- **O Problema:** O telefone antigo da Ana continuaria ativo na linha do Gol mesmo estando desatualizado, fazendo o sistema exibir uma informação velha como se fosse válida hoje e gerando confusão na hora de ligar para a cliente.
- **A Solução:** Separamos o Cliente do Veículo. Agora o telefone fica salvo em um único lugar na tabela `cliente`. Quando ela muda de número, atualizamos apenas uma vez e todos os carros dela (Gol e Onix) passam a mostrar o telefone novo e correto instantaneamente.
