<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%
    String nome = request.getParameter("nome");
    String nome_utilizador = request.getParameter("nome_utilizador");
    String cargo = request.getParameter("cargo");
    String contacto = request.getParameter("contacto");
    String nif = request.getParameter("nif");
    String morada = request.getParameter("morada");
    String data_nasc = request.getParameter("data_nascimento");
    String palavra_passe = request.getParameter("palavra_passe");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurante", "root", "Skr12345");

        String sql = "INSERT INTO funcionario (nome, nome_utilizador, cargo, contacto, nif, morada, data_nasc, palavra_passe, salario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, nome);
        stmt.setString(2, nome_utilizador);
        stmt.setString(3, cargo);
        stmt.setString(4, contacto);
        stmt.setString(5, nif);
        stmt.setString(6, morada);
        stmt.setString(7, data_nasc);
        stmt.setString(8, palavra_passe);
        stmt.setNull(9, Types.NULL);

        int rows = stmt.executeUpdate();
        if (rows > 0) {
            System.out.println("Utilizador registado com sucesso.");
            response.sendRedirect("index.html");
        } else {
            System.out.println("Ocorreu um erro ao registar o utilizador.");
        }

        conn.close();
    } catch (SQLException e) {
        System.out.println("Erro: " + e.getMessage());
    }
%>
