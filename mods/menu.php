<?php

error_reporting(0);
ini_set("display_errors", 0 );

function listaMenu($var){

   include "conexao.php";

   if($var=='home'){

    $c = 1;

    $sql = "SELECT botao_src, nomecategoria FROM categorias";
    $sql_temp = $PDO->query( $sql );
    while($temp = $sql_temp->fetch(PDO::FETCH_ASSOC)){
          $botao_src        = $temp["botao_src"];
          $nomecategoria    = $temp["nomecategoria"];

          if($c==2){

            $lista_categoria .= '<div class="menu-item">
                                    <form action="view.php" method="POST" id="form-'.$nomecategoria.'">
                                        <img src="imagens/'.$botao_src.'" alt="Imagem '.$nomecategoria.'" style="cursor: pointer;" onclick="submitForm(\''.$nomecategoria.'\')">
                                        <span>
                                            <input type="hidden" name="tipo" value="'.$nomecategoria.'">
                                            <input type="submit" value="'.$nomecategoria.'" class="btn btn-light btn-sm">
                                        </span>
                                    </form>
                                </div>
                                </div>
                                <div class="menu-column">';

                                $c = 0;

          }else{
            $lista_categoria .= '<div class="menu-item">
                                    <form action="view.php" method="POST" id="form-'.$nomecategoria.'">
                                        <img src="imagens/'.$botao_src.'" alt="Imagem '.$nomecategoria.'" style="cursor: pointer;" onclick="submitForm(\''.$nomecategoria.'\')">
                                        <span>
                                            <input type="hidden" name="tipo" value="'.$nomecategoria.'">
                                            <input type="submit" value="'.$nomecategoria.'" class="btn btn-light btn-sm">
                                        </span>
                                    </form>
                                </div>';
          }
          $c++;
    }
    echo $lista_categoria;

   }

   if($var=='menu_horizontal'){
        $sql = "SELECT botao_src, nomecategoria FROM categorias ORDER BY nomecategoria";
        $sql_temp = $PDO->query( $sql );
        while($temp = $sql_temp->fetch(PDO::FETCH_ASSOC)){
              $botao_src        = $temp["botao_src"];
              $nomecategoria    = $temp["nomecategoria"];

        $menu_horizontal .= '<li class="nav-item">
                                <form action="view.php" method="POST" id="form-'.$nomecategoria.'" class="form-inline">
                                    <input type="hidden" name="tipo" value="'.$nomecategoria.'">
                                    <button type="submit" class="nav-link btn btn-link">'.$nomecategoria.'</button>
                                </form>
                            </li>';
      }
      echo $menu_horizontal;
  }
  
}

?>