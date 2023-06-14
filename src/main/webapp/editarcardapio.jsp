<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
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
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3306/restaurante2";
                String username = "root";
                String password = "Skr12345";

                conn = DriverManager.getConnection(url, username, password);

                String query = "SELECT produto, preco FROM produto2";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);
                
                while (rs.next()) {
                    String produto = rs.getString("produto");
                    double preco = rs.getDouble("preco");
        %>
        <div class="prato">
            <p><%= produto %> - <%= preco %>€</p>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (stmt != null) {
                    try {
                        stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
    <a href="retirarproduto.html" id="removerBtn">Remover</a>
    <a href="" id="adicionarBtn">Adicionar</a>
</div>
</body>
</html>


