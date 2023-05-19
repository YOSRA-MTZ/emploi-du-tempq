<?php
        $sql = "SELECT enseignant.nom_enseignant
        FROM disponibilite
        INNER JOIN enseignant ON disponibilite.id_enseignant = enseignant.id_enseignant";
        $conn = new mysqli($databaseHost, $databaseUsername, $databasePassword, $databaseName);
        $result = $conn->query($sql);

                echo $nom_enseignant; 
       
        ?>
