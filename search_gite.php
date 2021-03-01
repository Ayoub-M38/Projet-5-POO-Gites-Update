<?php
ob_start();
$title = "GITE.COM -RECHERCHER-";
require "classes/GitesModel.php";
$res_gites = new GitesModel();

?>
<div class="main-container mt-3">
    <h1 class="text-center text-danger">
        Résultat de votre recherche
    </h1>
<?php
$res_gites->sortGiteByDate();
?>
</div>
<?php

$content = ob_get_clean();
require "views/template.php";
