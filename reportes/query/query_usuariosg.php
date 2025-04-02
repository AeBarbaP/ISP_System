<?php

    session_start();
    include ("../prcd/qc/qc.php");

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');
    $fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

    //$sql = "SELECT users.username AS username, users.perfil AS perfil, users.fecha_creacion AS fecha_c, users.estatus AS estatus, users.nombre AS nombre, fecha_iniciosesion.log_usrlogin AS fecha_login INNER JOIN log_usrlogin ON users.id = log_usrlogin.id_usr ORDER BY fecha_iniciosesion.log_usrlogin ASC";
    //$resultadoSql = $conn->query($sql);

    $sqlQueryUsers ="SELECT * FROM users";
    $resultadoQueryUsers = $conn->query($sqlQueryUsers);

    while($row = $resultadoQueryUsers->fetch_assoc()){

        $idLogIn = $row['id'];

        $sqlLogIn ="SELECT * FROM log_usrlogin WHERE id_usr = '$idLogIn' ORDER BY fecha_iniciosesion DESC LIMIT 1";
        $resultadoLogIn = $conn->query($sqlLogIn);
        $rowLogIn = $resultadoLogIn->fetch_assoc();

        $perfil = $row['perfil'];

        $sqlPerfil = "SELECT * FROM perfiles_usr WHERE id = $perfil";
        $resultadoPerfil = $conn->query($sqlPerfil);
        $rowPerfil = $resultadoPerfil->fetch_assoc();

        $fecha_login = $rowLogIn['fecha_iniciosesion'];

        if ($fecha_login == null || $fecha_login == '') {
            $fecha_ini = "Usuario nuevo";
        } else {
            $fecha_ini = $fecha_login;
        }

        echo'
        <tr>
            <th scope="row"><a style="text-decoration: none;" data-bs-toggle="modal" data-bs-target="#editar"><i class="bi bi-three-dots-vertical"></i></a></th>
            <td>'.$rowPerfil['perfil'].'</td>
            <td>'.$row['fecha_creacion'].'</td>
            <td>'.$fecha_ini.'</td>  /* ultimo login */
            <td>';
            if ($row['estatus'] == '1') {
                echo '
                    <div class="form-check form-switch">
                        <input class="form-check-input mx-auto" type="checkbox" role="switch" id="estatususr" onclick="estatusCambio('.$idLogIn.',0)" checked>
                    </div> 
                ';
                } else {
                    echo '
                        <div class="form-check form-switch">
                            <input class="form-check-input mx-auto" type="checkbox" role="switch" id="estatususr" onclick="estatusCambio('.$idLogIn.',1)">
                        </div>
                    ';
                }
                echo'
            </td>
            <td>'.$row['nombre'].'</td>
            <td>'.$row['username'].'</td>
            <td class="text-end">
                <a href="#" class="text-end" aria-expanded="false">
                    <img src="assets/img/avatar.jpg" alt="" width="32" height="32" class="rounded-circle">
                </a>
            </td>
        </tr>
        ';
    }

    
?>