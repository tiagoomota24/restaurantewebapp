<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
  if (request.getParameter("enviar") != null) {
    String[] hamburgueres = request.getParameterValues("hamburguer");
    String[] quantidades = request.getParameterValues("quantidade");

    if (hamburgueres != null && quantidades != null) {
      try {
        String url = "jdbc:mysql://localhost:3306/restaurante2";
        String username = "root";
        String password = "Skr12345";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, username, password);

        String sql = "INSERT INTO pedido2 (produto, quantidade) VALUES (?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);

        for (int i = 0; i < hamburgueres.length; i++) {
          if (hamburgueres[i] != null && quantidades[i] != null && !hamburgueres[i].isEmpty() && !quantidades[i].isEmpty()) {
            statement.setString(1, hamburgueres[i]);
            int quantidade = Integer.parseInt(quantidades[i]);
            statement.setInt(2, quantidade);
            statement.executeUpdate();
          }
        }

        statement.close();
        connection.close();

        response.sendRedirect("teste.jsp");

      } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
      }
    }
  }
%>

<!DOCTYPE html>
<html lang="pt">
<head>
  <meta charset="UTF-8">
  <title>Seleção de Hambúrguer</title>
  <link rel="stylesheet" href="styles/cardapiocliente.css">
</head>
<body>
  <div class="center">
    <div class="cabeçalho">
      <h2>Cardápio</h2>
    </div>
    <form action="" method="post">
      <div class="prato">
        <input type="checkbox" name="hamburguer" value="Hambúrguer Simples">
        <input type="number" name="quantidade"> Hambúrguer Simples
      </div>
      <div class="prato">
        <input type="checkbox" name="hamburguer" value="Hambúrguer Duplo">
        <input type="number" name="quantidade"> Hambúrguer Duplo
      </div>
      <div class="prato">
        <input type="checkbox" name="hamburguer" value="Hambúrguer com Queijo">
        <input type="number" name="quantidade"> Hambúrguer com Queijo
      </div>
      <div class="prato">
        <input type="checkbox" name="hamburguer" value="Hambúrguer Vegetariano">
        <input type="number" name="quantidade"> Hambúrguer Vegetariano
      </div>
        <div class="prato">
            <input type="checkbox" name="hamburguer" value="Pizza da casa">
            <input type="number" name="quantidade"> Pizza da casa
        </div>
      <br>
      <input class="send-button" type="submit" name="enviar" value="Enviar">
    </form>
  </div>
</body>
</html>


