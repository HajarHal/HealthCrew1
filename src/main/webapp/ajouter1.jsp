<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="ajouter.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <style>
        .wave {
            position: fixed;
            bottom: 0;
            left: 0;
            height: 100%;
            z-index: -1;
        }

        .container {
            width: 100vw;
            height: 100vh;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 7rem;
            padding: 0 2rem;
        }

        .img {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        .img img {
            width: 500px;
        }

        .login-content {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            text-align: center;
        }

        form {
            width: 100%;
        }

        /* Ajout de styles pour les form-group */
        .form-group {
            margin-bottom: 1rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
        }

        input,
        select {
            width: 100%;
            padding: 0.5rem;
        }

        .submit-btn {
        margin-top: 1rem;
        display: flex;
        justify-content: space-between; 
        align-items: center; 
    }

    .submit-btn input {
        flex: 1; 
        margin-right: 0.5rem; 
    }
    .form-group {
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
}

.form-group label {
    margin-right: 1rem;
}

    </style>
</head>
<body>
    <img class="wave" src="https://github.com/sefyudem/Responsive-Login-Form/blob/master/img/wave.png?raw=true">
    <div class="container">
        <div class="img">
            <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/82b8d8efd3b0ac6382b9d0d71a99c6cf9dcefa23/img/bg.svg">
        </div>
        <div class="login-content">
            <form method="POST" action="Ajouter1">
                <h2>Ajouter des Plannification</h2>
                <div class="form-group">
                <label for="nom">Nom</label>
                <input type="text" name="nom" required>
            </div>
            <div class="form-group">
                <label for="prenom">Prenom</label>
                <input type="text" name="prenom" required>
            </div>
           <div class="form-group">
                    <label for="metier">Métier</label>
                    <select name="metier">
                        <option value="Medecin" selected>Médecin</option>
                        <option value="Infermier">Infirmier</option>
                        <option value="Secretaire">Secrétaire médicale</option>
                    </select>
                </div>
            <div class="form-group">
                <label for="jour">Jour</label>
                <input type="date" name="jour" required>
            </div>
            <div class="form-group">
    <label for="debutShift">Début de shift</label>
    <input type="time" name="debutShift" required>
</div>
<div class="form-group">
    <label for="finShift">Fin de shift</label>
    <input type="time" name="finShift" required>
</div>

            <div class="form-group submit-btn">
                <input type="submit" value="Ajouter1">
            </div>
        </form>
    </div>
</div>

</body>
</html>