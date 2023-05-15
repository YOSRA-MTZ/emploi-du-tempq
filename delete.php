<?php
session_start();

include('config.php');

if(isset($_GET['id']) && !empty($_GET['id'])) {
    $id = $_GET['id'];
    
    $sql = mysqli_query($mysqli,"DELETE FROM disponibilite WHERE id_dispo = $id");
    
    header("Location: enseignant.php");
} else {
    echo "Invalid request";
}

mysqli_close($mysqli);
?>
