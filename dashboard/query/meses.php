<?php
$inicio = new DateTime('2024-01-01');
$fin = new DateTime('2025-05-01');

while ($inicio <= $fin) {
    echo $inicio->format('Y-m-d') . "<br>";
    $inicio->modify('+1 month');
}
?>