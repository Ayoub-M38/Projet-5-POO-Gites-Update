<?php
require "Database.php";

class GitesModel extends Database
{
    //Récupérations de tous les gites
    public function getAllGites(){
        //Appel de la classe Database + methode PDO
        $db = $this->getPDO();
        //Requète selectionne tous les gites
        $req = $db->query("SELECT * FROM gites INNER JOIN category_gites ON gites.gite_category = category_gites.id_category");
            ?>
                <div class="row">
                    <?php
                    //Boucle de lecture
                foreach ($req as $row){
                    $today = date('Y-m-d');

                    //Si le site est boolean disponible 0 = False et 1 = true;
                    //Si la date d'aujoud'hui dépasse la date d'arrive il devient indisponible
                    if(strtotime($today) < strtotime($row['date_arrivee']) && $row['disponible'] == 1){

                    ?>
                    <div class="col-4 mt-3">
                        <div class="card">
                            <img src="<?= $row['img_gite'] ?>" class="card-img-top img-fluid" alt="...">
                            <div class="card-body">
                                <h4 class="card-title text-info"><?= $row['nom_gite'] ?></h4>
                                <h5 class="text-danger">Type: <?= $row['type'] ?></h5>
                                <p class="card-text"><b>Description : </b></p>
                                <p><?= $row['description_gite'] ?></p>
                                <p><b>Nombre de chambre : </b><b class="text-danger"><?= $row['nbr_chambre'] ?></b></p>
                                <p><b>Nombre de salle de bains : </b><b class="text-danger"><?= $row['nbr_sdb'] ?></b></p>
                                <p><b>Zone géographique : </b><b class="text-info"><?= $row['zone_geo'] ?></b></p>
                                <p><b>Prix à la semaine : </b><b class="text-success"><?= $row['prix'] ?> €</b></p>

                                <?php
                                $dispo = $row['disponible'];

                                //si $dispo vaut 0 = on affiche NON sinon on affiche OUI
                                if($dispo == false){
                                    $dispo =  "NON";
                                }else{
                                    $dispo = "OUI";
                                }
                                ?>

                                <p><b>Disponible : </b><b class="text-warning"><?= $dispo ?></b></p>
                                <?php
                                $date_a = new DateTime($row['date_arrivee']);
                                $date_d = new DateTime($row['date_depart']);
                                ?>
                                <p><b>Date d'arrivée : </b> </p>
                                <p class="alert-success p-2"><?=  $date_a->format('d-m-Y à H:i:s')?></p>

                                <p><b>Date de depart : </b></p>
                                <p class="alert-info p-2"> <?=  $date_d->format('d-m-Y à H:i:s')?></p>
                                <a href="details-gite.php?id=<?= $row['id'] ?>" class="btn btn-outline-info">Plus d'infos</a>
                            </div>
                        </div>
                    </div>
                    <?php
                    }elseif (strtotime($today) > strtotime($row['date_depart']) && $row['disponible'] == 0){
                        $row['disponible'] = 1;
                    }
                }
                    ?>
                </div>
            <?php

    }

