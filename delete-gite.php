
<?php
ob_start();
$title = "GITE.COM -ACCUEIL-";
require "classes/GitesModel.php";
$gites = new GitesModel();
$gites->deleteGite();
//header("Location: index.php");
?>