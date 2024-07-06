<?php
$host = 'db';
$port = '5432';
$dbname = 'exampledb';
$user = 'postgres';
$password = 'example';

$dsn = "pgsql:host=$host;port=$port;dbname=$dbname;";
$options = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);

try {
    $conn = new PDO($dsn, $user, $password, $options);
    echo "Conexão com PostgreSQL estabelecida com sucesso.";
} catch (PDOException $e) {
    echo "Erro de conexão: " . $e->getMessage();
}
?>
