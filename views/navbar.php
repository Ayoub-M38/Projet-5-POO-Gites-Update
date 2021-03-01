<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.php">GITES.COM</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.php">ACCUEIL <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <?php
                //On demarre la session
                session_start();
                //si session connecter retourne la page d'accueil
                if(isset($_SESSION['connecter']) && $_SESSION['connecter'] === true){
                    ?>
                    <a class="nav-link" href="admin.php">ADMINISTRATION</a>
                    <?php
                }else{
                    ?>
                    <a class="nav-link" href="#"></a>
                <?php
                }
                ?>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">INSCRIPTION</a>
                </li>
                <li class="nav-item active">
                    <?php
                    if(isset($_SESSION['connecter']) && $_SESSION['connecter'] === true){
                        ?>
                        <a class="nav-link btn-danger" href="deconnexion.php">DECONNEXION</a>
                        <?php
                    }else{
                        ?>
                        <a class="nav-link btn-success" href="connexion.php">CONNEXION</a>
                        <?php
                    }
                    ?>
                </li>
            </ul>
        </form>
    </div>
</nav>
