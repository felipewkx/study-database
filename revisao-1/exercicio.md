# Exercícios — Aula 1

Rotinas de **assistente de banco de dados**: ler o que quebrou, corrigir o script e, em alguns casos, decidir o desenho das tabelas.

O modelo em aula é a Oficina Rápida. Estes arquivos **não** vão no projetor no lugar da pasta `oficina-rapida/`.

Rode cada um num database de rascunho (`treino_aula1`), não no `oficina_rapida`.

Sem `JOIN`, sem view, sem dump. O que vale: `CREATE`, `INSERT`, `SELECT`/`WHERE`/`ORDER BY` e desenho 1:N.

## O que entregar

Para cada arquivo: o SQL (ou o desenho) **corrigido**, com um comentário `-- o que estava errado:` de uma linha.

## Critério mínimo

- O script roda no PostgreSQL **ou** o desenho tem entidades, PK e 1:N justificados.
- Você explica o erro em uma frase (mensagem do servidor ou decisão de modelagem).

## Os 20 arquivos

| # | Arquivo | Tipo | Rotina |
|---|---------|------|--------|
| 01 | [01-chamado-consulta-sem-from.sql](01-chamado-consulta-sem-from.sql) | SQL quebrado | Chamado: “a consulta não roda” |
| 02 | [02-coluna-que-nao-existe.sql](02-coluna-que-nao-existe.sql) | SQL quebrado | Relatório com nome de coluna inventado |
| 03 | [03-filtro-like-quebrado.sql](03-filtro-like-quebrado.sql) | SQL quebrado | Busca por pedaço de nome |
| 04 | [04-lista-sem-ordem.sql](04-lista-sem-ordem.sql) | SQL quebrado | Lista para a recepção |
| 05 | [05-carga-colunas-nao-batem.sql](05-carga-colunas-nao-batem.sql) | SQL quebrado | Carga de planilha |
| 06 | [06-texto-sem-aspas.sql](06-texto-sem-aspas.sql) | SQL quebrado | Script colado do Excel |
| 07 | [07-filho-antes-do-pai.sql](07-filho-antes-do-pai.sql) | SQL quebrado | Carga noturna na ordem errada |
| 08 | [08-palavra-reservada.sql](08-palavra-reservada.sql) | SQL quebrado | Criar tabela com nome proibido |
| 09 | [09-telefone-como-inteiro.sql](09-telefone-como-inteiro.sql) | SQL quebrado | Tipo que come zero à esquerda |
| 10 | [10-placa-curta-demais.sql](10-placa-curta-demais.sql) | SQL quebrado | `VARCHAR` pequeno demais |
| 11 | [11-select-estrela-sem-pergunta.sql](11-select-estrela-sem-pergunta.sql) | SQL quebrado | Pedido vago do chefe |
| 12 | [12-id-duplicado.sql](12-id-duplicado.sql) | SQL quebrado | Choque de chave primária |
| 13 | [13-nome-vazio.sql](13-nome-vazio.sql) | SQL quebrado | `NOT NULL` violado |
| 14 | [14-aspas-e-maiusculas.sql](14-aspas-e-maiusculas.sql) | SQL quebrado | Identificador entre aspas |
| 15 | [15-update-sem-where.sql](15-update-sem-where.sql) | SQL quebrado | Script perigoso (pare antes) |
| 16 | [16-caderno-uma-tabela.md](16-caderno-uma-tabela.md) | Modelagem | Caderno misturado |
| 17 | [17-cliente-e-mecanico-juntos.md](17-cliente-e-mecanico-juntos.md) | Modelagem | Uma tabela “pessoa”? |
| 18 | [18-endereco-entidade-ou-atributo.md](18-endereco-entidade-ou-atributo.md) | Modelagem | Endereço: caixa ou coluna? |
| 19 | [19-loja-de-pecas.md](19-loja-de-pecas.md) | Modelagem | Fornecedor e peça |
| 20 | [20-planilha-do-estoque.md](20-planilha-do-estoque.md) | Modelagem | Estoque numa célula só |
