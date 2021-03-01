<?php
ob_start();
$title = "GITE.COM -ACCUEIL-";
require "classes/Administration.php";
$admin = new Administration();


?>
<div class="main-container mt-3">
<form action="connexion.php" method="post">
    <h1 class="text-info text-center">CONNEXION A VOTRE ESPACE D'ADMINISTRATION</h1>
    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" name="email_admin" class="form-control" id="email" placeholder="name@example.com" required>
    </div>
    <div class="mb-3">
        <label for="password" class="form-label">Mot de passe</label>
        <input type="password" name="password_admin" class="form-control" id="password" placeholder="mot de passe" required>
    </div>

    <input type="submit" value="Connexion" name="validAdmin" class="btn btn-success">
</form>
</div>


<?php
if(isset($_POST['validAdmin'])){
    $admin->adminLogin();
}else{
    echo "<p class='alert-danger p-3 mt-3'>ATTENTION ! Un seul Administrateur pour ce site !</p>";
}



$content = ob_get_clean();
require "views/template.php";

?>
