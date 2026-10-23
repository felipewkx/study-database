package br.senac.uc6;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        try (Connection conexao = ConexaoBanco.abrir()) {
            System.out.println("✓ Conexão realizada com sucesso com o PostgreSQL.");
            System.out.println("Banco: postgres | Schema: " + ConfigBanco.SCHEMA);

            // Relatório 1 — Demanda por Especialidade
            RelatorioDemanda.executar(conexao);

            // Relatório 2 — Taxa e Contagem de Faltas
            RelatorioFaltas.executar(conexao);

            // Relatório 3 — Faturamento e Volume de Atendimentos
            RelatorioAtendimentos.executar(conexao);

        } catch (SQLException erro) {
            System.err.println("Não foi possível conectar ao banco ou executar o relatório.");
            System.err.println("Detalhe: " + erro.getMessage());
        }
    }
}