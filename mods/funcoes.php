<?php

error_reporting(0);
ini_set("display_errors", 0 );

function listaEquipEntrada($tabela) {
                                        // Conexão com o banco de dados
                                        include "conexao.php";

                                        // Converte nome da tabela para minúsculo
                                        $banco = strtolower($tabela);
                                        $campos_modal = '';
                                        $modal_saida = '';
                                        $lista_entrada = '';

                                        // Barra de pesquisa e botão para adicionar novo registro
                                        $lista_entrada .= '<div class="text-center">
                                                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#lista_input_modal">Adicionar ' . htmlspecialchars($tabela) . ' <i class="fas fa-plus-circle"></i></button>
                                                        </div>';
                                        $lista_entrada .= '<h2>Entrada de ' . htmlspecialchars($tabela) . ' <i class="fas fa-sign-in-alt"></i></h2>
                                                        <div class="row align-items-center">
                                                            <div class="col-5">
                                                                <input type="text" id="filterInput" class="form-control" placeholder="Filtrar por marca, modelo, etc." onkeyup="filterTable()">
                                                            </div>
                                                            <div class="col-5">
                                                                <div id="filteredCount">Total de registros filtrados: 0</div>
                                                            </div>
                                                        </div>
                                                        <p></p>
                                                        <table id="cpu-table" class="table table-striped table-bordered">';

                                        // Monta o cabeçalho da tabela
                                        $sql = "SELECT * FROM $banco WHERE QUANTIDADE >= '1' AND SALA IN ('15')";
                                        $sql_temp = $PDO->query($sql);
                                        $columns = [];
                                        $rows = [];  
                                        for ($i = 0; $i < $sql_temp->columnCount(); $i++) {
                                            $meta = $sql_temp->getColumnMeta($i);
                                            $columns[] = htmlspecialchars($meta['name']);
                                        }
                                        $lista_entrada .= renderTableHeader($columns);
                                        $lista_entrada .= '<tbody>';

                                        // Preenche a tabela com os dados
                                        while ($row = $sql_temp->fetch(PDO::FETCH_ASSOC)) {
                                            $lista_entrada .= renderTableRow($row);
                                            $rows[] = $row['ID']; // Armazena cada ID
                                        }

                                        $lista_entrada .= '</tbody></table>';
                                        $lista_entrada .= renderInputModal($campos_modal, $banco);
                                        $lista_entrada .= renderModals($modal_saida, $banco, $rows);
                                        
                                        $lista_entrada .= '<script>
                                            function filterTable() {
                                                const input = document.getElementById("filterInput");
                                                const filter = input.value.toLowerCase();
                                                const table = document.getElementById("cpu-table");
                                                const tr = table.getElementsByTagName("tr");
                                                let count = 0; // Contador de registros filtrados

                                                for (let i = 1; i < tr.length; i++) {
                                                    const td = tr[i].getElementsByTagName("td");
                                                    let rowContainsFilterText = false;

                                                    for (let j = 0; j < td.length; j++) {
                                                        if (td[j]) {
                                                            const txtValue = td[j].textContent || td[j].innerText;
                                                            if (txtValue.toLowerCase().indexOf(filter) > -1) {
                                                                rowContainsFilterText = true;
                                                                break; // Sai do loop se encontrou um texto correspondente
                                                            }
                                                        }
                                                    }

                                                    if (rowContainsFilterText) {
                                                        tr[i].style.display = ""; // Exibe a linha
                                                        count++; // Incrementa o contador
                                                    } else {
                                                        tr[i].style.display = "none"; // Oculta a linha
                                                    }
                                                }

                                                // Atualiza o contador na interface
                                                document.getElementById("filteredCount").textContent = "Total de registros filtrados: " + count;
                                            }
                                        </script>';

                                        echo $lista_entrada;
                                    }

// Função para renderizar o cabeçalho da tabela
function renderTableHeader($columns) {
                                        $headerHtml = '<thead><tr>';
                                        foreach ($columns as $coluna) {
                                            $headerHtml .= '<th>' . htmlspecialchars($coluna) . '</th>';
                                        }
                                        $headerHtml .= '<th>Ações</th></tr></thead>';
                                        return $headerHtml;
                                    }

// Função para renderizar uma linha da tabela
function renderTableRow($row) {
                                    $rowHtml = '<tr>';
                                    foreach ($row as $coluna => $valor) {
                                        if ($coluna === 'DATA_ENTRADA' || $coluna === 'DATA_SAIDA') {
                                            $valor = $valor ? date('d/m/Y H:i:s', strtotime($valor)) : '';
                                        }
                                        $rowHtml .= '<td>' . htmlspecialchars($valor) . '</td>';
                                    }
                                    $rowHtml .= '<td>
                                                    <button class="btn btn-primary btn-editar" data-toggle="modal" data-target="#lista_entrada_' . htmlspecialchars($row['ID']) . '">Editar</button>
                                                    <button class="btn btn-success btn-saida" data-toggle="modal" data-target="#lista_saida_modal_' . htmlspecialchars($row['ID']) . '">Saída</button>
                                                </td>';
                                    $rowHtml .= '</tr>';
                                    return $rowHtml;
                                }


// Função para renderizar o modal de entrada
function renderInputModal($campos_modal, $banco) {
                                                    return '<!-- Modal Input-->
                                                            <div class="modal fade" id="lista_input_modal" tabindex="-1" role="dialog" aria-labelledby="editarModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-lg" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="editarModalLabel"><b>INCLUINDO NOVO ' . htmlspecialchars($banco) . '</b></h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form action="mods/update.php" method="POST">
                                                                                ' . $campos_modal . '
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                                        </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>';
                                                }

