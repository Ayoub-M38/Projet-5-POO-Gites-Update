
<?php
$title = "GITE.COM -DÉTAILS-";
ob_start();
require "classes/GitesModel.php";
$gites = new GitesModel();
?>
<div class="main-container mt-3">
    <h1 class="text-center text-info">TOUS NOS GITES</h1>
    <?php
    $gites->getGiteById();
    ?>
</div>

<?php
$content = ob_get_clean();
require "views/template.php";
