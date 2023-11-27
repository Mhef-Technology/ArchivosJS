function agregarTexto(metodo) {
    if(metodo === 1){
        var recuadro = document.getElementById("descriptionCard");
        if (recuadro.innerHTML === '') {
            recuadro.innerHTML = "Ingresa la respuesta o definición correspondiente";
        }
    } else if (metodo === 2) {
        var ideas = document.getElementById("ideasHoja");
        var notas = document.getElementById("notasHoja");
        var resumen = document.getElementById("resHoja");
        if (ideas.innerHTML === '') {
            ideas.innerHTML = "De este lado, coloca las ideas principales que encuentras del tema";
        }
        if (notas.innerHTML === '') {
            notas.innerHTML = "En esta parte coloca tus notas del tema";
        }
        if (resumen.innerHTML === '') {
            resumen.innerHTML = "Aquí coloca un resumen del tema";
        }
    }
}