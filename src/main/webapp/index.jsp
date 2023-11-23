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
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-n5K0j0p8NqKZnXoMPBkz+4f3pBfZTkIEV9w+UWrX+IiH6Q9E4g3x5FtmC0lVbwhFlJz6qgkgL3g2NtJ1DiJ2Wg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <script>
        function confirmerSuppression(nom) {
            return confirm("Voulez-vous vraiment supprimer " + nom + "?");
        }
    </script>
    <style>
 body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
    }
        div {
            text-align: right;
            padding-bottom: 10px;
        }

        h1 {
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

         a {
        display: inline-block;
        padding: 8px 16px;
        margin: 10px 20px;
        text-decoration: none;
        color: #fff;
        background-color: #38d39f;
        border-radius: 5px;
        transition: background-color 0.3s ease; 
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); 
    }

    a:hover {
        background-color: #0056b3;
    }

        .delete-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 8px;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }
       .count-container {
        display: flex;
        margin-top: 10px;
    }

    .count-box {
        flex: 1;
        background-color: rgba(255, 255, 255, 0.5);
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        text-align: center;
        margin-right: 10px;
    }

    .count {
        font-size: 18px;
        color: #333;
    }

    .icon {
        max-width: 100%;
        max-height: 100%;
        margin-bottom: 10px;
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
    h1 {
        color: #333;
        margin-bottom: 20px;
    }
        
    </style>
    
</head>
<body>
   <div class="user-greeting">
    <span class="user-greeting-text">Bonjour <%= login %></span> <a href="Logout">Logout</a>
</div>

    <h1>Liste des Personnels du cabinet medicale</h1>

    <table border="1" width="100%">
        <tr>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Sexe</th>
            <th>Date Inscription</th>
            <th>Metier</th>
            <th>Action</th>
        </tr>
       <%
    String url  = "jdbc:mysql://localhost:3306/jee_personnel";
    String user = "root";
    String pwd  = "";
    int number = 0;
    int number2 = 0;
    int number3 = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pwd);
        PreparedStatement pst=con.prepareStatement("SELECT * FROM personnels");
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
    %>
            <tr>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(5) %></td>
                <td><%=rs.getString(4) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(6) %></td>
                <td>
                  <a href="Delete?id=<%=rs.getString(1)%>"
                  onclick="return confirmerSuppression('<%=rs.getString(2) %> <%=rs.getString(5) %>')">
                       Supprimer
                    </a>
                 </td>
                

            </tr>
    <%
        }
        rs.close();
        pst.close();

        pst = con.prepareStatement("SELECT COUNT(*) FROM personnels WHERE metier = 'Medecin'");
        rs = pst.executeQuery();
        rs.next();
        number = rs.getInt(1);
        rs.close();
        pst.close();

        pst = con.prepareStatement("SELECT COUNT(*) FROM personnels WHERE metier = 'Infermier'");
        rs = pst.executeQuery();
        rs.next();
        number2 = rs.getInt(1);
        rs.close();
        
        pst.close();
        pst = con.prepareStatement("SELECT COUNT(*) FROM personnels WHERE metier = 'Secretaire'");
        rs = pst.executeQuery();
        rs.next();
        number3 = rs.getInt(1);
        rs.close();
        pst.close();

        con.close();
    } catch(Exception e) {
        System.out.print(e);
    }
    %>
        
    </table>

   <div class="count-container">
    <div class="count-box">
        <p class="count">
            <img src="https://us.123rf.com/450wm/popcornarts/popcornarts2309/popcornarts230900489/214112816-c-est-une-ic%C3%B4ne-hexagonale-m%C3%A9dicale.jpg?ver=6" alt="Medecin Image" class="icon" style="width: 50px; height: 50px;" /> Nombre des médecins : <%= number %>
        </p>
    </div>
    <div class="count-box">
        <p class="count">
            <img src="https://us.123rf.com/450wm/yupiramos/yupiramos1603/yupiramos160313790/53820520-la-conception-des-soins-de-sant%C3%A9-vecteur-illustration-graphique-eps10.jpg?ver=6" alt="Infermier Image" class="icon" style="width: 50px; height: 50px;" /> Nombre des infirmiers : <%= number2 %>
        </p>
    </div>
    <div class="count-box">
        <p class="count">
            <img src="https://syndicatavenirspe.fr/img/2022/05/secretaire-medicale-300x265-1.png" class="icon" style="width: 50px; height: 50px;" /> Nombre des Secrétaires médicales : <%= number3 %>
        </p>
    </div>
</div>



    <a href="ajouter.jsp">Ajouter un personnel</a>
    <a href="plannification.jsp">Ajouter des plannifications</a>

    
</body>
</html>