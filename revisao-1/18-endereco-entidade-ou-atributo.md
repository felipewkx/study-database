# 18 — Endereço: caixa ou coluna?

O dono quer guardar o endereço do cliente. Trouxe três pedidos diferentes:

A. “Só a cidade, para achar quem é do bairro.”  
B. “Rua, número, CEP — um endereço por cliente.”  
C. “O mesmo cliente tem casa e oficina; os dois endereços importam.”

## Tarefa

Para **cada** pedido (A, B e C), diga: o endereço é **atributo** (colunas em `cliente`) ou **entidade** (outra tabela com `cliente_id`)?

Escreva o `CREATE TABLE` da opção B **ou** da C — a que você achar mais honesta para um assistente que não quer refazer o banco na semana que vem.

Sem `JOIN`. Sem normalização 3FN no papel acadêmico: só a decisão entidade × atributo.

-- Correção:

Para resolver o problema do dono da oficina de forma simples e direta, a decisão depende de quantas informações precisamos guardar por cliente.

- Pedido A: Como ele só quer a cidade e o bairro para uma filtragem simples, basta colocar essas duas colunas direto na tabela do cliente.

- Pedido B: Como cada cliente tem estritamente 1 endereço completo, colocar os campos de rua, número e CEP direto na tabela `cliente` funciona perfeitamente para o momento.

- Pedido C: Como o mesmo cliente pode ter mais de um endereço (casa e oficina), precisamos de uma tabela separada de endereços apontando para o cliente.

---

- Pedido A: Atributo (colunas em cliente).
- Pedido B: Atributo (colunas em cliente).
- Pedido C: Entidade (outra tabela com cliente_id).

Para não ter que refazer o banco de dados na semana que vem, a Opção C é a mais honesta e segura. Ela resolve o Pedido C e já engloba o B e o A automaticamente.

```sql
CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE endereco (
    id INT PRIMARY KEY,
    cliente_id INT,
    tipo_endereco VARCHAR(20), -- 'Casa', 'Oficina', 'Trabalho'
    rua VARCHAR(100),
    numero VARCHAR(20),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    cep VARCHAR(10)
);
```
