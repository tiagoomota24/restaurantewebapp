<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurante2", "root", "Skr12345");

        String sql = "INSERT INTO pedido2 (produto, quantidade) VALUES (?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);

        // Processamento dos pratos
        for (int i = 1; i <= 7; i++) {
            String prato = request.getParameter("prato" + i);
            String quantidadeParam = request.getParameter("quantidade" + i);

            if (prato != null && quantidadeParam != null) {
                int quantidade = Integer.parseInt(quantidadeParam);

                statement.setString(1, prato);
                statement.setInt(2, quantidade);

                statement.executeUpdate();
            }
        }

        // Processamento das bebidas
        for (int i = 8; i <= 13; i++) {
            String bebida = request.getParameter("bebida" + i);
            String quantidadeParam = request.getParameter("quantidade" + i);

            if (bebida != null && quantidadeParam != null) {
                int quantidade = Integer.parseInt(quantidadeParam);

                statement.setString(1, bebida);
                statement.setInt(2, quantidade);

                statement.executeUpdate();
            }
        }

        statement.close();
        connection.close();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>


