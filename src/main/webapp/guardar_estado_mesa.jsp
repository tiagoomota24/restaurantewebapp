<%@ page import="java.sql.*" %>
<%
    String mesaNumber = request.getParameter("mesaNumber");
    String newState = request.getParameter("newState");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurante2", "root", "Skr12345");

        String sql = "UPDATE mesa SET estado = ? WHERE numero = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, newState);
        statement.setString(2, mesaNumber);

        int rowsUpdated = statement.executeUpdate();
        if (rowsUpdated > 0) {
            System.out.println("Estado da mesa mudado.");
            response.sendRedirect("mesas.jsp");
        } else {
            System.out.println("Mesa nao encontrada ou estado nao mudado.");
        }

        statement.close();
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

