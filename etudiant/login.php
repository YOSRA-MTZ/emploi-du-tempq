<?php
session_start();
// Include the database configuration file
require_once 'config.php';

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the submitted username/email and password
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Fetch the admin credentials from the database
    $query = "SELECT * FROM etudiant WHERE nom_etudiant = ? OR email_etudiant = ? LIMIT 1";
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param('ss', $email, $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $etudiant = $result->fetch_assoc();
    //$id_admin = "SELECT identifiant FROM admin WHERE identifiant = ? OR email_admin = ? LIMIT 1";
    // Validate the credentials
    if ($etudiant && ($password == $etudiant['mdp_etudiant'])) {
        // Authentication successful
        // Redirect the admin to the desired page or perform any other action
        $_SESSION['etudiant'] = $etudiant['nom_etudiant'];       
         header('Location: etudiant.php');
        exit;
    } else {
        // Authentication failed
        $error = 'Invalid username/email or password';
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="assets/img/icons/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="assets/css/util.css">
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">
    <style>
        body {
            background-color: #666666;
        }
    </style>
</head>

<body>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <form class="login100-form validate-form"  method="post" enctype="multipart/form-data" action="#">
               
                    <span class="login100-form-title p-b-43">
                        Bonjour Etudiant
                    </span>
                    <?php if (isset($error)) { ?>
                            <div class="alert alert-danger" role="alert" style="color:red"><?php echo $error; ?></div>
                        <?php } ?>
                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="email" name="email" placeholder="Email" required>
                    </div>

                    <div class="wrap-input100 validate-input" >
                        <input class="input100" type="password" name="password" placeholder="Password" required>
                    </div>

                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn">
                            Login
                        </button>
                    </div>
                </form>


                <div class="login100-more" style="background-image: url('assets/img/bg-012.png');">
                </div>
            </div>
        </div>
    </div>

    <script src="assets/js/main.js"></script>

</body>

</html>
