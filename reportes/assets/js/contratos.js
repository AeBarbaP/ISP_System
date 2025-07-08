
function _(el){
    return document.getElementById(el);
}

function consultaContratosRep() {
    $.ajax({
        url: 'query/query_contratos.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#tablaContratosG').html(data);
            

        }
    });
}

function consultaClientesRep() {
    $.ajax({
        url: 'query/query_clientesRep.php',
        type: 'POST',
        dataType: 'html',
        success: function(data) {
            $('#cliente_reporte_individual').html(data);
        }
    });
}

function buscarContratosRep(val){
    let nombre = val;
    if(nombre == ""){
        _('tablaContratosGRep').innerHTML = "";
        return;
    }
    $.ajax({
        url: 'query/query_contratosRep.php',
        type: 'POST',
        data:{
            nombre : nombre
        },
        dataType: 'html',
        success: function(data) {
            $('#tablaContratosGRep').html(data);
        }
    });
}

function buscarContratosRepFecha(){
    let fechaInicial = _('fecha_inicio_contratos').value;
    let fechaFinal = _('fecha_final_contratos').value;

    if( fechaInicial == "" || fechaFinal == ""){
        alert("Debes llenar ambas fechas");
        return;
    }

    $.ajax({
        url: 'query/query_contratosRep_fecha.php',
        type: 'POST',
        data:{
            fechaInicial : fechaInicial,
            fechaFinal : fechaFinal
        },
        dataType: 'html',
        success: function(data) {
            $('#tablaContratosGRep').html(data);
        }
    });
}

function queryContrato(){

}

function cambiarEstatusCont(folio, estatus){
    let name = _('nombre_buscarContrato').value;
    if (confirm("¿Cambiar estatus del contrato?")) {
        $.ajax({
            url: 'prcd/prcd_cambiar_estatus_contrato.php',
            type: 'POST',
            data:{
                folio : folio,
                estatus : estatus
            },
            dataType: 'json',
            success: function(data) {
                let success = data.success;
                
                if(success = 1){
                    _('nombre_buscarContrato').value = name;
                    console.log(name);
                    buscarContratosRep(name);
                    alert('Estatus del contrato '+folio);
                }
            }
        });
    } else {
    // Code to execute if the user clicks "Cancel" (e.g., do nothing)
    console.log("No se cambió el estatus"); //prueba
    }
}