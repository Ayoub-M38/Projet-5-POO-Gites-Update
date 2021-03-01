<?php

require "Database.php";
class Administration extends Database
{
    public function adminLogin(){
        //Appel de la classe Database + methode PDO
        $db = $this->getPDO();

//si session connecter retourne la page d'accueil
        if(isset($_SESSION['connecter']) && $_SESSION['connecter'] === true){
            header("Location:http://localhost/poo-gites/admin.php");
        }

//1 verifiée les champ du formulaire de connexion = ici email
        if(isset($_POST['email_admin']) && !empty($_POST['email_admin'])){
            $email = htmlspecialchars(strip_tags($_POST['email_admin']));
        }else{
            echo "<p class='alert-danger p-3'>Merci de remplir le champ email</p>";
        }

//1 verifiée les champ du formulaire de connexion = ici mot de passe
        if(isset($_POST['password_admin']) && !empty($_POST['password_admin'])){
            $password = htmlspecialchars(strip_tags($_POST['password_admin']));
        }else{
            echo "<p class='alert-danger p-3'>Merci de remplir le champ mot de passe</p>";
        }
//Verfifié que les champs champs ne sont pas vides et ecrire une requète SQL
        if(!empty($_POST['email_admin']) && !empty($_POST['password_admin'])){
            //Requète de selection filtré a mail et mot passe
            $sql = "SELECT * FROM admin WHERE email_admin = ? AND password_admin = ?";
            //Requete préparée
            $stmt = $db->prepare($sql);
            //Passage des parapmètre bind lié les données du formulaire au paramètres de la requètes SQL
            $stmt->bindParam(1, $_POST['email_admin']);
            $stmt->bindParam(2, $_POST['password_admin']);
            //execution de la requète
            $stmt->execute();

            //Compte les elements = si il y a une entrée (un administrateur dans la table)
            if($stmt->rowCount() >= 1){
                //variable $row stock les recultat de recheche (fetch)
                if($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                    //recup de id
                    $id = $row['id_admin'];
                    //recup de email
                    $email = $row['email_admin'];
                    //recup de mot de passe hashé
                    $hashed_password = $row['password_admin'];
                    //Vérifie que le hachage fourni correspond bien au mot de passe fourni.
                    if(password_verify($_POST['password_admin'], $hashed_password)){
                        echo"Le mot de passe est bon";
                    }else{
                        echo "Erreur de connexion";
                        //Si email entré = email dans la table et mot de passe entré = mot de passe de la table sont egale
                        if($_POST['email_admin'] == $row['email_admin'] && $_POST['password_admin'] == $row['password_admin']){
                            //On demarre une seesion administrateur
                            session_start();
                            //Ici un booléen a utilisé dans chaque page admin
                            $_SESSION['connecter'] = true;
                            $_SESSION['id_admin'] = $id;
                            $_SESSION['email_admin'] = $email;
                            //On stock tous dans la variable super globale $_SESSION et on fait une redirection vers la page d'aacueil
                            header("Location:http://localhost/poo-gites/admin.php");
                        }else{
                            //Sinon on affiche diverses erreurs
                            echo "erreur de connexion merci de vérifié votre email et mot de passe";
                        }
                    }
                }else{
                    echo "aucun element trouver";
                }
            }else{
                echo "<p class='alert-danger p-3'>Erreur de connexion, merci de verifier votre email et mot de passe</p>";
            }

        }
    }


}