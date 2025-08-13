function reporteContratosExcel() {
  const tabla = document.getElementById('tablaReporteContratos');
  const html = tabla.outerHTML;
  const blob = new Blob([html], {type: 'application/vnd.ms-excel'});
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = 'reporteContratos.xls';
  a.click();
}

function reporteOtrosGastosExcel() {
  const tabla = document.getElementById('reporteOtrosGastos');
  const html = tabla.outerHTML;
  const blob = new Blob([html], {type: 'application/vnd.ms-excel'});
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = 'reporteOtrosGastos.xls';
  a.click();
}