const bodyElement = document.querySelector('body');
const mainElement = document.querySelector('main');
const divElement = document.getElementById('contador');
const checkElement = document.getElementById('toggle');
function cambio() {
    if (!checkElement.checked) {
        bodyElement.setAttribute('class', 'dark');
        mainElement.setAttribute('class', 'dark');
        divElement.setAttribute('class', 'racha-circle dark')
    } else if (checkElement.checked) {
        bodyElement.setAttribute('class', 'light');
        mainElement.setAttribute('class', 'light');
        divElement.setAttribute('class', 'racha-circle light')
    }
}
function active(modo) {
    if (modo === "dark") {
        checkElement.checked = true;
    }
}