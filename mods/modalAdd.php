<?php

error_reporting(0);
ini_set("display_errors", 0 );


include "conexao.php";

function botaoIncluirModal($tabela){
    global $PDO;  // Garantir que a variável de conexão esteja acessível

    // Converte o nome da tabela para minúsculo
    $banco = strtolower($tabela);

    // Inicializar a variável de HTML para o botão
    $htmlForm = '';

    // Gerar o botão para abrir o modal (Este botão sempre será exibido)
    $htmlForm .= '<div class="text-center">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#incluirModal">Adicionar ' . htmlspecialchars($tabela) . ' <i class="fas fa-plus-circle"></i></button>
                  </div>';

    // Consultar a tabela para pegar os nomes das colunas
    try {
        $sql = "SELECT * FROM $banco LIMIT 1";  // Pega uma linha apenas para obter as colunas
        $sql_temp = $PDO->query($sql);

        // Verificar se a consulta retornou resultados
        if ($sql_temp) {
            // Obter os nomes das colunas usando getColumnMeta()
            $colunas = [];
            for ($i = 0; $i < $sql_temp->columnCount(); $i++) {
                $meta = $sql_temp->getColumnMeta($i);
                $colunas[] = $meta['name'];  // Adiciona o nome da coluna
            }

            // Adicionar a estrutura do modal (ficará oculto até o botão ser clicado)
            $htmlForm .= '<div class="modal fade" id="incluirModal" tabindex="-1" role="dialog" aria-labelledby="incluirModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="incluirModalLabel">Incluir Novo Registro em ' . htmlspecialchars($tabela) . '</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form_incluir" action="mods/update.php" method="POST">
                                        <input type="hidden" name="tiporeg" value="' . htmlspecialchars($tabela) . '">';

            // Construir o formulário com base nas colunas
            foreach ($colunas as $coluna) {
                // Inicializar as variáveis de atributos
                $readonlyTag = '';
                $requiredTag = '';
                $valor = '';  // Valor padrão
                
                // Definir a lógica para o campo 'ID' e 'SALA'
                if ($coluna === 'ID') {
                    $readonlyTag = 'readonly';
                }
            
                if ($coluna === 'SALA') {
                    $valor = '15';  // Atribui o valor 15 para o campo SALA
                    $readonlyTag = 'readonly';  // Deixa o campo SALA como somente leitura
                }
            
                // Definir os campos obrigatórios
                if ($coluna === 'MARCA' || $coluna === 'MODELO' || $coluna === 'DATA_ENTRADA' || $coluna === 'QUANTIDADE') {
                    $requiredTag = 'required';
                }
            
                // Definir o tipo de input
                if ($coluna === 'QUANTIDADE' || $coluna === 'SALA') {
                    $tipoinput = 'number';
                } else {
                    $tipoinput = 'text';
                }
            
                // Gerar o campo do formulário
                $htmlForm .= '<div class="form-group">
                                <label for="input_' . htmlspecialchars($coluna) . '">' . ucfirst(htmlspecialchars($coluna)) . '</label>
                                <input type="' . $tipoinput . '" class="form-control" id="input_' . htmlspecialchars($coluna) . '" value="' . htmlspecialchars($valor) . '" name="' . htmlspecialchars($coluna) . '" ' . $readonlyTag . ' ' . $requiredTag . '>
                              </div>';
            }
            

            // Fechar o formulário e o modal
            $htmlForm .= '  <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary">Salvar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>';
        } else {
            // Caso a consulta falhe, exibe uma mensagem de erro
            $htmlForm .= '<div class="alert alert-danger">Erro ao acessar a tabela: ' . htmlspecialchars($banco) . '</div>';
        }
    } catch (PDOException $e) {
        // Se ocorrer um erro com a consulta, capturar a exceção e exibir uma mensagem
        $htmlForm .= '<div class="alert alert-danger">Erro ao executar a consulta: ' . $e->getMessage() . '</div>';
    }

    // Retornar o HTML gerado
    return $htmlForm;
}



?>