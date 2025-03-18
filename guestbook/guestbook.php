<?php

//Input data
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = htmlspecialchars($_POST)["name"];
    $site = htmlspecialchars($_POST)["site"];
    $message = htmlspecialchars($_POST)["message"];

    //Spara data i fil
    $file = fopen("guestbook.txt", "a");
    fwrite($file, "Name: $name\nWebsite: $site\nMessage: $message\n\n");
    fclose($file);

    //Skicka tillbaks till gästbokssidan
    header("Location: guestbook.html");
    exit();

}

?>