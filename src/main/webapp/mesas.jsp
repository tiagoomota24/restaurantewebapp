<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Restaurante</title>
    <link rel="stylesheet" href="styles/mesas.css">
    <meta charset="UTF-8">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var boxes = document.querySelectorAll(".livre");

            boxes.forEach(function(livre) {
                livre.addEventListener("click", function() {
                    if (this.classList.contains("ocupada")) {
                        this.classList.remove("ocupada");
                        this.classList.add("livre");
                        saveMesaState(this.id, "livre");
                    } else {
                        this.classList.remove("livre");
                        this.classList.add("ocupada");
                        saveMesaState(this.id, "ocupada");
                    }
                });
            });

            function saveMesaState(mesaNumber, newState) {
                var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("action", "guardar_estado_mesa.jsp");

                var mesaNumberInput = document.createElement("input");
                mesaNumberInput.setAttribute("type", "hidden");
                mesaNumberInput.setAttribute("name", "mesaNumber");
                mesaNumberInput.setAttribute("value", mesaNumber);

                var newStateInput = document.createElement("input");
                newStateInput.setAttribute("type", "hidden");
                newStateInput.setAttribute("name", "newState");
                newStateInput.setAttribute("value", newState);

                form.appendChild(mesaNumberInput);
                form.appendChild(newStateInput);

                document.body.appendChild(form);
                form.submit();
            }
        });
    </script>
</head>
<body>
    <div class="center">
        <h2>Mesas</h2>
        <div id="box-container" class="box-container">
            <div id="1" class="livre"><p>Mesa 1</p></div>
            <div id="2" class="livre"><p>Mesa 2</p></div>
            <div id="3" class="livre"><p>Mesa 3</p></div>
            <div id="4" class="livre"><p>Mesa 4</p></div>
            <div id="5" class="livre"><p>Mesa 5</p></div>
            <div id="6" class="livre"><p>Mesa 6</p></div>
            <div id="7" class="livre"><p>Mesa 7</p></div>
            <div id="8" class="livre"><p>Mesa 8</p></div>
            <div id="9" class="livre"><p>Mesa 9</p></div>
            <div id="10" class="livre"><p>Mesa 10</p></div>
            <div id="11" class="livre"><p>Mesa 11</p></div>
            <div id="12" class="livre"><p>Mesa 12</p></div>
        </div>
        <a class="exit-button" href="painel.html">Voltar</a>
    </div>
<%
    try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurante2", "root", "Skr12345");

    String sql = "SELECT numero, estado FROM mesa";
    PreparedStatement statement = connection.prepareStatement(sql);

    ResultSet resultSet = statement.executeQuery();

    while (resultSet.next()) {
    int mesaNumber = resultSet.getInt("numero");
    String mesaEstado = resultSet.getString("estado");
%>
    <script>
        document.getElementById("<%= mesaNumber %>").classList.add("<%= mesaEstado.toLowerCase() %>");
    </script>
<%
    }

    resultSet.close();
    statement.close();
    connection.close();
    } catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
    }
%>
</body>
</html>


