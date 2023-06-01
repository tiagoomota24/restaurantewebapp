<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>

<%
        String nome_utilizador = request.getParameter("nome_utilizador");
        String palavra_passe = request.getParameter("palavra_passe");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurante", "root", "Skr12345");

            String sql = "SELECT * FROM funcionario WHERE nome_utilizador = ? AND palavra_passe = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome_utilizador);
            stmt.setString(2, palavra_passe);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                response.sendRedirect("painel.html");
            } else {
                response.sendRedirect("index.html");
                System.out.println("Login falhado. Nome de utilizador ou palavra-passe errada");
            }

            conn.close();
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }
%>



