<?php
// Incluir o arquivo de conexão com o banco de dados, se necessário
include_once 'conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Capturar o tipo de registro
    $tipoRegistro = $_POST['tiporeg'];

    // Preparar os dados para a consulta de inserção
    $colunas = [];
    $valores = [];
    $placeholders = [];

    foreach ($_POST as $coluna => $valor) {
        if ($coluna !== 'tiporeg') { // Ignorar o campo 'tiporeg'
            $colunas[] = $coluna;
            $valores[] = $valor;
            $placeholders[] = '?';
        }
    }

    // Criar a consulta SQL de inserção
    $sql = "INSERT INTO $tipoRegistro (" . implode(',', $colunas) . ") VALUES (" . implode(',', $placeholders) . ")";
    $stmt = $PDO->prepare($sql);

    // Executar a consulta com os valores
    try {
        $stmt->execute($valores);
        echo "Registro inserido com sucesso!";
        // Redirecionar de volta ou exibir uma mensagem de sucesso
        //header("Location: pagina_principal.php");
        exit;
    } catch (PDOException $e) {
        echo "Erro ao inserir o registro: " . $e->getMessage();
    }
}
?>
