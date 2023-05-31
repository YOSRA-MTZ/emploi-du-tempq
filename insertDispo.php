<?php
session_start();
include("config.php");

if (isset($_POST['id_enseignant'])) {
    $enseignant = $_POST['id_enseignant'];
    $MONDAY = $_POST['MONDAY'];
    $TUESDAY = $_POST['TUESDAY'];
    $WEDNESDAY = $_POST['WEDNESDAY'];
    $THURSDAY = $_POST['THURSDAY'];
    $FRIDAY = $_POST['FRIDAY'];
    $SATURDAY = $_POST['SATURDAY'];
    $SUNDAY = $_POST['SUNDAY'];

    if (empty($enseignant)) {
        $message = 'Veuillez sélectionner un enseignant.';
        echo "<script>alert('$message');</script>";
    } else {
        $query = "INSERT INTO disponibilite (MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY, id_enseignant)  
        VALUES ($MONDAY, $TUESDAY, $WEDNESDAY, $THURSDAY, $FRIDAY, $SATURDAY, $SUNDAY, $enseignant)";

        if (mysqli_query($mysqli, $query)) {
            header("Location: disponibilite.php");
            exit();
        } else {
            $error = mysqli_error($mysqli);
            echo "Erreur lors de l'ajout de la disponibilité : " . $error;
        }
    }
} else {
    echo "Veuillez soumettre le formulaire correctement.";
}
?>
