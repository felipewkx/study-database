
/* ============================================================================
   UC6 — Aula 4: Consultas SQL de Análise
   Estudante: Felipe Walker
   Turma: TDS
   Schema: clinica_pi_uc6
   ============================================================================ */

-- Configuração inicial do search_path para facilitar
SET search_path TO clinica_pi_uc6;


/* ============================================================================
   QUERY-MODELO
   Pergunta: Qual é o total de consultas e faturamento por status?
   ============================================================================ */
SELECT 
    status,
    COUNT(*) AS total_consultas,
    SUM(valor_cobrado) AS total_faturado,
    ROUND(AVG(valor_cobrado), 2) AS media_valor
FROM clinica_pi_uc6.consulta
GROUP BY status
ORDER BY total_consultas DESC;


/* ============================================================================
   CONSULTA PRÓPRIA 1
   Pergunta: Qual o faturamento total e número de atendimentos concluídos por 
             especialidade médica?
   Objetivo: Saber onde a clínica ganha mais dinheiro e atende mais gente.
   ============================================================================ */
SELECT 
    e.nome AS especialidade,
    COUNT(c.id_consulta) AS total_atendimentos_realizados,
    SUM(c.valor_cobrado) AS faturamento_total,
    ROUND(AVG(c.valor_cobrado), 2) AS ticket_medio
FROM clinica_pi_uc6.consulta c
INNER JOIN clinica_pi_uc6.profissional p 
    ON c.id_profissional = p.id_profissional
INNER JOIN clinica_pi_uc6.especialidade e 
    ON p.id_especialidade = e.id_especialidade
WHERE c.status = 'REALIZADA'
GROUP BY e.nome
ORDER BY faturamento_total DESC;


/* ============================================================================
   CONSULTA PRÓPRIA 2
   Pergunta: Quantas faltas ocorreram em cada convênio médico?
   Objetivo: Descobrir quais planos têm mais pacientes ausentes para melhorar 
             a confirmação de presença.
   ============================================================================ */
SELECT 
    conv.nome AS nome_convenio,
    conv.tipo AS tipo_convenio,
    COUNT(c.id_consulta) AS total_faltas
FROM clinica_pi_uc6.consulta c
INNER JOIN clinica_pi_uc6.paciente pac 
    ON c.id_paciente = pac.id_paciente
INNER JOIN clinica_pi_uc6.convenio conv 
    ON pac.id_convenio = conv.id_convenio
WHERE c.status = 'FALTOU'
GROUP BY conv.nome, conv.tipo
ORDER BY total_faltas DESC;


/* ============================================================================
   CONSULTA PRÓPRIA 3
   Pergunta: Qual a duração média (em minutos) dos atendimentos presenciais?
   Objetivo: Descobrir a agilidade dos atendimentos presenciais.
   ============================================================================ */
SELECT 
    tipo_atendimento,
    COUNT(*) AS qtd_atendimentos,
    ROUND(AVG(EXTRACT(EPOCH FROM (fim_atendimento - inicio_atendimento)) / 60)::numeric, 1) AS duracao_media_minutos,
    ROUND(MIN(EXTRACT(EPOCH FROM (fim_atendimento - inicio_atendimento)) / 60)::numeric, 1) AS duracao_minima_minutos,
    ROUND(MAX(EXTRACT(EPOCH FROM (fim_atendimento - inicio_atendimento)) / 60)::numeric, 1) AS duracao_maxima_minutos
FROM clinica_pi_uc6.consulta
WHERE status = 'REALIZADA'
  AND inicio_atendimento IS NOT NULL 
  AND fim_atendimento IS NOT NULL
GROUP BY tipo_atendimento
ORDER BY duracao_media_minutos DESC;


/* ============================================================================
   CONSULTA PRÓPRIA 4
   Pergunta: Quais são as 5 cidades com mais pacientes cadastrados na clínica?
   Objetivo: Descobrir onde mora a maioria dos pacientes atendidos.
   ============================================================================ */
SELECT 
    cidade,
    COUNT(id_paciente) AS total_pacientes
FROM clinica_pi_uc6.paciente
WHERE ativo = true
GROUP BY cidade
ORDER BY total_pacientes DESC
LIMIT 5;
```