<?php

error_reporting(0);
ini_set("display_errors", 0 );

// Incluir o arquivo de conexão com o banco de dados, se necessário
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

    // Se o ID existir, faça o UPDATE; caso contrário, faça o INSERT
    if ($isUpdate && $exists) {
        // Preparar a consulta de atualização
        $setClause = [];
        $valores = [];
        foreach ($_POST as $coluna => $valor) {
            if ($coluna !== 'tiporeg' && $coluna !== 'ID') {
                $setClause[] = "$coluna = ?";
                $valores[] = $valor;
            }
        }
        $valores[] = $id; // Adicionar o ID ao final dos valores para o WHERE
        $sql = "UPDATE $tipoRegistro SET " . implode(', ', $setClause) . " WHERE ID = ?";
    } else {
        // Preparar a consulta de inserção
        $colunas = [];
        $placeholders = [];
        $valores = [];
        foreach ($_POST as $coluna => $valor) {
            if ($coluna !== 'tiporeg' && $coluna !== 'ID') {
                $colunas[] = $coluna;
                $placeholders[] = '?';
                $valores[] = $valor;
            }
        }
        $sql = "INSERT INTO $tipoRegistro (" . implode(',', $colunas) . ") VALUES (" . implode(',', $placeholders) . ")";
    }

    // Preparar e executar a consulta
    $stmt = $PDO->prepare($sql);
    try {
        $stmt->execute($valores);
        echo ($isUpdate && $exists) ? "Registro atualizado com sucesso!" : "Registro inserido com sucesso!";
    } catch (PDOException $e) {
        echo "Erro ao " . (($isUpdate && $exists) ? "atualizar" : "inserir") . " o registro: " . $e->getMessage();
    }

    // Redirecionar 
    header("Location: ../view.php?v=$tipoRegistro");
    exit;
}
?>
