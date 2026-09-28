# 17 — Uma tabela `pessoa` para os dois?

O estagiário sugeriu:

```text
pessoa (id, nome, telefone, tipo)
tipo = 'cliente' ou 'mecanico'
```

A oficina tem clientes que **não** são mecânicos, e um mecânico que também leva o próprio carro (é cliente).

## Tarefa

Decida e justifique em 5–8 linhas:

1. Uma tabela `pessoa` resolve? O que quebra quando a mesma pessoa é as duas coisas?
2. Duas tabelas (`cliente`, `mecanico`) resolvem? O que duplica?
3. Escolha **uma** estrutura para hoje (nível essencial) e escreva os `CREATE TABLE`.

Não precisa de tabela N:N nem de `JOIN`. O critério é: dá para guardar os fatos sem mentir.
