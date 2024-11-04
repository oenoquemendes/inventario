<?php

error_reporting(0);
ini_set("display_errors", 0);

// Inicia sessão PHP
session_start();

require "mods/menu.php";
require "mods/funcoes.php";

if ($_GET['v']) {
    $tabela = $_GET['v'];
} else {
    $tabela = $_POST['tipo'];
}

?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/style.css">
    <title>Gestão de Entrada e Saída</title>

    <!-- Adicione os arquivos CSS do Bootstrap e DataTables -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
    
    <!-- Icones Awesome -->
    <script src="https://use.fontawesome.com/releases/v5.14.0/js/all.js" data-auto-replace-svg="nest"></script>

    <!-- Adicione os arquivos JS do jQuery, Bootstrap e DataTables -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

    <style>
        .alert {
            transition: opacity 0.5s ease; /* Suaviza a transição da opacidade */
            opacity: 1; /* Começa visível */
            margin: 15px 0; /* Espaçamento */
        }
        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .alert-error {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
    </style>

</head>
<body>
<div class="menu-title">
        <h1><span>Gestão de Inventário de TI</span></h1>
</div>

<!-- Botão "Voltar" -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="index.php">Home Page</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <?php listaMenu('menu_horizontal'); ?>
            </ul>
        </div>
    </div>
</nav>

<?php
// Mostra mensagem
if (isset($_SESSION['msg'])) {
    $class = strpos($_SESSION['msg'], 'Erro') !== false ? 'alert-error' : 'alert-success';
    echo "<div class='alert $class'>{$_SESSION['msg']}</div>"; 
   
}

// Função para exibir os dados da tabela "cpu"
listaEquipEntrada($tabela); 
// Função para exibir os dados da tabela "saida_cpu"
listaEquipCategoria($categoria,'lista_saida');

?>

<script>
    // O código JavaScript para esconder a div após 5 segundos
    document.addEventListener('DOMContentLoaded', function() {
        const alertBox = document.querySelector('.alert');
        if (alertBox) {
            setTimeout(function() {
                alertBox.style.opacity = '0'; // Transição suave para invisível
                setTimeout(function() {
                    alertBox.style.display = 'none'; // Esconde a div após a animação
                }, 500); // Espera a duração da animação
            }, 5000); // 5 segundos
        }
    });
</script>
</body>
</html>
