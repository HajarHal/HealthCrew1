<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%
String login = "";
if(session.getAttribute("login") != null){
    login = session.getAttribute("login").toString();
} else {
    response.sendRedirect("auth.jsp");
}
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Planification des shifts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
     <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
         .user-greeting {
        text-align: right;
        padding: 10px;
        background-color: #fffff;
        color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }
    .user-greeting a {
        color: #fff;
        text-decoration: none;
        margin-left: 1000px;
    }

    .user-greeting a:hover {
        text-decoration: underline;
    }
    .user-greeting-text {
        color: #000; 
    }

        h2 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 12px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            display: inline-block;
            padding: 10px;
            margin-top: 20px;
            background-color: #38d39f;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
        }

        a:hover {
            background-color: #0056b3;
        }

        .icon {
            display: block;
            margin-top: 50px;
            margin-left: auto; 
            margin-right: auto;
        }
    </style>
    <script>
        function confirmerSuppression(nom) {
            return confirm("Voulez-vous vraiment supprimer " + nom + "?");
        }
    </script>
</head>
<body>
    <div class="user-greeting">
        <span class="user-greeting-text">Bonjour <%= login %></span> <a href="Logout">Logout</a>
    </div>
    <h2>Planification des shifts</h2>

    <table>
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Métier</th>
            <th>Jour</th>
            <th>Début de shift</th>
            <th>Fin de shift</th>
            <th>Modifier</th>
        </tr>
        <% 
            try {
                String url = "jdbc:mysql://localhost:3306/jee_personnel";
                String user = "root";
                String pwd = "";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, user, pwd);

                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM pl");

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getString("nom") %></td>
                        <td><%= rs.getString("prenom") %></td>
                        <td><%= rs.getString("metier") %></td>
                        <td><%= rs.getDate("jour") %></td>
                        <td><%= rs.getString("startTime") %></td>
                        <td><%= rs.getString("endTime") %></td>
                        <td>
                            <a href="Delete1?nom=<%=rs.getString("nom") %>"
                               onclick="return confirmerSuppression('<%=rs.getString("nom") %>')">
                               <i class="fas fa-trash-alt"></i> Supprimer
                            </a>
                        </td>
                    </tr>
        <%
                }

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    <a href="ajouter1.jsp"><i class="fas fa-plus-circle"></i> Ajouter la planification</a>

</body>
</html>
