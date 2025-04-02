<?php
    header("Pragma: public");
    header("Expires: 0");
    $filename = "reporte_actividades.xls";
    header("Content-type: application/x-msdownload");
    header("Content-Disposition: attachment; filename=$filename");
    header("Pragma: no-cache");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

    session_start();
    include ("../prcd/qc/qc.php");

    date_default_timezone_set('America/Mexico_City');
    setlocale(LC_TIME, 'es_MX.UTF-8');
    $fecha_actual = strftime("%Y-%m-%d,%H:%M:%S");

    $sql = "SELECT users.username AS userName, log_registro.tipo_dato AS tipoDato, COUNT(log_registro.tipo_dato) AS contarDatos FROM users INNER JOIN log_registro ON users.username = log_registro.usr GROUP BY users.username, log_registro.tipo_dato LIMIT 9";

    $resultadoSql = $conn->query($sql);

    echo '
        <table class="table p-1">
            <thead>
                <tr>
                    <th scope="col">Actividad</th>
                    <th scope="col">Avance</th>
                    <th scope="col">Departamento</th>
                    <th scope="col">Usuario</th>
                </tr>
            </thead>
            <tbody id="usuariosTabla">
    ';

    while($row = $resultadoSql->fetch_assoc()){
        
        echo'
        <tr>
        ';
        $tipoDato = $row['tipoDato'];
        $sqlTipodato = "SELECT * FROM cat_logs WHERE id = '$tipoDato'";
        $resultadoTipo = $conn->query($sqlTipodato);
        $rowTipo = $resultadoTipo->fetch_assoc();

        echo'
            <td>'.$rowTipo['nombre'].'</td>
            <td>
                <div class="progress mt-3" style="height: 5px;">
                    <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </td>
            <td>'.$row['userName'].'</td>
            <td>'.$row['userName'].'</td>
        </tr>
        ';
    }
    echo '
            </tbody>
        </table>
    ';
    
?>