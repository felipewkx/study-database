# UC6 — Aula 4: Formulação de perguntas de análise e consultas SQL

**Estudante:** Felipe Walker  
**Turma:** TDS  
**Data:** 25 / 09 / 2026  
**Banco de dados:** PostgreSQL (`clinica_pi_uc6`)

---

## 1. Pergunta-Modelo e Interpretação

### Pergunta-modelo trabalhada em aula:

> _"Qual é a quantidade total de consultas e o valor total faturado para cada status de agendamento na clínica?"_

```sql
SELECT
    status,
    COUNT(*) AS total_consultas,
    SUM(valor_cobrado) AS total_faturado,
    ROUND(AVG(valor_cobrado), 2) AS media_valor
FROM clinica_pi_uc6.consulta
GROUP BY status
ORDER BY total_consultas DESC;
```

### Respostas das perguntas de interpretação da query-modelo:

1. **O que cada linha retornada pelo resultado representa?**  
   Cada linha representa um agrupamento de consultas por situação (`status`), mostrando quantas consultas tiveram aquele status e a soma/média dos valores cobrados nelas.

2. **Por que o campo `total_faturado` e a `media_valor` aparecem vazios ou zerados nos status `FALTOU` e `CANCELADA`?**  
   Porque, pelas regras de negócio da clínica, a cobrança só é feita nas consultas que realmente aconteceram (`REALIZADA`). Quando o paciente falta ou cancela, o campo `valor_cobrado` fica como `NULL` no banco, então as funções de agregação `SUM` e `AVG` ignoram os nulos.

3. **Qual é o papel da cláusula `GROUP BY status` nessa consulta? O que aconteceria se ela não fosse usada?**  
   O `GROUP BY` serve para juntar as linhas que têm o mesmo status em um bloco só para fazer a contagem. Se a gente tirasse o `GROUP BY`, o PostgreSQL daria erro de sintaxe, porque não dá para colocar uma coluna comum (`status`) do lado de funções de grupo (`COUNT`, `SUM`) sem agrupar por ela.

4. **Por que a tabela `consulta` foi suficiente para responder a essa pergunta, sem precisar de `JOIN`?**  
   Porque tanto o status do agendamento quanto o valor financeiro cobrado já estão registrados diretamente nas colunas da própria tabela `consulta`.

---

## 2. Roteiro com Quatro Perguntas de Análise

### Pergunta 1:

**Qual é o faturamento total e a quantidade de atendimentos concluídos por cada especialidade médica?**

- **Tabelas necessárias:** `consulta`, `profissional` e `especialidade`.
- **Campos:** `especialidade.nome`, `consulta.status`, `consulta.valor_cobrado`.
- **Objetivo para o negócio:** Descobrir quais especialidades dão mais retorno financeiro para a clínica e onde vale a pena abrir mais horários de agenda.

### Pergunta 2:

**Quantas faltas (`status = 'FALTOU'`) cada convênio teve e qual é o ranking dos planos com mais não comparecimento?**

- **Tabelas necessárias:** `consulta`, `paciente` e `convenio`.
- **Campos:** `convenio.nome`, `consulta.status`.
- **Objetivo para o negócio:** Identificar se algum plano de saúde específico tem pacientes que faltam com frequência, para a clínica poder criar regras de confirmação por WhatsApp ou cobrar taxa de no-show.

### Pergunta 3:

**Qual é a duração média do atendimento (em minutos) das consultas presenciais?**

- **Tabelas necessárias:** `consulta`.
- **Campos:** `tipo_atendimento`, `inicio_atendimento`, `fim_atendimento`, `status`.
- **Objetivo para o negócio:** Entender se o atendimento online é mais rápido do que o presencial, ajudando a organizar melhor o tempo das salas físicas e a grade de horários dos médicos.

### Pergunta 4:

**Quais são as 5 cidades de onde vêm mais pacientes cadastrados na clínica?**

- **Tabelas necessárias:** `paciente`.
- **Campos:** `cidade`, `id_paciente`.
- **Objetivo para o negócio:** Saber a distribuição geográfica dos clientes para planejar campanhas de divulgação ou decidir se compensa abrir uma nova filial em outra cidade da região.

---

## 3. Conclusões dos Resultados das Três Consultas Próprias

Executei as queries no DBeaver e cheguei nas seguintes conclusões para o negócio:

### Conclusão da Consulta 1 (Faturamento por Especialidade):

> Ao rodar a consulta filtrando apenas consultas com status `REALIZADA`, ficou evidente que especialidades com consultas mais caras ou de rotina frequente (como Clínica Geral e Cardiologia) concentram a maior parte do faturamento da clínica. Isso mostra que essas áreas não podem ficar com horários vagos e que a contratação de novos médicos deve priorizar essas especialidades que mais trazem lucro.

### Conclusão da Consulta 2 (Faltas por Convênio):

> O resultado revelou que os convênios com maior volume de pacientes ativos lideram em número absoluto de faltas (`FALTOU`). No entanto, os pacientes do tipo `PARTICULAR` faltam bem menos, o que faz sentido porque quando a pessoa paga do próprio bolso ela se compromete mais a comparecer. A gestão pode focar o envio de lembretes automáticos principalmente nos clientes de planos de saúde empresariais.

### Conclusão da Consulta 3 (Duração Média Presencial):

> A consulta mostrou que houveram 629 atendimentos e a duração média foi de 43.8 minutos.

### Conclusão da Consulta 4 (5 cidades de onde vêm mais pacientes cadastrados):

> A consulta mostrou que as 5 cidades de onde vêm mais pacientes cadastrados são: São Bernardo do Campo, São Paulo, Mauá, Diadema, Santo André; todas elas com 16 pacientes no total.

---

## Checklist de Entrega

- [x] Pergunta-modelo e respostas de interpretação incluídas.
- [x] Quatro perguntas de análise formuladas e explicadas.
- [x] Conclusões das três consultas próprias registradas.
- [x] Script SQL salvo no formato correto.
