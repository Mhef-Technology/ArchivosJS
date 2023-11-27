function mostrarContraseña(cual) {
    if (cual === 1) {
        var contraseniaInput = document.getElementById("password");
        var botonMostrar = document.getElementById("mostrar-contrasenia1");
        if (contraseniaInput.type === "password") {
            contraseniaInput.type = "text";
        } else {
            contraseniaInput.type = "password";
        }
    } else if (cual === 2) {
        var contraseniaInput = document.getElementById("password2");
        var botonMostrar = document.getElementById("mostrar-contrasenia2");
        if (contraseniaInput.type === "password") {
            contraseniaInput.type = "text";
        } else {
            contraseniaInput.type = "password";
        }
    }
}
function ojo(cual) {
    if (cual === 1) {
        var contrasenia = document.getElementById("password").value;
        var botonMostrar = document.getElementById("mostrar-contrasenia1");
        if (contrasenia === "c") {
            botonMostrar.value = "️";
        } else {
            botonMostrar.value = "👁️";
        }
    } else if (cual === 2) {
        var contrasenia = document.getElementById("password2").value;
        var botonMostrar = document.getElementById("mostrar-contrasenia2");
        if (contrasenia === "c") {
            botonMostrar.value = "️";
        } else {
            botonMostrar.value = "👁️";
        }
    }
}
function valnomusu(e) {
    var letritas = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-./", x = e.which || e.keycode, letra = String.fromCharCode(x);
    var n = letritas.indexOf(letra);
    if (n === -1)
        return false;
    else
        return true;
}
function valemail(e) {
    var letritas = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890.@", x = e.which || e.keycode, letra = String.fromCharCode(x);
    var n = letritas.indexOf(letra);
    if (n === -1)
        return false;
    else
        return true;
}
function validarContraseña() {

}