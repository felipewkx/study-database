# 20 — Planilha do estoque

O almoxarifado manda esta planilha:

| peca | qtd | prateleira | fornecedor | telefone_fornecedor |
|------|-----|------------|------------|---------------------|
| Filtro de oleo | 12 | A1 | AutoSul | 5133330001 |
| Pastilha | 4 | A1 | AutoSul | 5133330001 |
| Vela | 20 | B2 | Peças RS | 5133330002 |
| Filtro de oleo | 3 | C9 | Peças RS | 5133330002 |

O telefone da AutoSul aparece duas vezes. A mesma peça existe em dois fornecedores.

## Tarefa

1. O que é entidade e o que é atributo?
2. Dá para uma tabela só? O que mente se o telefone da AutoSul mudar?
3. Proponha tabelas (PK + 1:N). Escreva os `CREATE TABLE`.
4. A peça “Filtro de oleo” dos dois fornecedores é **a mesma entidade** ou duas linhas de estoque? Decida e justifique.

Sem `JOIN`. Sem tabela do meio N:N — se precisar do mesmo produto em dois fornecedores, explique como resolver **hoje** com o nível da Aula 1 (duas linhas de peça, cada uma com um `fornecedor_id`, é aceitável se você disser o preço).
