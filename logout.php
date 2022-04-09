<?php

    session_start();
    $SESSION = [];
    session_unset();
    session_destroy();
    $past = time() - 3600;
    foreach ( $_COOKIE as $key => $value )
    {
        setcookie( $key, $value, $past, '/' );
    }
    header("Location: Login.php");

?>