<?php
session_start();

$_SESSION = array();

session_destroy();

header("location: http://localhost/poo-gites/index.php");
exit();