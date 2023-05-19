<?php
session_start();

include('config.php');

if (isset($_POST['search'])) {
    $search_term = mysqli_real_escape_string($mysqli, $_POST['search_term']);
    $sql = "SELECT *, enseignant.nom_enseignant FROM disponibilite
            JOIN enseignant ON disponibilite.id_enseignant = enseignant.id_enseignant
            WHERE enseignant.nom_enseignant LIKE '%$search_term%'";
} else {
    $sql = "SELECT *, enseignant.nom_enseignant FROM disponibilite
            JOIN enseignant ON disponibilite.id_enseignant = enseignant.id_enseignant";
}

$result = mysqli_query($mysqli, $sql);

?>
<!DOCTYPE html>
<html lang="en">


<!-- attendance23:24-->

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>Mundiapolis</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">

</head>

<body>
    <div class="main-wrapper">
        <div class="header">
            <div class="header-left">
                <a href="index-2.php" class="logo">
                    <img src="assets/img/mundiap.png" width="40" height="40">
                </a>
            </div>
            <a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
            <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
            <ul class="nav user-menu float-right">
                <li class="nav-item dropdown">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"><i class="fa fa-bell-o"></i> <span class="badge badge-pill bg-danger float-right">3</span></a>
                    <div class="dropdown-menu notifications">
                        <div class="topnav-dropdown-header">
                            <span>Notifications</span>
                        </div>
                        <div class="drop-scroll">

                        </div>
                        <div class="topnav-dropdown-footer">
                            <a href="notification.php">Voir tous les Notifications</a>
                        </div>
                    </div>
                </li>

                <li class="nav-item dropdown has-arrow">
                    <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img"><img class="rounded-circle" src="assets/img/user.jpg" width="40" alt="Admin">
                            <span class="status online"></span></span>
                        <span>Admin</span>
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="profile.php">My Profile</a>

                        <a class="dropdown-item" href="login.php">Logout</a>
                    </div>
                </li>
            </ul>
            <div class="dropdown mobile-user-menu float-right">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="profile.php">My Profile</a>

                    <a class="dropdown-item" href="login.php">Logout</a>
                </div>
            </div>
        </div>
        <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="menu-title">Menu</li>
                        <li>
                            <a href="index-2.php"><i class="fa fa-home"></i> <span>Accueil</span></a>
                        </li>

                        <li>
                            <a href="demande.php"><i class="fa fa-envelope-open-o"></i> <span>Liste de demande</span></a>
                        </li>

                        <li>
                            <a href="emploi.php"><i class="fa fa-calendar-o"></i> <span>Emploi du temps</span></a>

                        </li>
                        <li class="active">
                            <a href="disponibilite.php"><i class="fa fa-list"></i><span>Disponibilité enseignant</span></a>

                        <li>
                        <li>
                            <a href="notification.php"><i class="fa fa-bell-o"></i> <span>Notifications</span></a>

                        </li>
                        <li>
                            <a href="calendar.php"><i class="fa fa-calendar"></i> <span>Calendrier</span></a>
                        </li>
                        <li class="submenu">
                        <a href="#"><i class="fa fa-cog"></i> <span> Paramétrage </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li class="active"><a href="enseignant.php"><i class="fa fa-user"></i>Enseignant</a></li>
                            
                        </ul>
                    </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-4">
                        <h2>Liste des disponibilités</h2>
                    </div>
                    <div class="col-sm-8 col-9 text-right ">
                        <a href="AddDispo.php" class="btn btn-primary float-right btn-rounded" ><i class="fa fa-plus" aria-hidden="true"></i> Ajouter disponibilité</a>
                    </div>
                </div>

                
                    <div class="row filter-row">
                        <div class="col-sm-12 col-md-6">
                            <div class="form-group form-focus">
                                <label class="focus-label">Nom de l'enseignant</label>
                                <input type="text" class="form-control floating" name="search_term">
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <button type="submit" name="search" class="btn btn-success btn-block"><i class="fa fa-search" aria-hidden="true"></i></button>

                        </div>


                    </div>
            
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="fl-table">
                                <thead>
                                    <tr>
                                        <th>Enseignant</th>
                                        <th>Lundi</th>
                                        <th>Mardi</th>
                                        <th>Mercredi</th>
                                        <th>Jeudi</th>
                                        <th>Vendredi</th>
                                        <th>Samedi</th>
                                        <th>Action</th>

                                    </tr>

                                </thead>
                                <tbody>
                                    <?php while ($row = mysqli_fetch_array($result)) {




                                        echo "<tr>";
                                        echo "<td>" . $row['nom_enseignant'] . "</td>";

                                        echo "<td>";
                                        if ($row['lundi'] == 1) {
                                            echo "AM";
                                        } elseif ($row['lundi'] == 2) {
                                            echo "PM";
                                        } elseif ($row['lundi'] == 3) {
                                            echo "AM/PM";
                                        } else {
                                            echo "-";
                                        }
                                        echo "</td>";

                                        echo "<td>";
                                        if ($row['mardi'] == 1) {
                                            echo "AM";
                                        } elseif ($row['mardi'] == 2) {
                                            echo "PM";
                                        } elseif ($row['mardi'] == 3) {
                                            echo "AM/PM";
                                        } else {
                                            echo "-";
                                        }
                                        echo "</td>";

                                        echo "<td>";
                                        if ($row['mercredi'] == 1) {
                                            echo "AM";
                                        } elseif ($row['mercredi'] == 2) {
                                            echo "PM";
                                        } elseif ($row['mercredi'] == 3) {
                                            echo "AM/PM";
                                        } else {
                                            echo "-";
                                        }
                                        echo "</td>";

                                        echo "<td>";
                                        if ($row['jeudi'] == 1) {
                                            echo "AM";
                                        } elseif ($row['jeudi'] == 2) {
                                            echo "PM";
                                        } elseif ($row['jeudi'] == 3) {
                                            echo "AM/PM";
                                        } else {
                                            echo "-";
                                        }
                                        echo "</td>";

                                        echo "<td>";
                                        if ($row['vendredi'] == 1) {
                                            echo "AM";
                                        } elseif ($row['vendredi'] == 2) {
                                            echo "PM";
                                        } elseif ($row['vendredi'] == 3) {
                                            echo "AM/PM";
                                        } else {
                                            echo "-";
                                        }
                                        echo "</td>";

                                        echo "<td>";

                                        if ($row['samedi'] == 1) {
                                            echo "AM";
                                        } elseif ($row['samedi'] == 2) {
                                            echo "PM";
                                        } elseif ($row['samedi'] == 3) {
                                            echo "AM/PM";
                                        } else {
                                            echo "-";
                                        }
                                        echo "</td>";
                                        echo "<td> <a href=\"EditDispo.php?id_dispo=" . $row['id_dispo'] . "\" style=\"margin-right:10px; color:green;\"><i class=\"fa fa-pencil m-r-5\"></i></a>
                                        <a href=\"deleteDispo.php?id_dispo=" . $row['id_dispo'] . "\" style=\"margin-right:10px; color:red;\" onClick=\"return confirm('Êtes-vous sûr de vouloir supprimer cette disponibilité ?');\"><i class=\"fa fa-trash-o m-r-5\"></i></a></td> ";
                                        echo "</tr>";
                                    } ?>



                                </tbody>

                            </table>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="sidebar-overlay" data-reff=""></div>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/js/app.js"></script>
</body>


<!-- disponibilite-->

</html>
<style>
    /* Table Styles */


    .fl-table {
        margin-top: -1px;
        border-radius: 10px;
        font-size: 15px;
        font-weight: normal;
        border: none;
        border-collapse: collapse;
        width: 100%;
        max-width: 100%;
        white-space: nowrap;
        background-color: white;

    }

    .fl-table td,
    .fl-table th {
        text-align: center;
        padding: 8px;
    }

    .fl-table td {
        border-right: 1px solid #f8f8f8;
        font-size: 15px;
    }

    .fl-table thead th {
        color: #ffffff;
        background: #1977cc;
    }


    .fl-table thead th:nth-child(odd) {
        color: #ffffff;
        background: #1977cc;
    }

    .fl-table tr:nth-child(even) {
        background: #F8F8F8;
    }
</style>