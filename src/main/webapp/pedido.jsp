<%@ page import="java.sql.*" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="5">
    <title>Restaurante</title>
    <link rel="stylesheet" href="styles/pedidos.css">
</head>
<body>
<div class="center">
    <h2>Pedidos</h2>
    <div class="pedidos-container">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurante2", "root", "Skr12345");

                String sql = "SELECT pedido.id_pedido, produto.nome, mesa.numero, info_pedido.quantidade FROM pedido JOIN mesa ON pedido.mesa = mesa.numero JOIN info_pedido ON pedido.id_pedido = info_pedido.pedido JOIN produto ON info_pedido.produto = produto.id_produto ORDER BY pedido.id_pedido;";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();

                int pedidoAtual = -1;
                int mesaAtual = -1;
                StringBuilder produtosPedido = new StringBuilder();

                while (resultSet.next()) {
                    int numeroPedido = resultSet.getInt("id_pedido");
                    int numeroMesa = resultSet.getInt("numero");
                    String nomeProduto = resultSet.getString("nome");
                    int quantidadeProduto = resultSet.getInt("quantidade");

                    if (pedidoAtual != numeroPedido) {
                        if (pedidoAtual != -1) {
        %>
        <div class="area">
            <p>Pedido - <%= pedidoAtual %> | Mesa - <%= mesaAtual %></p>
            <textarea rows="13" cols="20"><%= produtosPedido.toString() %></textarea>
        </div>
        <%
                        produtosPedido = new StringBuilder();
                    }

                    pedidoAtual = numeroPedido;
                    mesaAtual = numeroMesa;
                }

                produtosPedido.append(quantidadeProduto).append("x ").append(nomeProduto).append("\n");
            }

            if (pedidoAtual != -1) {
        %>
        <div class="area">
            <p>Pedido - <%= pedidoAtual %> | Mesa - <%= mesaAtual %></p>
            <textarea rows="13" cols="20"><%= produtosPedido.toString() %></textarea>
        </div>
        <%
                }

                resultSet.close();
                statement.close();
                connection.close();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
    </div>
    <a class="exit-button" href="painel.html">Voltar</a>
</div>
</body>
</html>



