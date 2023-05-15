<?php
session_start();
extract($_POST);
include("config.php");
$enseignant = $_POST['enseignant'];
$lundi=$_POST['lundi'];
$mardi=$_POST['mardi'];
$mardi=$_POST['mercredi'];
$mardi=$_POST['jeudi'];
$mardi=$_POST['vendredi'];
$mardi=$_POST['samedi'];
if( empty($enseignant ) ){
    $message = 'Veuillez selectionner un Enseignant.';

            echo "<SCRIPT> //not showing me this
                alert('$message')
                window.location.replace('AddEnseignant.php');
            </SCRIPT>";
            exit;
} else {
    $result = mysqli_query($mysqli, "INSERT INTO disponibilite(lundi,mardi,mercredi,jeudi,vendredi,samedi,id_enseignant) 
    VALUES('$lundi','$mardi','$mercredi','$jeudi','$vendredi','$samedi','$enseignant')");
  
   header("Location:enseignant.php");

}?>