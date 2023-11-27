var intervalo25;
var intervalo5;

function comenzar() {
    var video = document.getElementById("hielo");
    video.play();
    video.onended = function () {
        iniciarCuentaRegresiva5Minutos();
    };
}

function iniciarCuentaRegresiva() {
    var tiempoInicial = 1 * 60;
    var tiempoElemento = document.getElementById("tiempo");
    var boton = document.getElementById("boton-comenzar");
    boton.disabled = false;

    intervalo25 = setInterval(function () {
        var minutos = Math.floor(tiempoInicial / 60);
        var segundos = tiempoInicial % 60;

        tiempoElemento.textContent = (minutos < 10 ? '0' : '') + minutos + ':' + (segundos < 10 ? '0' : '') + segundos;

        tiempoInicial--;
        if (tiempoInicial < 0) {
            clearInterval(intervalo25); // Detener el intervalo
            boton.disabled = true;
            tiempoElemento.textContent = "01:00";

            cambiarVideo("video/Hielito5.mp4", 5 * 60);
            window.location.href = 'pomodoro.jsp?logro=true';
        }
    }, 1000); 
}

function iniciarCuentaRegresiva5Minutos() {
    var tiempoInicial = 5 * 60;
    var tiempoElemento = document.getElementById("tiempo");
    var boton = document.getElementById("boton-comenzar");
    boton.disabled = false;

    intervalo5 = setInterval(function () {
        var minutos = Math.floor(tiempoInicial / 60);
        var segundos = tiempoInicial % 60;

        tiempoElemento.textContent = (minutos < 10 ? '0' : '') + minutos + ':' + (segundos < 10 ? '0' : '') + segundos;

        tiempoInicial--;

        if (tiempoInicial < 0) {
            clearInterval(intervalo5); 
            boton.disabled = true;
            tiempoElemento.textContent = "05:00";

            cambiarVideo("video/Hielo de 1 minuto.mp4", 1 * 60);

            setTimeout(function () {
                iniciarCuentaRegresiva();
            }, 2000); 
        }
    }, 1000); 
}

function finalizar() {
    clearInterval(intervalo25);
    var video = document.getElementById("hielo");
    video.pause();
    video.currentTime = 0; 
    var tiempoElemento = document.getElementById("tiempo");
    tiempoElemento.textContent = "01:00";
    var boton = document.getElementById("boton-comenzar");
    boton.disabled = false;
}

function cambiarVideo(nuevoVideo, nuevoTiempo) {
    var video = document.getElementById("hielo");
    video.src = nuevoVideo;
    video.load(); 
    video.play(); 
    var tiempoElemento = document.getElementById("tiempo");
    tiempoElemento.textContent = formatTiempo(nuevoTiempo);
    var boton = document.getElementById("boton-comenzar");
    boton.disabled = false;
}

function formatTiempo(tiempo) {
    var minutos = Math.floor(tiempo / 60);
    var segundos = tiempo % 60;
    return (minutos < 10 ? '0' : '') + minutos + ':' + (segundos < 10 ? '0' : '') + segundos;
}