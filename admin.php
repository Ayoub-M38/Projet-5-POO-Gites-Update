<div class="admin" style="background-color: #333">
<?php
ob_start();
$title = "GITE.COM -ADMINISTRATION-";
require "classes/GitesModel.php";
$gites = new GitesModel();

?>
    <div class="jumbotron mt-3">
        <div class="text-center">
        <h1 class="text-center text-info">ADMINISTRATION</h1>
        <a href="add_gite_form.php" class="btn btn-outline-info m-2">Ajouter un gite</a>
        </div>
    </div>

<?php
$gites->getAllGitesAdmin();

$content = ob_get_clean();
require "views/template.php";

?>
</div>



