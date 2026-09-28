# Aula 1 — O caderno da Oficina Rápida

A **Oficina Rápida** anota cliente, telefone, placa e mecânico num caderno. O telefone da Ana aparece de um jeito na segunda-feira e de outro na sexta. Hoje esse caderno vira um banco **pequeno** em SQLite: três tabelas, uns dados e três perguntas.

Ainda não tem ordem de serviço, junção nem cópia de segurança.

---

## Dado, informação e banco

**Dado** é o que se guarda (placa `ABC1D23`). **Informação** é o que se consegue perguntar com critério (“quais veículos da Ana?”).

O banco fica num **arquivo** (`oficina_rapida.db`). Você abre esse arquivo no DBeaver (ou no DB Browser for SQLite) e roda o SQL ali.

---

## Entidade, atributo e chave

| Ideia | Na oficina |
|-------|------------|
| Entidade | Cliente, veículo, mecânico |
| Atributo | Nome, telefone, placa, modelo |
| Chave primária | Um `id` que não se repete |
| 1:N | Um cliente tem **vários** veículos; cada veículo tem **um** cliente |

Se o telefone muda, ele muda **uma vez** na ficha do cliente — não em cada linha do caderno.

---

## O que fazer hoje

Pasta `oficina-rapida/`:

1. Listar os fatos que a oficina precisa lembrar.
2. Escrever `er.md` (ou foto do papel) + `dicionario.md` (nome, significado, exemplo).
3. Criar o arquivo `oficina_rapida.db` e conectar nele.
4. Salvar e rodar `schema.sql` — tabelas `cliente`, `veiculo`, `mecanico`.
5. Salvar e rodar `massa.sql` — 8 a 12 linhas no total.
6. Salvar `consultas.sql` com **três** perguntas em português e o `SELECT` de cada uma (`WHERE` e `ORDER BY`).
7. No terminal (opcional): `sqlite3 oficina_rapida.db ".tables"`

`veiculo` tem `cliente_id`. Hoje isso é uma coluna. A trava que impede veículo órfão fica para a aula 2.

No SQLite, chave automática costuma ser `INTEGER PRIMARY KEY AUTOINCREMENT` (não use `SERIAL`).

---

## Casos para conferir

Use estes fatos (pode trocar os nomes, não a estrutura):

| Cliente | Telefone | Veículos (placa / modelo) |
|---------|----------|---------------------------|
| Ana Souza | 51980001111 | ABC1D23 Gol; EFG4H56 Onix |
| Bruno Lima | 51980002222 | IJK7L89 Civic |
| Carla Dias | 51980003333 | MNO0P12 Ka |

Mecânicos: Diego Alves, Elisa Prado, Fabio Nunes.

Perguntas mínimas:

1. Clientes em ordem de nome.
2. Veículos da Ana (pelo `cliente_id` que você inseriu).
3. Mecânicos cujo nome começa com `E` (ou outro filtro que você justifique).

---

## Como saber se funcionou

- O ER tem três caixas e a linha 1:N entre cliente e veículo.
- O arquivo `.db` mostra as três tabelas.
- As três consultas devolvem linhas que batem com a tabela acima.
- Você explica, em uma frase, por que o telefone não está na tabela `veiculo`.

O caderno de conceitos é treino. O que vale é a pasta `oficina-rapida/` com o `.db` e os scripts.

Quando o modelo da oficina fechar, há **20 chamados** em `exercicios/` — outro posto, não a pasta `oficina-rapida/`.
