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

    // Verificar se o ID está presente e não está vazio
    $isUpdate = isset($_POST['ID']) && !empty($_POST['ID']);
    $id = $isUpdate ? $_POST['ID'] : null;

    // Verificar se o ID existe no banco de dados para o tipo de registro fornecido
    if ($isUpdate) {
        $checkSql = "SELECT COUNT(*) FROM $tipoRegistro WHERE ID = ?";
        $stmtCheck = $PDO->prepare($checkSql);
        $stmtCheck->execute([$id]);
        $exists = $stmtCheck->fetchColumn() > 0;
    }

    // Inicializar as variáveis para colunas, placeholders e valores
    $colunas = [];
    $placeholders = [];
    $valores = [];
    $setClause = [];

    // Preparar a consulta
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

            if ($isUpdate && $exists) {
                $setClause[] = "$coluna = ?";
            } else {
                $colunas[] = $coluna;
                $placeholders[] = '?';
            }
        }
    }

    // Se o ID existir, faça o UPDATE; caso contrário, faça o INSERT
    if ($isUpdate && $exists) {
        $valores[] = $id; // Adicionar o ID ao final dos valores para o WHERE
        $sql = "UPDATE $tipoRegistro SET " . implode(', ', $setClause) . " WHERE ID = ?";
    } else {
        $sql = "INSERT INTO $tipoRegistro (" . implode(',', $colunas) . ") VALUES (" . implode(',', $placeholders) . ")";
    }

    // Preparar e executar a consulta
    $stmt = $PDO->prepare($sql);
    try {
        $stmt->execute($valores);
        $_SESSION['msg'] = ($isUpdate && $exists) ? "Registro atualizado com sucesso!" : "Registro inserido com sucesso!";
        header("Location: ../view.php?v=$tipoRegistro"); // Redireciona para a página anterior
        exit;
    } catch (PDOException $e) {
        error_log($e->getMessage()); // Log do erro
        $_SESSION['msg'] = "Erro ao " . (($isUpdate && $exists) ? "atualizar" : "inserir") . " o registro: " . $e->getMessage();
        header("Location: ../view.php?v=$tipoRegistro"); // Redireciona para a página anterior
        exit;
    }
    
}

// Redirecionar
// header("Location: ../view.php?v=$tipoRegistro");
// exit;
