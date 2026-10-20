<?php
declare(strict_types=1);
const DB_HOST='127.0.0.1';
const DB_NAME='sound_group';
const DB_USER='root';
const DB_PASS='';
const APP_MAX_UPLOAD=104857600;
function db(): PDO {
 static $pdo=null; if($pdo instanceof PDO)return $pdo;
 try {$pdo=new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=utf8mb4',DB_USER,DB_PASS,[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,PDO::ATTR_EMULATE_PREPARES=>false]);return $pdo;}
 catch(Throwable $e){http_response_code(500);echo '<!doctype html><meta charset="utf-8"><link rel="stylesheet" href="assets/style.css"><main class="shell" style="padding-top:60px"><div class="content-card"><div class="eyebrow">SETUP REQUIRED</div><h1>Let’s set up SOUND.</h1><p>Start Apache and MySQL in XAMPP, then open <code>setup.php</code> in your browser. Default database settings are in <code>config.php</code>.</p><a class="btn" href="setup.php">Run setup ↗</a></div></main>';exit;}
}
