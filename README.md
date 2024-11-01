# Sistema de Gerenciamento de Entradas e Edição de Itens

Este projeto é um sistema web para gerenciar entradas e edição de itens em uma base de dados. Ele utiliza modais Bootstrap para exibir formulários de edição e adição, e o PHP para salvar e gerenciar os dados no banco de dados.

## Estrutura do Projeto

O projeto é composto pelas seguintes partes:

- **index.php**: Página principal que exibe a tabela de itens, com botões para adicionar e editar registros.
- **mods/new.php**: Arquivo de destino para salvar novos registros no banco de dados.
- **conexao.php**: Arquivo de conexão ao banco de dados, utilizado para gerenciar a conexão com o PDO.

## Funcionalidades

- **Adicionar Novo Registro**: Um botão abre um modal com um formulário para adicionar um novo registro. O formulário é enviado via `POST` para o arquivo `mods/new.php`.
- **Editar Registro**: Cada item possui um botão de edição que abre um modal pré-preenchido com os dados do item, permitindo que sejam atualizados.

## Código de Exemplo

### `index.php`

Aqui está uma amostra de código para exibir a tabela de registros e o modal para adicionar novos itens:

```php
<?php
// Criação do botão para abrir o modal de adição
$lista_entrada = '<div class="text-center">
    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#lista_input_modal">Adicionar Item <i class="fas fa-plus-circle"></i></button>
</div>';

// Montagem do formulário dinâmico para adicionar novo item
$lista_input_modal = '
<div class="modal fade" id="lista_input_modal" tabindex="-1" role="dialog" aria-labelledby="editarModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editarModalLabel"><b>INCLUINDO NOVO ITEM</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="mods/new.php" method="POST">
                    '.$campos_modal.'
                    <input type="hidden" name="tiporeg" value="'.$banco.'">
                    <button type="submit" class="btn btn-primary">Cadastrar</button>
                </form>
            </div>
        </div>
    </div>
</div>';
?>
```
## mods/new.php

Este arquivo salva os dados no banco de dados:

```php

<?php
include_once 'conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $tipoRegistro = $_POST['tiporeg'];
    $colunas = [];
    $valores = [];
    $placeholders = [];

    foreach ($_POST as $coluna => $valor) {
        if ($coluna !== 'tiporeg') {
            $colunas[] = $coluna;
            $valores[] = $valor;
            $placeholders[] = '?';
        }
    }

    $sql = "INSERT INTO $tipoRegistro (" . implode(',', $colunas) . ") VALUES (" . implode(',', $placeholders) . ")";
    $stmt = $PDO->prepare($sql);

    try {
        $stmt->execute($valores);
        header("Location: pagina_principal.php");
        exit;
    } catch (PDOException $e) {
        echo "Erro ao inserir o registro: " . $e->getMessage();
    }
}
?>
```
## Requisitos

- PHP 7 ou superior
- Banco de dados compatível com PDO
- Bootstrap 4 ou 5 (para modais e responsividade)

```php
