<?php

error_reporting(0);
ini_set("display_errors", 0 );

function listaEquipCategoria($tipo,$var){
  
  include "conexao.php";

  if($var=='menu'){
    echo $tipo;
  }

  if ($var == 'lista_entrada') {

    $banco = strtolower($tipo);

    
    $lista_entrada = '<div class="text-center">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#lista_input_modal">Adicionar ' . htmlspecialchars($tipo) . ' <i class="fas fa-plus-circle"></i></button>
                    </div>';

    $lista_entrada .= '<h2>Entrada de ' . htmlspecialchars($tipo) . ' <i class="fas fa-sign-in-alt"></i></h2> 
                      <div class="col-5">
                          <input type="text" id="filterInput" class="form-control" placeholder="Filtrar por marca, modelo, etc." onkeyup="filterTable1()">
                      </div>
                      <table id="cpu-table" class="table table-striped table-bordered"> 
                          <thead>
                              <tr>';

    // Obter os nomes das colunas
    $sql = "SELECT * FROM $banco WHERE $banco.QUANTIDADE>='1'";
    $sql_temp = $PDO->query($sql);

    // Adicionar os cabeçalhos da tabela
    for ($i = 0; $i < $sql_temp->columnCount(); $i++) {
        $meta = $sql_temp->getColumnMeta($i);
        $lista_entrada .= '<th>' . htmlspecialchars($meta['name']) . '</th>';

        if(htmlspecialchars($meta['name'])=='ID'){
            $readonlyTag = 'readonly';
        }else{
            $readonlyTag = 'required';
        }

        if((htmlspecialchars($meta['name'])=='QUANTIDADE')||((htmlspecialchars($meta['name'])=='SALA'))){
            $tipoinput = 'number';
        }else{
            $tipoinput = 'text';
        }
        $campos_modal .= '<div class="form-group">
                            <input type="hidden" name="tiporeg" value="'.$banco.'"  id="'.$banco.'">
                                <label for="inputID">' . htmlspecialchars($meta['name']) . '</label>
                                <input type="'.$tipoinput.'" class="form-control" id="inputID" name="' . htmlspecialchars($meta['name']) . '" value=" " '.$readonlyTag.'>
                         </div>';
    }

// Adicionar a coluna de ações
$lista_entrada .= '<th>Ações</th>';
$lista_entrada .= '</tr></thead><tbody>';

// Preencher a tabela com os dados
while ($row = $sql_temp->fetch(PDO::FETCH_ASSOC)) {
    $lista_entrada .= '<tr>';
    foreach ($row as $coluna => $valor) {
        
        $lista_entrada .= '<td>' . htmlspecialchars($valor) . '</td>';
    }

    // Criar modal para edição de cada item
    $lista_entrada_modal .= '<!-- Modal Lista de Entrada-->
        <div class="modal fade" id="lista_entrada_' . htmlspecialchars($banco) . '_' . htmlspecialchars($row['ID']) . '" tabindex="-1" role="dialog" aria-labelledby="editarModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarModalLabel"><b>Editar Item ' . htmlspecialchars($row['PATRIMONIO']) . ', ' . htmlspecialchars($row['MARCA']) . ' - ' . htmlspecialchars($row['MODELO']) . '</b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Conteúdo do formulário de edição -->
                        <form action="mods/update.php" method="POST">';

    // Construir os campos de entrada no modal com valores específicos
    foreach ($row as $coluna => $valor) {
        if(htmlspecialchars($coluna)=='ID'){
            $readonlyTagEdit = 'readonly';
        }else{
            $readonlyTagEdit = 'required';
        }

        if((htmlspecialchars($coluna)=='QUANTIDADE')||((htmlspecialchars($coluna)=='SALA'))){
            $tipoinput = 'number';
        }else{
            $tipoinput = 'text';
        }
        
        if(htmlspecialchars($coluna)=='OBS'){
            $lista_entrada_modal .= '<div class="form-group">
                                    <label for="input_' . htmlspecialchars($coluna) . '">' . htmlspecialchars($coluna) . '</label>
                                    <textarea class="form-control" id="input_' . htmlspecialchars($coluna) . '" name="' . htmlspecialchars($coluna) . '" '.$readonlyTagEdit.'>' . htmlspecialchars($valor) . '</textarea>
                                </div>';
        }else{
           
        $lista_entrada_modal .= '<div class="form-group">
                                    <label for="input_' . htmlspecialchars($coluna) . '">' . htmlspecialchars($coluna) . '</label>
                                    <input type="'.$tipoinput.'" class="form-control" id="input_' . htmlspecialchars($coluna) . '" name="' . htmlspecialchars($coluna) . '" value="' . htmlspecialchars($valor) . '" '.$readonlyTagEdit.'>
                                </div>';
        }
    }

    $lista_entrada_modal .= '       
                        
                    </div>
                    <div class="modal-footer">
                    <input type="hidden" name="tiporeg" value="'.$banco.'"  id="'.$banco.'">
                        <button type="submit" class="btn btn-primary">Salvar alterações</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>';


        $lista_entrada .= '<td>
                              <button class="btn btn-primary btn-editar" data-toggle="modal" data-target="#lista_entrada_' . htmlspecialchars($banco) . '_' . htmlspecialchars($row['ID']) . '">
                                  <span class="glyphicon glyphicon-pencil"></span> Editar
                              </button>&nbsp;
                              <button class="btn btn-success btn-saida">
                                  <span class="glyphicon glyphicon-export"></span> Saída
                              </button>
                          </td>';
        $lista_entrada .= '</tr>';
    }

    $lista_entrada .= '</tbody></table>';

    $lista_input_modal .= '<!-- Modal Input-->
                            <div class="modal fade" id="lista_input_modal" tabindex="-1" role="dialog" aria-labelledby="editarModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editarModalLabel"><b>INCLUINDO NOVO ' . htmlspecialchars($tipo) . '</b></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Conteúdo do formulário de edição -->
                                            <form action="mods/update.php" method="POST">
                                                '.$campos_modal.'    
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                        </div>
                                         </form>
                                    </div>
                                </div>
                            </div>';

    $lista_entrada .= '<script>
                            function filterTable1() {
                                const input = document.getElementById("filterInput");
                                const filter = input.value.toLowerCase();
                                const table = document.getElementById("cpu-table");
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



    echo $lista_entrada;
    echo $lista_entrada_modal;
    echo $lista_input_modal;
}

  if($var=='lista_saida'){
    
    $banco2 = strtolower($tipo).'_saida';

    $lista_saida = '<h2>Saída <i class="fas fa-sign-in-alt"></i></h2>
                <div class="col-5">
                    <input type="text" id="filterInput-saida" class="form-control" placeholder="Filtrar por marca, modelo, etc." onkeyup="filterTable()">
                </div>
                <table id="cpu-table-saida" class="table table-striped table-bordered"> 
                    <thead>
                        <tr>';

// Obter os nomes das colunas
$sql = "SELECT * FROM $banco2";
$sql_temp = $PDO->query($sql);

// Adicionar os cabeçalhos da tabela
for ($i = 0; $i < $sql_temp->columnCount(); $i++) {
    $meta = $sql_temp->getColumnMeta($i);
    $lista_saida .= '<th>' . htmlspecialchars($meta['name']) . '</th>';
}

// Adicionar a coluna de ações
$lista_saida .= '<th>Ações</th>';
$lista_saida .= '</tr></thead><tbody>';

// Preencher a tabela com os dados
while ($row = $sql_temp->fetch(PDO::FETCH_ASSOC)) {
    $lista_saida .= '<tr>';
    foreach ($row as $coluna => $valor) {
        $lista_saida .= '<td>' . htmlspecialchars($valor) . '</td>';
    }
    $lista_saida .= '<td>
                      <button class="btn btn-primary btn-editar">
                          <span class="glyphicon glyphicon-pencil"></span> Editar
                      </button>&nbsp;
                      <button class="btn btn-success btn-saida">
                          <span class="glyphicon glyphicon-export"></span> Saída
                      </button>
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


}

?>