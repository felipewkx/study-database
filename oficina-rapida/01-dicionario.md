# Dicionário de Dados — Oficina Rápida

**Aluno:** Felipe Walker

### Tabela: `cliente`

Guarda as informações de contato dos donos dos carros.

| Campo      | Tipo         | Significado                       | Exemplo         |
| ---------- | ------------ | --------------------------------- | --------------- |
| `id`       | INTEGER (PK) | Identificador único do cliente    | `1`             |
| `nome`     | TEXT         | Nome completo do cliente          | `'Ana Souza'`   |
| `telefone` | TEXT         | Telefone com DDD (apenas dígitos) | `'51980001111'` |

---

### Tabela: `veiculo`

Guarda os veículos atendidos pela oficina.

| Campo        | Tipo         | Significado                                  | Exemplo     |
| ------------ | ------------ | -------------------------------------------- | ----------- |
| `id`         | INTEGER (PK) | Identificador único do veículo               | `1`         |
| `placa`      | TEXT         | Placa do veículo (padrão Mercosul ou antigo) | `'ABC1D23'` |
| `modelo`     | TEXT         | Modelo/nome comercial do carro               | `'Gol'`     |
| `cliente_id` | INTEGER      | Código do cliente dono do veículo            | `1`         |

---

### Tabela: `mecanico`

Guarda os profissionais que realizam os serviços.

| Campo  | Tipo         | Significado                     | Exemplo         |
| ------ | ------------ | ------------------------------- | --------------- |
| `id`   | INTEGER (PK) | Identificador único do mecânico | `1`             |
| `nome` | TEXT         | Nome completo do mecânico       | `'Diego Alves'` |

---

### Pergunta de validação da aula:

**Por que o telefone não está na tabela `veiculo`?**

> Porque o telefone é um dado da pessoa (cliente) e não do carro; se o cliente tiver mais de um veículo ou trocar de número, o telefone precisaria ser duplicado ou atualizado em vários lugares, gerando inconsistência e retrabalho.
