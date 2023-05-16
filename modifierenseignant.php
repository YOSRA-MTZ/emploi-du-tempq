<?php
// including the database connection file
include_once("config.php");


    $id_dispo = $_POST['id_dispo'];
    $lundi = $_POST['lundi'];
    $mardi = $_POST['mardi'];
    $mercredi = $_POST['mercredi'];
    $jeudi = $_POST['jeudi'];
    $vendredi = $_POST['vendredi'];
    $samedi = $_POST['samedi'];
    $enseignant_id = $_POST['id_enseignant'];

    $result = mysqli_query($mysqli, "UPDATE disponibilite SET lundi='$lundi', mardi='$mardi', mercredi='$mercredi', jeudi='$jeudi', vendredi='$vendredi', samedi='$samedi', id_enseignant='$enseignant_id' WHERE enseignant_id=$enseignant_id");
    header("Location: enseignant.php");

?>