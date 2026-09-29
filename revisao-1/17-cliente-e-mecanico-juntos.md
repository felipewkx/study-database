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

-- Correção:

1. Não resolve. O que quebra é que o campo 'tipo' só deixa a pessoa ser uma coisa ou outra ('cliente' ou 'mecanico'). Se o mecânico trouxer o carro dele, você terá que cadastrar a mesma pessoa de novo com outro ID só para mudar o tipo. Isso quebra a regra de que cada pessoa é única no sistema.

2. Resolvem o problema de separar as regras, mas criam duplicação. Se um mecânico virar cliente, você terá que digitar o nome e o telefone dele duas vezes: uma na tabela de clientes e outra na de mecânicos. Se ele mudar de telefone, você terá que atualizar em dois lugares diferentes.

3. A melhor forma de resolver isso sem duplicar nomes e sem mentir é criar três tabelas simples: uma para guardar quem é a pessoa, e outras duas apenas para dizer se aquela pessoa é um cliente, um mecânico (ou os dois ao mesmo tempo).

CREATE TABLE pessoa (
id INT PRIMARY KEY,
nome VARCHAR(100),
telefone VARCHAR(20)
);

CREATE TABLE cliente (
pessoa_id INT PRIMARY KEY
);

CREATE TABLE mecanico (
pessoa_id INT PRIMARY KEY
);
