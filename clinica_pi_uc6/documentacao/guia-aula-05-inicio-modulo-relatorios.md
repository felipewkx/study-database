# Aula 5 - Início do Módulo de Relatórios da Clínica

**Nome:** Felipe Walker  
**Turma:** TDS  
**Data:** 02 / 10 / 2026

## O desafio de hoje

Até a Aula 4, você explorou a base, identificou tabelas, relacionamentos, regras e perguntas de análise. A partir de hoje, você começa a construir a entrega final da UC6:

> Um módulo de relatórios que utiliza o banco PostgreSQL existente da clínica para apoiar decisões da gestão.

Você não deve criar uma nova base ou alterar as tabelas fornecidas. O trabalho será desenvolvido sobre o schema `clinica_pi_uc6`.

## Produto final

Ao final da UC6, sua pasta deverá ter esta organização:

```text
modulo-relatorios-clinica-felipe-walker/
├── README.md
├── sql/
│   ├── relatorio-01-demanda.sql
│   ├── relatorio-02-faltas.sql
│   ├── relatorio-03-atendimentos.sql
│   └── relatorio-04-uso-consultorios.sql
├── documentacao/
│   ├── der-clinica.png
│   ├── aula-02-dicionario-dados-felipe-walker.md
│   ├── aula-03-documentacao-felipe-walker.md
│   └── guia-aula-05-inicio-modulo-relatorios.md
├── evidencias/
│   └── evidencia-relatorio-01.png
└── java/
    └── RelatorioClinica.java
```

### Os quatro relatórios do módulo

| Nº  | Relatório           | Pergunta principal                                                                      |
| :-- | :------------------ | :-------------------------------------------------------------------------------------- |
| 1   | Demanda             | Quais especialidades e profissionais possuem maior volume de consultas realizadas?      |
| 2   | Faltas              | Onde estão concentradas as faltas e qual é a taxa de ausência?                          |
| 3   | Atendimentos        | Qual especialidade, profissional ou convênio gera maior faturamento e volume realizado? |
| 4   | Uso de consultórios | Quais consultórios são mais utilizados e em quais horários?                             |

---

## Exercícios Práticos

### Exercício 1 - Monte a estrutura inicial

- Estrutura de pastas validada e organizada conforme o padrão do projeto.
- Documentações das aulas 1 a 4 reunidas na pasta `documentacao/`.
- `README.md` preenchido com objetivos, glossário e regras de negócio.

### Exercício 2 - Planeje o Relatório 1: Demanda

| Item                                  | Registro                                                                                                                                                                            |
| :------------------------------------ | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Pergunta de negócio**               | Quais especialidades e profissionais possuem maior volume de consultas realizadas?                                                                                                  |
| **Decisão que a clínica pode apoiar** | Ajuda a diretoria a saber quais especialidades precisam de mais médicos na escala, quais salas precisam de mais horários disponíveis e onde a clínica tem maior fluxo de pacientes. |
| **Tabelas necessárias**               | `consulta`, `profissional` e `especialidade`.                                                                                                                                       |
| **Campos importantes**                | `c.id_consulta`, `c.status`, `p.nome`, `e.nome`.                                                                                                                                    |
| **Regra de negócio a considerar**     | Apenas atendimentos de fato concluídos geram demanda realizada (`status = 'REALIZADA'`). Agendamentos futuros, faltas e cancelamentos devem ficar de fora.                          |
| **Filtro necessário**                 | `WHERE c.status = 'REALIZADA'`                                                                                                                                                      |
| **Resultado esperado**                | Duas listas ordenadas do maior para o menor número de atendimentos: uma por especialidade médica e outra com o nome de cada profissional e sua respectiva área.                     |

### Exercício 3 - Crie e execute o Relatório 1

#### Conclusão do Relatório 1

- **Resultado principal encontrado:** Ao executar a consulta das Partes A e B no DBeaver sobre o banco `clinica_pi_uc6`, constatou-se que a especialidade de **Clínica Geral** é a que concentra a maior demanda da clínica (ultrapassando **180 consultas** das **629 realizadas**), acompanhada por Cardiologia e Pediatria. Na análise individual por profissional, os médicos de Clínica Geral lideram a quantidade de atendimentos realizados, comprovando que atendem a triagem básica e o retorno rotineiro da maior parte dos pacientes cadastrados.
- **O que esse resultado pode indicar para a gestão da clínica:** Indica que a Clínica Geral é o motor de entrada da clínica. A gestão não pode deixar faltar horários para essa especialidade e precisa avaliar se a contratação de mais um clínico geral desafogaria o atendimento, já que a concentração em poucos profissionais pode gerar sobrecarga ou filas de espera na recepção.
- **Limitação ou cuidado de interpretação:** Essa query só olha quantidade de linhas com `status = 'REALIZADA'`. Ela não diz quanto dinheiro cada especialidade trouxe para o caixa (já que uma especialidade com menos consultas pode ter um valor de consulta muito mais alto), nem informa a duração dos atendimentos ou a taxa de faltas de cada profissional.

---

## Checklist de saída

- [ x] Criei a pasta individual do módulo.
- [ x] Criei as subpastas solicitadas (`sql/`, `documentacao/`, `evidencias/`, `java/`).
- [ x] Organizei a documentação já produzida.
- [ x] Iniciei o `README.md`.
- [ x] Criei `relatorio-01-demanda.sql`.
- [ x] Executei a query no PostgreSQL.
- [ x] Salvei uma evidência do resultado na pasta `evidencias/`.
- [ x] Escrevi uma conclusão com número real.

---
