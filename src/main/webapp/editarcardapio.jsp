<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.*"%>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Restaurante</title>
    <link rel="stylesheet" href="styles/editarcardapio.css">
</head>
<body>
    <div class="center">
        <div class="cabeçalho">
            <h2>Editar cardápio</h2>
        </div>
        <div class="produtos">
            <h3>Pratos</h3>
            <div class="prato">
                <input type="checkbox" name="prato" value="Frango Assado"> Frango Assado - 6,50€
            </div>
            <div class="prato">
                <input type="checkbox" name="prato" value="Risoto de Cogumelos"> Risoto de Cogumelos - 7,00€
            </div>
            <div class="prato">
                <input type="checkbox" name="prato" value="Cheeseburger"> Cheeseburger - 6,00€
            </div>
            <div class="prato">
                <input type="checkbox" name="prato" value="Salada de frango"> Salada de frango - 3,50€
            </div>
            <div class="prato">
                <input type="checkbox" name="prato" value="Pizza da casa"> Pizza da casa - 7,00€
            </div>
            <div class="prato">
                <input type="checkbox" name="prato" value="Salada russa"> Salada russa - 5,00€
            </div>
            <br>
            <h3>Bebidas</h3>
            <div class="bebida">
                <input type="checkbox" name="bebida" value="Coca-cola"> Coca Cola - 1,50€
            </div>
            <div class="bebida">
                <input type="checkbox" name="bebida" value="Vinho branco da casa"> Vinho branco da casa - 8,50€
            </div>
            <div class="bebida">
                <input type="checkbox" name="bebida" value="Vinho rosé da casa"> Vinho rosé da casa - 7,50€
            </div>
            <div class="bebida">
                <input type="checkbox" name="bebida" value="Vinho tinto da casa"> Vinho tinto da casa - 7,00€
            </div>
            <div class="bebida">
                <input type="checkbox" name="bebida" value="Água"> Água - 1,00€
            </div>
            <div class="bebida">
                <input type="checkbox" name="bebida" value="Cerveja"> Cerveja - 1,20€
            </div>
        </div>
    <br>
    <button id="removerBtn">Remover</button>
    <button id="adicionarBtn">Adicionar</button>
</div>

<script>
      function removerItens() {
            var pratos = document.getElementsByName('prato');
            var bebidas = document.getElementsByName('bebida');

            for (var i = 0; i < pratos.length; i++) {
                  if (pratos[i].checked) {
                    pratos[i].parentNode.style.display = 'none';
                  }
            }

            for (var i = 0; i < bebidas.length; i++) {
                  if (bebidas[i].checked) {
                    bebidas[i].parentNode.style.display = 'none';
                  }
            }
      }

      var removerBtn = document.getElementById('removerBtn');
      removerBtn.addEventListener('click', removerItens);
</script>

    <%
    Connection connection = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/restaurante2";
        String username = "seu_usuario";
        String password = "sua_senha";
        connection = DriverManager.getConnection(url, username, password);

            String deleteQuery = "DELETE FROM produto2 WHERE nome = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);

            for (int i = 0; i < pratos.length; i++) {
                if (pratos[i].checked) {
                    String nomeProduto = pratos[i].value;
                    preparedStatement.setString(1, nomeProduto);
                    preparedStatement.executeUpdate();
                }
            }

            preparedStatement.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>

