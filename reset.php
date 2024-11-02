<?php

error_reporting(0);
ini_set("display_errors", 0 );

require "mods/conexao.php"; // Certifique-se de que este arquivo estabelece a conexão PDO corretamente

try {
    // Desabilita as verificações de chaves estrangeiras
    $PDO->exec("SET FOREIGN_KEY_CHECKS = 0");

    // Comando para truncar as tabelas
    $PDO->exec("TRUNCATE TABLE componentes"); 
    $PDO->exec("TRUNCATE TABLE componentes_saida"); 
    $PDO->exec("TRUNCATE TABLE cpu"); 
    $PDO->exec("TRUNCATE TABLE cpu_saida");
    $PDO->exec("TRUNCATE TABLE diversos"); 
    //$PDO->exec("TRUNCATE TABLE diversos_saida"); 
    $PDO->exec("TRUNCATE TABLE impressora"); 
    $PDO->exec("TRUNCATE TABLE impressora_saida"); 
    $PDO->exec("TRUNCATE TABLE monitor"); 
    $PDO->exec("TRUNCATE TABLE monitor_saida");  
    $PDO->exec("TRUNCATE TABLE mouse"); 
    $PDO->exec("TRUNCATE TABLE mouse_saida"); 
    $PDO->exec("TRUNCATE TABLE notebook"); 
    $PDO->exec("TRUNCATE TABLE notebook_saida"); 
    $PDO->exec("TRUNCATE TABLE tablet"); 
    //$PDO->exec("TRUNCATE TABLE tablet_saida"); 
    $PDO->exec("TRUNCATE TABLE teclado"); 
    $PDO->exec("TRUNCATE TABLE teclado_saida"); 

    // Reabilita as verificações de chaves estrangeiras
    $PDO->exec("SET FOREIGN_KEY_CHECKS = 1");

    echo "Tabela 'componentes' truncada com sucesso!";
} catch (PDOException $e) {
    echo "Erro ao truncar a tabela: " . $e->getMessage();
}

?>
