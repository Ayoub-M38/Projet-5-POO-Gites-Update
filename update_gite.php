<div class="update" style="background-color: azure">


<?php
ob_start();
$title = "GITE.COM -MISE A JOUR-";
require "classes/GitesModel.php";
$gites = new GitesModel();
$gites->getGiteById();



?>
    <div class="main-container mt-3">
        <h1 class="text-info text-center">Mettre à jour un gite</h1>
        <form action="" method="post" enctype="multipart/form-data">

            <div class="form-group">
                <label for="nom_gite">Nom du gite : </label>
                <input type="text"  class="form-control" id="nom_gite" name="nom_gite" placeholder="test de valeur">
            </div>

            <div class="form-group">
                <label for="description_gite">Description du gite : </label>
                <textarea class="form-control" id="description_gite" name="description_gite" rows="3" placeholder=""></textarea>
            </div>

            <div class="form-group">
                <label for="img_gite">Image du gite : </label>
                <br />
                <input class="btn btn-outline-success" value="" type="file" id="img_gite" name="img_gite" accept="image/png, image/jpeg, image/svg">
            </div>


            <div class="form-group">
                <label for="nbr_chambre">Nombre de chambre : </label>
                <select class="form-control" id="nbr_chambre" name="nbr_chambre">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                </select>
            </div>

            <div class="form-group">
                <label for="nbr_sdb">Nombre de salle de bains : </label>
                <select class="form-control" id="nbr_sdb" name="nbr_sdb">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                </select>
            </div>

            <div class="form-group">
                <label for="zone_geo">Zone géographique : </label>
                <input type="text" class="form-control" id="zone_geo" name="zone_geo" placeholder=""/>
            </div>

            <div class="form-group">
                <label for="prix">Prix / semaine : </label>
                <input type="number" step="0.01" class="form-control" id="prix" name="prix" placeholder="">
            </div>

            <div class="form-group">
                <label for="disponible">Disponible : </label>
                <select class="form-control" name="disponible" id="disponible">
                    <option value="0">OUI</option>
                    <option value="1">NON</option>
                </select>
            </div>

            <div class="form-group">
                <label for="date_arrivee">Date d'arrivée : </label>
                <input type="date" id="date_arrivee" name="date_arrivee" placeholder="">
            </div>

            <div class="form-group">
                <label for="date_depart">Date de départ : </label>
                <input type="date" id="date_depart" name="date_depart" placeholder="">
            </div>

            <div class="form-group">
                <label for="type_gite">Type de gite</label>
                <select name="type_gite" class="form-control" id="type_gite">
                    <option value="1">Maison</option>
                    <option value="2">Villa</option>
                    <option value="3">Appartement</option>
                    <option value="4">Chalet</option>
                    <option value="5">Camping</option>
                    <option value="6">Hotel</option>
                    <option value="7">Igloo</option>
                    <option value="8">Yourt</option>
                </select>
            </div>

            <button type="submit" class="btn btn-outline-primary">Mettre à jour le gite</button>
        </form>

    </div>
<?php
//Gestion upload image
if(isset($_FILES['img_gite'])){
    $uploaddir = 'assets/img/';
    $img_gite = $uploaddir . basename($_FILES['img_gite']['name']);
    $_POST['img_gite'] = $img_gite;
    if(move_uploaded_file($_FILES['img_gite']['tmp_name'], $img_gite)){

        echo '<p class="alert-success">Le fichier est valide et à été téléchargé avec succès !</p>';
    }else{
        echo '<p class="alert-danger">Une erreur s\'est produite, le fichier n\'est pas valide !</p>';
    }
}else{
    echo "<p class='alert-warning p-2'>Merci de respecter le format d'image valide : png, svg, jpg, jpeg, webp !</p>";
}
/*
var_dump($_POST['nom_gite']);
var_dump($_POST['description_gite']);
var_dump($_POST['img_gite']);
var_dump($_POST['nbr_chambre']);
var_dump($_POST['nbr_sdb']);
var_dump($_POST['zone_geo']);
var_dump($_POST['prix']);
var_dump($_POST['disponible']);
var_dump($_POST['date_arrivee']);
var_dump($_POST['date_depart']);
var_dump($_POST['type_gite']);
var_dump($_FILES);

*/

$gites->updateGite();
$content = ob_get_clean();
require "views/template.php";

?>



