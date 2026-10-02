# Módulo de Relatórios da Clínica

## Autor

- **Nome:** Felipe Walker
- **Turma:** TDS
- **Data de início:** 02/10/2026

## Objetivo do módulo

Este módulo foi desenvolvido para transformar os dados brutos armazenados no banco de dados da clínica em relatórios práticos de apoio à gestão. A partir de consultas SQL estruturadas no PostgreSQL, a coordenação consegue enxergar a demanda de pacientes por especialidade, os médicos com mais atendimentos, os índices de faltas e o faturamento. O foco é fornecer números claros para ajudar no planejamento de horários, contratações e uso das salas.

## Banco de dados utilizado

- **SGBD:** PostgreSQL
- **Schema:** `clinica_pi_uc6`
- **Ferramenta de consulta:** DBeaver
- **Origem dos dados:** base fictícia e anonimizada disponibilizada para a UC6.

## Relatórios do módulo

| Relatório              | Pergunta de negócio                                                                     | Situação  |
| :--------------------- | :-------------------------------------------------------------------------------------- | :-------- |
| 1. Demanda             | Quais especialidades e profissionais possuem maior volume de consultas realizadas?      | Concluído |
| 2. Faltas              | Onde estão concentradas as faltas e qual é a taxa de ausência?                          | Pendente  |
| 3. Atendimentos        | Qual especialidade, profissional ou convênio gera maior faturamento e volume realizado? | Pendente  |
| 4. Uso de consultórios | Quais consultórios são mais utilizados e em quais horários?                             | Pendente  |

## Como executar os relatórios SQL

1. Abra o DBeaver e conecte-se ao PostgreSQL disponibilizado para a turma.
2. Abra o arquivo SQL desejado (localizado na pasta `sql/`).
3. Execute, antes de rodar qualquer consulta, o comando para apontar para o schema correto:
   ```sql
   SET search_path TO clinica_pi_uc6, public;
   ```
4. Execute o script pressionando `Ctrl + Enter` (ou `Alt + X` para o script todo).
5. Analise o resultado gerado na grade e consulte os prints de exemplo na pasta `evidencias/`.

### Regras importantes da base

- Consultas concluídas com sucesso utilizam `status = 'REALIZADA'`.
- Faltas e ausências utilizam `status = 'FALTOU'`.
- A tabela `consulta` é a fato principal e registra tanto o agendamento quanto a execução do atendimento.
- Os tempos e durações de atendimento só podem ser calculados quando os campos `inicio_atendimento` e `fim_atendimento` forem diferentes de `NULL`.
- Consultas canceladas ou faltas não possuem valor cobrado (`valor_cobrado IS NULL`).

### Glossário técnico

| Termo em inglês | Tradução               | Aplicação no projeto                                                                         |
| :-------------- | :--------------------- | :------------------------------------------------------------------------------------------- |
| **table**       | Tabela                 | Estrutura onde os dados ficam guardados em linhas e colunas (ex: paciente, consulta).        |
| **field**       | Campo / Coluna         | Cada atributo de uma tabela, como o nome do paciente ou a data_agendamento.                  |
| **primary key** | Chave Primária (PK)    | Identificador único exclusivo de cada linha que não se repete (ex: id_consulta).             |
| **foreign key** | Chave Estrangeira (FK) | Campo que referencia a PK de outra tabela para criar o relacionamento (ex: id_profissional). |

### Limitações dos dados

- A base de dados não registra o motivo do cancelamento ou da falta do paciente na coluna `observacao` de forma padronizada.
- O campo `id_convenio` fica atrelado ao cadastro geral do paciente, o que reflete o plano atual dele e não necessariamente se houve troca histórica de plano.
- O período de datas da base é fechado e estático, servindo como amostragem para análise da UC6.
