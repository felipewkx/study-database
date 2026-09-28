# 18 — Endereço: caixa ou coluna?

O dono quer guardar o endereço do cliente. Trouxe três pedidos diferentes:

A. “Só a cidade, para achar quem é do bairro.”  
B. “Rua, número, CEP — um endereço por cliente.”  
C. “O mesmo cliente tem casa e oficina; os dois endereços importam.”

## Tarefa

Para **cada** pedido (A, B e C), diga: o endereço é **atributo** (colunas em `cliente`) ou **entidade** (outra tabela com `cliente_id`)?

Escreva o `CREATE TABLE` da opção B **ou** da C — a que você achar mais honesta para um assistente que não quer refazer o banco na semana que vem.

Sem `JOIN`. Sem normalização 3FN no papel acadêmico: só a decisão entidade × atributo.
