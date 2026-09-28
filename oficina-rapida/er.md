# Modelo ER — Oficina Rápida

**Aluno:** Felipe Walker

## 1. Fatos que a oficina precisa lembrar

- Quem são os clientes e seus telefones de contato.
- Quais são os veículos (placa e modelo) e a quem cada veículo pertence.
- Quem são os mecânicos que trabalham na oficina.

## 2. Diagrama de Relacionamento

       +---------------+
       |    CLIENTE    |
       +---------------+
       | id (PK)       |
       | nome          |
       | telefone      |
       +---------------+
               |
               | 1
               |
               | N
       +---------------+          +---------------+
       |    VEICULO    |          |   MECANICO    |
       +---------------+          +---------------+
       | id (PK)       |          | id (PK)       |
       | placa         |          | nome          |
       | modelo        |          +---------------+
       | cliente_id    |
       +---------------+

### Relação 1:N:

- Um **Cliente** pode ter **vários** veículos cadastrados (1:N).
- Cada **Veículo** pertence a apenas **um** cliente.
- A tabela **Mecanico** fica independente nesta primeira versão.