// Função para renderizar os modais de saída e edição
// Função para renderizar os modais de saída e edição
function renderModals($modal_saida, $banco, $rows) {
    $modalsHtml = '';

    foreach ($rows as $row) {
        $id = $row['ID']; // Supondo que cada $row tenha um campo 'ID'
        $modalsHtml .= '<!-- Modal de Edição para o item ID ' . htmlspecialchars($id) . ' -->
                        <div class="modal fade" id="lista_entrada_' . htmlspecialchars($row) . '" tabindex="-1" role="dialog" aria-labelledby="editarModalLabel_' . htmlspecialchars($id) . '" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editarModalLabel_' . htmlspecialchars($id) . '">Editar Item ID ' . htmlspecialchars($id) . '</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="mods/update.php" method="POST">
                                            <input type="hidden" name="tiporeg" value="' . htmlspecialchars($banco) . '">
                                            ' . FormEdit($banco, $row) . '
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Salvar</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                    </div>
                                     </form>
                                </div>
                            </div>
                        </div>';
    }

    return $modalsHtml;
}

// Função para gerar os campos do formulário de edição
function FormEdit($banco, $row) {
    include "conexao.php";

    // Obter os nomes das colunas e os valores dos registros
    $sql = "SELECT * FROM $banco WHERE $banco.ID = $row";
    $sql_temp = $PDO->query($sql);

    // Adicionar os valores de cada registro
    while ($row = $sql_temp->fetch(PDO::FETCH_ASSOC)) {

        
        foreach ($row as $coluna => $valor) {
                       
            // Definir atributos de entrada baseados na coluna
            if($coluna === 'ID'){
                $readonlyTag = 'readonly';
            }else{
                $readonlyTag = '';
            }

            if(($coluna === 'DATA_ENTRADA' || $coluna === 'DATA_SAIDA' || $coluna === 'OBS')){

                $readonlyTag = '';

            }else{
                $readonlyTag = 'required';
            }

            if(($coluna === 'QUANTIDADE' || $coluna === 'SALA') ){

                $tipoinput = 'number';

            }else{
                $tipoinput = 'text';
            }

            //$readonlyTag = ($coluna === 'ID') ? 'readonly' : 'required';
            //$tipoRequired = ($coluna === 'DATA_ENTRADA' || $coluna === 'DATA_SAIDA') ? '' : '';
            //$tipoinput = ($coluna === 'QUANTIDADE' || $coluna === 'SALA') ? 'number' : 'text';

            // Construir o formulário
            $formulario_html .= '<div class="form-group">
                                    <label for="input_' . htmlspecialchars($coluna) . '">' . htmlspecialchars($coluna) . '</label>
                                    <input type="' . $tipoinput . '" class="form-control" id="input_' . htmlspecialchars($coluna) . '" name="' . htmlspecialchars($coluna) . '" value="' . htmlspecialchars($valor) . '" ' . $readonlyTag . ' >
                                 </div>';
        }

    }


    // Exibir a tabela e o formulário
    return $formulario_html;
}






/*


if($var=='lista_saida'){
    
    $banco2 = strtolower($tipo);

    $lista_saida = '<h2>Saída <i class="fas fa-sign-in-alt"></i></h2>
                <div class="col-5">
                    <input type="text" id="filterInput-saida" class="form-control" placeholder="Filtrar por marca, modelo, etc." onkeyup="filterTable()">
                </div>
                <table id="cpu-table-saida" class="table table-striped table-bordered"> 
                    <thead>
                        <tr>';

// Obter os nomes das colunas
$sql = "SELECT * FROM $banco2 WHERE SALA NOT IN('15')";
$sql_temp = $PDO->query($sql);

// Adicionar os cabeçalhos da tabela
for ($i = 0; $i < $sql_temp->columnCount(); $i++) {
    $meta = $sql_temp->getColumnMeta($i);
    $lista_saida .= '<th>' . htmlspecialchars($meta['name']) . '</th>';
}

// Adicionar a coluna de ações
$lista_saida .= '<th>DATA</th>';
$lista_saida .= '</tr></thead><tbody>';

// Preencher a tabela com os dados
while ($row = $sql_temp->fetch(PDO::FETCH_ASSOC)) {
    $lista_saida .= '<tr>';
    foreach ($row as $coluna => $valor) {
        $lista_saida .= '<td>' . htmlspecialchars($valor) . '</td>';
    }
    $lista_saida .= '<td>
                       - 
                    </td>';
    $lista_saida .= '</tr>';
}

$lista_saida .= '</tbody></table>';


  $lista_saida .= '<script>
function filterTable() {
    const input = document.getElementById("filterInput-saida");
    const filter = input.value.toLowerCase();
    const table = document.getElementById("cpu-table-saida");
    const tr = table.getElementsByTagName("tr");

    for (let i = 1; i < tr.length; i++) {
        const td = tr[i].getElementsByTagName("td");
        let rowContainsFilterText = false;

        for (let j = 0; j < td.length; j++) {
            if (td[j]) {
                const txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toLowerCase().indexOf(filter) > -1) {
                    rowContainsFilterText = true;
                    break; // Se já encontrou um texto correspondente, pode sair do loop
                }
            }
        }

        tr[i].style.display = rowContainsFilterText ? "" : "none"; // Exibe ou oculta a linha
    }
}
</script>';

    echo $lista_saida;

  }

*/

?>