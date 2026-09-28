# Aula 1 — Conceitos (treino)

Cole no DBeaver (ou no DB Browser) num arquivo de rascunho `treino_aula1.db`, **não** no `oficina_rapida.db`. Isso não é a entrega do dia.

## 1. Entidade ou atributo?

Para cada item, escreva E ou A:

| Item | E ou A |
|------|--------|
| Cliente | |
| Nome do cliente | |
| Placa | |
| Veículo | |
| Telefone | |

## 2. Tabela mínima

```sql
CREATE TABLE cliente (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL
);

INSERT INTO cliente (nome) VALUES ('Ana Souza');

SELECT id, nome
FROM cliente
ORDER BY nome;
```

Rode. Confira se apareceu 1 linha.

## 3. Filtro

```sql
SELECT nome
FROM cliente
WHERE nome LIKE 'A%'
ORDER BY nome;
```

Mude o `'A%'` e veja o conjunto mudar.

## 4. Uma pergunta, um SELECT

Antes de escrever o SQL, diga **em português** o que quer saber. O `SELECT` é a resposta. No arquivo, a pergunta fica num comentário **acima** do comando.

Exemplo (já pronto — só leia):

```sql
-- pergunta: quais clientes existem, em ordem de nome?
SELECT id, nome
FROM cliente
ORDER BY nome;
```

Agora faça o seu. Insira mais um cliente (`Bruno Lima`) e escreva **uma** pergunta nova + o `SELECT` que responde. Exemplos de pergunta: “quem se chama Ana?”, “quem tem nome começando com B?”.

```sql
-- pergunta:
```

Não invente coluna que a tabela não tem. Se a pergunta não der para responder só com `cliente`, mude a pergunta — não invente `JOIN` hoje.
