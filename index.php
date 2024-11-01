<?php

require "mods/menu.php";

?>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
    <title>Inventário</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="menu-title">
        <!-- <img src="imagens/inventario.png" alt="Imagem Inventario"> -->
        <h1><span>Gestão de Inventário de TI</span></h1>
    </div>
    <div class="menu">
        <div class="menu-column">
        <?php listaMenu('home');?>
        
    </div>

<!-- Botão "Gestão" -->
<!-- <div class="text-center">
    <img src="imagens/estoque.png" class="imagem" onclick="window.location.href='gestao.php'" alt="Imagem Estoque">
</div>
-->

<script>
    function submitForm(categoria) {
        document.getElementById('form-' + categoria).submit();
    }
</script>
</body>
</html>
