<?php

$title = "GITE.COM -DÉTAILS-";
ob_start();
echo "Votre gite est reserver";
require "classes/GitesModel.php";
$db = new GitesModel();
$db->getPDO();
$db->disabledGite();

$content = ob_get_clean();
require "views/template.php";