    //Gite par id
    public function getGiteById(){
        $db = $this->getPDO();
        $req = $db->prepare("SELECT * FROM gites INNER JOIN category_gites ON gites.gite_category = category_gites.id_category WHERE gites.id = ? ");
        $id = $_GET['id'];
        $req->bindParam(1, $id);
        $req->execute();
        $res = $req->fetch();
        ?>
        <div>
            <h2 class="text-center text-warning"><?= $res['nom_gite'] ?></h2>
            <h3 class="text-center text-info">Type : <?= $res['type'] ?></h3>
            <div class="row mt-5">
                <div class="col-6">
                    <img width="100%" src="<?= $res['img_gite'] ?>" alt="<?= $res['nom_gite'] ?>" title="<?= $res['nom_gite'] ?>"/>
                </div>
                <div class="col-6">
                    <p class="card-text"><b>Description : </b></p>
                    <p><?= $res['description_gite'] ?></p>
                    <p><b>Nombre de chambre : </b><b class="text-danger"><?= $res['nbr_chambre'] ?></b></p>
                    <p><b>Nombre de salle de bains : </b><b class="text-danger"><?= $res['nbr_sdb'] ?></b></p>
                    <p><b>Zone géographique : </b><b class="text-info"><?= $res['zone_geo'] ?></b></p>
                    <p><b>Prix à la semaine : </b><b class="text-success"><?= $res['prix'] ?> €</b></p>

                    <?php
                    $dispo = $res['disponible'];
                    if($dispo == false){
                        echo $dispo =  "NON";
                    }else{
                        echo  $dispo = "OUI";
                    }
                    ?>

                    <p><b>Disponible : </b><b class="text-warning"><?= $dispo ?></b></p>
                    <?php
                    $date_a = new DateTime($res['date_arrivee']);
                    $date_d = new DateTime($res['date_depart']);
                    ?>
                    <p><b>Date d'arrivée : </b> </p>
                    <p class="alert-success p-2"><?=  $date_a->format('d-m-Y à H:i:s')?></p>

                    <p><b>Date de depart : </b></p>
                    <p class="alert-info p-2"> <?=  $date_d->format('d-m-Y à H:i:s')?></p>
                    <a href="reservation.php?id=<?= $res['id'] ?>" class="btn btn-outline-info">RESERVER</a>
                    <a href="index.php" class="btn btn-outline-danger">RETOUR</a>
                </div>
            </div>
        </div>
        <?php
    }

