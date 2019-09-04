<?php
    header("Content-Type: application/json");
    $sIP = $_SERVER['REMOTE_ADDR'];
    echo json_encode($sIP);
    exit();
