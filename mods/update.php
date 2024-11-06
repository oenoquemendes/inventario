<?php

error_reporting(0);
ini_set("display_errors", 0);

// Inicia sessão PHP
session_start();


// Incluir o arquivo de conexão com o banco de dados
include_once 'conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') { 
    // Capturar o tipo de registro
    $tipoRegistro = $_POST['tiporeg'];
    $tipoRegistro = strtolower($tipoRegistro);

    // Verificar se o ID está presente e não está vazio
    $isUpdate = isset($_POST['ID']) && !empty($_POST['ID']);
    $id = $isUpdate ? $_POST['ID'] : null;

    // Inicializar as variáveis para colunas, placeholders e valores
    $colunas = [];
    $placeholders = [];
    $valores = [];
    $setClause = [];

    // Se não for uma atualização (ou seja, é um insert), checar a duplicidade
    if (!$isUpdate) {
        // Verificar se PATRIMONIO, SERIE e SALA são válidos para a duplicidade
        if (!empty($_POST['PATRIMONIO']) && !empty($_POST['SERIE']) && $_POST['SALA'] == 15) {
            $checkDupSql = "SELECT COUNT(*) FROM $tipoRegistro WHERE PATRIMONIO = ? AND SERIE = ? AND SALA = 15";
            $stmtDupCheck = $PDO->prepare($checkDupSql);
            $stmtDupCheck->execute([$_POST['PATRIMONIO'], $_POST['SERIE']]);
            $duplicateExists = $stmtDupCheck->fetchColumn() > 0;

            if ($duplicateExists) {
                $_SESSION['msg'] = "Objeto já está cadastrado.";
                header("Location: ../view.php?v=$tipoRegistro");
                exit;
            }
        }
    }

    // Preparar a consulta de inserção ou atualização
    foreach ($_POST as $coluna => $valor) {
        if ($coluna !== 'tiporeg' && $coluna !== 'ID') {
            // Trata campos específicos, como DATA_ENTRADA e DATA_SAIDA
            if ($coluna === 'DATA_ENTRADA' || $coluna === 'DATA_SAIDA') {
                if (empty($valor)) {
                    $valores[] = null; // Define como NULL se o campo estiver vazio
                } else {
                    // Formata a data corretamente
                    $valores[] = date('Y-m-d H:i:s', strtotime($valor));
                }
            } else {
                $valores[] = $valor;
            }

            if ($isUpdate) {
                $setClause[] = "$coluna = ?";
            } else {
                $colunas[] = $coluna;
                $placeholders[] = '?';
            }
        }
    }

    // Se o ID existir, faça o UPDATE; caso contrário, faça o INSERT
    if ($isUpdate) {
        $sql = "UPDATE $tipoRegistro SET " . implode(', ', $setClause) . " WHERE ID = ?";
        $valores[] = $id; // Adicionar o ID ao final dos valores para o WHERE
    } else {
        $sql = "INSERT INTO $tipoRegistro (" . implode(',', $colunas) . ") VALUES (" . implode(',', $placeholders) . ")";
    }

    // Preparar e executar a consulta
    $stmt = $PDO->prepare($sql);
    try {
        $stmt->execute($valores);
        $_SESSION['msg'] = ($isUpdate) ? "Registro atualizado com sucesso!" : "Registro inserido com sucesso!";
        header("Location: ../view.php?v=$tipoRegistro"); // Redireciona para a página anterior
        exit;
    } catch (PDOException $e) {
        error_log($e->getMessage()); // Log do erro
        $_SESSION['msg'] = "Erro ao " . (($isUpdate) ? "atualizar" : "inserir") . " o registro: " . $e->getMessage();
        header("Location: ../view.php?v=$tipoRegistro"); // Redireciona para a página anterior
        exit;
    }
}



// Redirecionar
// header("Location: ../view.php?v=$tipoRegistro");
// exit;