    public function sortGiteByDate(){
        $db = $this->getPDO();
        $today = date("d-m-Y");

        if(isset($_POST['date_arrivee'])){
            $date_start = $_POST['date_arrivee'];
        }
        if(isset($_POST['date_depart'])){

            $date_end = $_POST['date_depart'];
        }

        if(isset($_POST['nbr_chambre'])){
            $nbr_chambre = $_POST['nbr_chambre'];
        }
        /*
        var_dump($date_start);
        var_dump($date_end);
        var_dump($nbr_chambre);
        */

        $search = $db->query("SELECT * FROM gites WHERE  date_arrivee  > '".$date_start."' AND date_depart < '".$date_end."' AND nbr_chambre = '".$nbr_chambre."'");
        ?>
        <div class="row">
            <?php
            foreach ($search as $row){
                ?>
                <div class="col-4 mt-3">
                    <div class="card" style="width: 22rem;">
                        <img  src="<?= $row['img_gite'] ?>" class="card-img-top img-fluid" alt="...">
                        <div class="card-body">
                            <h5 class="card-title text-info"><?= $row['nom_gite'] ?></h5>
                            <p class="card-text"><b>Description : </b></p>
                            <p><?= $row['description_gite'] ?></p>
                            <p><b>Nombre de chambre : </b><b class="text-danger"><?= $row['nbr_chambre'] ?></b></p>
                            <p><b>Nombre de salle de bains : </b><b class="text-danger"><?= $row['nbr_sdb'] ?></b></p>
                            <p><b>Zone géographique : </b><b class="text-info"><?= $row['zone_geo'] ?></b></p>
                            <p><b>Prix à la semaine : </b><b class="text-success"><?= $row['prix'] ?> €</b></p>

                            <?php
                            $dispo = $row['disponible'];
                            if($dispo == false){
                                $dispo =  "NON";
                            }else{
                                $dispo = "OUI";
                            }
                            ?>

                            <p><b>Disponible : </b><b class="text-warning"><?= $dispo ?></b></p>
                            <?php
                            $date_a = new DateTime($row['date_arrivee']);
                            $date_d = new DateTime($row['date_depart']);
                            ?>
                            <p><b>Date d'arrivée : </b> </p>
                            <p class="alert-success p-2"><?=  $date_a->format('d-m-Y à H:i:s')?></p>

                            <p><b>Date de depart : </b></p>
                            <p class="alert-info p-2"> <?=  $date_d->format('d-m-Y à H:i:s')?></p>
                            <a href="details-gite.php?id=<?= $row['id'] ?>" class="btn btn-outline-info">Plus d'infos</a>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
        <?php

    }


    public function randomGites(){
        $today = date("Y-m-d");

        $db = $this->getPDO();
        //SELECT * FROM gites WHERE  date_arrivee  > '".$date_start."' AND date_depart < '".$date_end."' AND nbr_chambre = '".$nbr_chambre."
        $req = $db->query("SELECT * FROM gites WHERE date_depart < '".$today."' AND disponible = 1");
        ?>
        <div class="row">
            <?php
            foreach ($req as $row){
                /*
                echo "Date du jour :" .$today;
                echo "Date de depart :" .$row['date_depart'];
                */
                $dispo = $row['disponible'];
                if($dispo == false) {
                    $dispo = "NON";
                }else {
                    $dispo = "OUI";
                }
                    ?>
                    <div id="gite-dispo" class="col-4 mt-3">
                        <div class="card">
                            <h3 class="card-title text-info alert-warning p-2"><?= $row['nom_gite'] ?></h3>
                            <img  src="<?= $row['img_gite'] ?>" class="card-img-top img-fluid" alt="...">
                            <div class="card-body">
                                <p><b>Disponible : </b><b class="text-warning"><?= $dispo ?></b></p>
                                <p class="card-text"><b>Description : </b></p>
                                <p><?= $row['description_gite'] ?></p>
                                <p><b>Nombre de chambre : </b><b class="text-danger"><?= $row['nbr_chambre'] ?></b></p>
                                <p><b>Nombre de salle de bains : </b><b class="text-danger"><?= $row['nbr_sdb'] ?></b></p>
                                <p><b>Zone géographique : </b><b class="text-info"><?= $row['zone_geo'] ?></b></p>
                                <p><b>Prix à la semaine : </b><b class="text-success"><?= $row['prix'] ?> €</b></p>

                                <?php
                                $date_a = new DateTime($row['date_arrivee']);
                                $date_d = new DateTime($row['date_depart']);
                                ?>
                                <p><b>Date d'arrivée : </b> </p>
                                <p class="alert-success p-2"><?=  $date_a->format('d-m-Y')?></p>

                                <p><b>Date de depart : </b></p>
                                <p class="alert-info p-2"> <?=  $date_d->format('d-m-Y')?></p>
                                <a href="details-gite.php?id=<?= $row['id'] ?>" class="btn btn-outline-info mt-2">Plus d'infos</a>
                            </div>
                        </div>
                    </div>
                    <?php
                }

            ?>
        </div>
        <?php

    }

    //CRUD
    public function getAllGitesAdmin(){
        $db = $this->getPDO();
        $req = $db->query("SELECT * FROM gites INNER JOIN category_gites ON gites.gite_category = category_gites.id_category");
        ?>
        <div class="row">
            <?php
            foreach ($req as $row){
                ?>
                <div class="col-4 mt-3">
                    <div class="card">
                        <img  src="<?= $row['img_gite'] ?>" class="card-img-top img-fluid" alt="...">
                        <div class="card-body">
                            <h5 class="card-title text-info"><?= $row['nom_gite'] ?></h5>
                            <p class="card-text"><b>Description : </b></p>
                            <p><?= $row['description_gite'] ?></p>
                            <p><b>Type de logement :</b><b class="text-info"><?= $row['type'] ?></b></p>
                            <p><b>Nombre de chambre : </b><b class="text-danger"><?= $row['nbr_chambre'] ?></b></p>
                            <p><b>Nombre de salle de bains : </b><b class="text-danger"><?= $row['nbr_sdb'] ?></b></p>
                            <p><b>Zone géographique : </b><b class="text-info"><?= $row['zone_geo'] ?></b></p>
                            <p><b>Prix à la semaine : </b><b class="text-success"><?= $row['prix'] ?> €</b></p>

                            <?php
                            $dispo = $row['disponible'];
                            if($dispo == false){
                                $dispo =  "NON";
                            }else{
                                $dispo = "OUI";
                            }
                            ?>

                            <p><b>Disponible : </b><b class="text-warning"><?= $dispo ?></b></p>
                            <?php
                            $date_a = new DateTime($row['date_arrivee']);
                            $date_d = new DateTime($row['date_depart']);
                            ?>
                            <p><b>Date d'arrivée : </b> </p>
                            <p class="alert-success p-2"><?=  $date_a->format('d-m-Y')?></p>

                            <p><b>Date de depart : </b></p>
                            <p class="alert-info p-2"> <?=  $date_d->format('d-m-Y')?></p>
                            <a href="details-gite.php?id=<?= $row['id'] ?>" class="btn btn-outline-info">Plus d'infos</a>
                            <br /><br />
                            <a href="update_gite.php?id=<?= $row['id'] ?>" class="btn btn-outline-warning">Editer le gite</a>
                            <br /><br />
                            <a href="delete-gite.php?id=<?= $row['id'] ?>" class="btn btn-outline-danger">Suprimer le gite</a>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
        <?php

    }



    //Ajouter un gite
    public function addGite(){
        if(isset($_POST['nom_gite'])){
            $nom_gite = $_POST['nom_gite'];
        }

        if(isset($_POST['description_gite'])){
            $description_gite = $_POST['description_gite'];
        }

        if(isset($_POST['img_gite'])){
            $img_gite = $_POST['img_gite'];
        }

        if(isset($_POST['nbr_chambre'])){
            $nbr_chambre = $_POST['nbr_chambre'];
        }

        if(isset($_POST['nbr_sdb'])){
            $nbr_sdb= $_POST['nbr_sdb'];
        }

        if(isset($_POST['zone_geo'])){
            $zone_geo = $_POST['zone_geo'];
        }

        if(isset($_POST['prix'])){
            $prix = $_POST['prix'];
        }

        if(isset($_POST['disponible'])){
            $disponible = $_POST['disponible'];
        }

        if(isset($_POST['date_arrivee'])){
            $date_arrivee = $_POST['date_arrivee'];
        }

        if(isset($_POST['date_depart'])){
            $date_depart = $_POST['date_depart'];
        }

        if(isset($_POST['type_gite'])){
            $type_gite = $_POST['type_gite'];
        }

        try{
            $db = $this->getPDO();
            $req = $db->prepare("INSERT INTO gites (nom_gite, description_gite, img_gite, nbr_chambre, nbr_sdb, zone_geo, prix, disponible, date_arrivee, date_depart, gite_category) VALUES (?,?,?,?,?,?,?,?,?,?,?) ");
            $req->bindParam(1, $nom_gite);
            $req->bindParam(2, $description_gite);
            $req->bindParam(3, $img_gite);
            $req->bindParam(4, $nbr_chambre);
            $req->bindParam(5, $nbr_sdb);
            $req->bindParam(6, $zone_geo);
            $req->bindParam(7, $prix);
            $req->bindParam(8, $disponible);
            $req->bindParam(9, $date_arrivee);
            $req->bindParam(10, $date_depart);
            $req->bindParam(11, $type_gite);
            $insert = $req->execute(array($nom_gite, $description_gite, $img_gite, $nbr_chambre, $nbr_sdb, $zone_geo, $prix, $disponible, $date_arrivee, $date_depart, $type_gite));
            if($insert){
                header("Location: http://localhost/poo-gites/admin.php");
                var_dump($req);
                return $req;
            }else{
                echo "<p class='alert-danger p-3'>Une erreur est survenue durant l'ajout du gite, merci de verifié tous les champs !</p>";
            }

        }catch (PDOException $e){
            echo "Erreur : Merci de vérifié les données du formulaire";
        }

    }


    public function updateGite(){

        $db = $this->getPDO();

        if(isset($_POST['nom_gite'])){
            $update_nom_gite = $_POST['nom_gite'];
        }

        if(isset($_POST['description_gite'])){
            $update_description_gite = $_POST['description_gite'];
        }

        if(isset($_POST['img_gite'])){
            $update_img_gite = $_POST['img_gite'];
        }

        if(isset($_POST['nbr_chambre'])){
            $update_nbr_chambre = $_POST['nbr_chambre'];
        }

        if(isset($_POST['nbr_sdb'])){
            $update_nbr_sdb= $_POST['nbr_sdb'];
        }

        if(isset($_POST['zone_geo'])){
            $update_zone_geo = $_POST['zone_geo'];
        }

        if(isset($_POST['prix'])){
            $update_prix = $_POST['prix'];
        }

        if(isset($_POST['disponible'])){
            $update_disponible = $_POST['disponible'];
        }

        if(isset($_POST['date_arrivee'])){
            $update_date_arrivee = $_POST['date_arrivee'];
        }

        if(isset($_POST['date_depart'])){
            $update_date_depart = $_POST['date_depart'];
        }

        if(isset($_POST['type_gite'])){
            $type_gite = $_POST['type_gite'];
        }

        $sql = "UPDATE gites SET nom_gite = ?, description_gite = ?, img_gite = ?, nbr_chambre = ?, nbr_sdb = ?, zone_geo = ?, prix = ?, disponible = ?, date_arrivee = ?, date_depart = ?, gite_category = ? WHERE id = ?";
        $id = $_GET['id'];
        $req = $db->prepare("SELECT * FROM gites WHERE id = ?");
        $req->fetch(PDO::FETCH_ASSOC);
        $update = $update = $db->prepare($sql);
        $update->bindParam(1, $update_nom_gite);
        $update->bindParam(2, $update_description_gite);
        $update->bindParam(3, $update_img_gite);
        $update->bindParam(4, $update_nbr_chambre);
        $update->bindParam(5, $update_nbr_sdb);
        $update->bindParam(6, $update_zone_geo);
        $update->bindParam(7, $update_prix);
        $update->bindParam(8, $update_disponible);
        $update->bindParam(9, $update_date_arrivee);
        $update->bindParam(10, $update_date_depart);
        $update->bindParam(11, $type_gite);
        $maj = $update->execute(array($update_nom_gite, $update_description_gite, $update_img_gite, $update_nbr_chambre, $update_nbr_sdb, $update_zone_geo, $update_prix, $update_disponible, $update_date_arrivee, $update_date_depart, $type_gite, $id));
        if($maj){
            header("Location:http://localhost/poo-gites/admin.php");
        }else{
            echo "<p class='alert-danger p-2'>Merci de verifié et remplir tous les champs !</p>";
        }

        //var_dump($update);
    }


    public function deleteGite(){
        try {
            $db = $this->getPDO();
            $id = (isset($_GET['id']) ? $_GET['id'] : '');
            $sql = "DELETE FROM gites WHERE id = ?";
            $req = $db->prepare($sql);
            $req->bindParam(1,$id);
            $req->execute(array($id));
            if($req){
                echo "<p class='alert-danger p-2'>L'élément à bien été suprimer</p>";
                echo "<a href='index.php' class='btn btn-outline-success'>Retour</a>";
            }else{
                echo "<p class='alert-warning p-2'>Une erreur est survenue duarant la supression de cet élément.</p>";
            }
        }catch (PDOException $e){
            echo "Erreur : Impossible de supprimer cet éléments !" .$e->getMessage();
        }

    }


    function disabledGite(){
        $db = $this->getPDO();
        $sql = "UPDATE gites SET disponible=0 WHERE id = ?";
        $changeStatus = $db->prepare($sql);
        $id = (isset($_GET['id']) ? $_GET['id'] : '');
        $changeStatus->bindParam(1, $id);
        $res = $changeStatus->execute();
        if($res){
            echo "<p class='alert-success p-3'>Votre est bien reservé</p>";
            echo "<a class='btn btn-success' href='index.php'>Retour</a>";
        }else{
            echo "<p class='alert-danger p-3'>Une erreur est survenue lors de la reservation, merci de verifié vos email !</p>";
        }


    }
}