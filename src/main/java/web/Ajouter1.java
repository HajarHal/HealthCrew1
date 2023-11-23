package web;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/Ajouter1")
public class Ajouter1 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            // Récupérez les données du formulaire d'ajout de planification
            String debutShift = request.getParameter("debutShift");
            String finShift = request.getParameter("finShift");
            String nom = request.getParameter("nom");
            String jour = request.getParameter("jour");
            String prenom = request.getParameter("prenom");
            String metier = request.getParameter("metier");

            // Ajoutez ces données à la base de données
            String url = "jdbc:mysql://localhost:3306/jee_personnel";
            String user = "root";
            String pwd = "";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection con = DriverManager.getConnection(url, user, pwd);
                     PreparedStatement pst = con.prepareStatement(
                             "INSERT INTO pl (startTime, endTime, nom, jour, prenom, metier) VALUES (?, ?, ?, ?, ?, ?)")) {
                    pst.setString(1, debutShift);
                    pst.setString(2, finShift);
                    pst.setString(3, nom);
                    pst.setString(4, jour);
                    pst.setString(5, prenom);
                    pst.setString(6, metier);

                    // Ajoutez d'autres paramètres à la requête selon vos besoins
                    pst.executeUpdate();
                }
                response.sendRedirect("plannification.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("erreur.jsp"); // Gérer l'erreur d'une manière appropriée
            }
        } else {
            response.sendRedirect("auth.jsp");
        }
    }
}
