<?php
session_start();
include 'config.php';

// Vérifier si le formulaire est soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les valeurs du formulaire
    $id_enseignant = $_POST["id_enseignant"];
    $monday = $_POST["MONDAY"];
    $tuesday = $_POST["TUESDAY"];
    $wednesday = $_POST["WEDNESDAY"];
    $thursday = $_POST["THURSDAY"];
    $friday = $_POST["FRIDAY"];
    $saturday = $_POST["SATURDAY"];
    $sunday = $_POST["SUNDAY"];

    // Vérifier la validité des valeurs avant l'insertion
    $valid = true;

    // Vérifier la validité de la clé étrangère MONDAY
    $query = "SELECT id_horaire FROM horaire WHERE id_horaire = '$monday' OR id_horaire = '$tuesday'";
    $result = mysqli_query($mysqli, $query);
    if (mysqli_num_rows($result) != 1) {
        $valid = false;
        echo "Valeur invalide pour MONDAY.";
    }

    // Vérifier la validité des autres clés étrangères de la même manière

    // Insérer les données dans la table disponibilite si tout est valide
    if ($valid) {
        $query = "INSERT INTO disponibilite (MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY, id_enseignant)
                  VALUES ('$monday', '$tuesday', '$wednesday', '$thursday', '$friday', '$saturday', '$sunday', '$id_enseignant')";

        if (mysqli_query($mysqli, $query)) {
            echo "Disponibilité ajoutée avec succès.";
        } else {
            echo "Erreur lors de l'ajout de la disponibilité : " . mysqli_error($mysqli);
        }
    }
}
?>
