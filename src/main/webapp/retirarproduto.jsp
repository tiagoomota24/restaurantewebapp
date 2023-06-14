<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/restaurante2";
        String username = "root";
        String password = "Skr12345";
        connection = DriverManager.getConnection(url, username, password);

        String nameToDelete = request.getParameter("produto");

        String deleteQuery = "DELETE FROM pedido2 WHERE produto = ?";
        preparedStatement = connection.prepareStatement(deleteQuery);
        preparedStatement.setString(1, nameToDelete);

        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            System.out.println("Produto apagado!");
            response.sendRedirect("editarcardapio.jsp");
        } else {
            System.out.println("Produto não encontrado ou erro!");
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

