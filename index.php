
<?php
ob_start();
$title = "GITE.COM -ACCUEIL-";
?>
<div class="main-container mt-3">

<h1 class="text-danger text-center">LOCA-GITES.COM</h1>
<h2 class="text-center text-info">RECHERCHER</h2>
<em class="text-info">Ajouter un calendrier de disponibilité et une carte avec GPS des gites + Select des type a changer en lettre + login pour accerder a admin</em>
<div class="alert-info p-2">

    <form action="search_gite.php" method="post">
        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label for="date_arrivee">Date d'arrivée</label>
                    <input type="date"  name="date_arrivee" class="form-control">
                </div>
                <div class="form-group">
                    <label for="date_depart">Date de depart</label>
                    <input type="date"  name="date_depart" class="form-control">
                </div>
            </div>
            <div class="col-6">
                <div class="form-group">
                    <label for="nbr_chambre">Nombre de chambre</label>
                    <select class="form-control" name="nbr_chambre" id="nbr_chambre">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                    </select>
                </div>
                <br />
                <button type="submit" class="btn btn-outline-warning mt-2">Rechercher</button>
            </div>
        </div>
    </form>
</div>


    <div class="top-vente mt-3">
    <?php

    require "classes/GitesModel.php";
    $gites = new GitesModel();

    ?>
    <h1 class="text-center text-info">TOUS LES GITES DISPONIBLES</h1>
      

    <?php
    $gites->randomGites();
    ?>
    </div>
</div>
<?php
$content = ob_get_clean();
require "views/template.php";

?>

