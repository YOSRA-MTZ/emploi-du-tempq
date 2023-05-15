<?php
$databaseHost = 'localhost';
$databaseName = 'medical';
$databaseUsername = 'root';
$databasePassword = ''; 
$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName);

if(!$mysqli){
    echo "not connected ". mysqli_connect_error($mysqli);
}else{
     //echo "connected succesfully";
}
?>