async function guardarConjunto() {
    const {value: nombreConjunto} = await Swal.fire({
        title: "Ingresa el nombre del nuevo conjunto:",
        input: "text",
        inputPlaceholder: "Ingresa el nombre",
        inputAttributes: {
            maxlength: "40",
            autocapitalize: "off",
            autocorrect: "off"
        }
    });
    // Verifica si el nombre del conjunto está presente
    if (nombreConjunto.trim() === '') {
        alert('Por favor, ingresa un nombre para el nuevo conjunto.');
    } else {
        window.location.href = 'conjuntos.jsp?nombreConjunto=' + nombreConjunto;
    }
}
async function guardarTarjeta(conjunto) {
    const {value: nombreTarjeta} = await Swal.fire({
        title: "Ingresa la pregunta de la nueva tarjeta:",
        input: "text",
        inputPlaceholder: "Ingresa la pregunta o concepto",
        inputAttributes: {
            maxlength: "55",
            autocapitalize: "off",
            autocorrect: "off"
        }
    });
    // Verifica si el nombre del conjunto está presente
    if (nombreTarjeta.trim() === '') {
        alert('Por favor, ingresa una pregunta o concepto para la nueva tarjeta.');
    } else {
        window.location.href = 'tarjetas.jsp?nombreTarjeta='+nombreTarjeta+'&conjunto='+conjunto;
    }
}
async function guardarHoja() {
    const {value: nombreHoja} = await Swal.fire({
        title: "Ingresa el título de la nueva hoja:",
        input: "text",
        inputPlaceholder: "Ingresa el título",
        inputAttributes: {
            maxlength: "45",
            autocapitalize: "off",
            autocorrect: "off"
        }
    });
    // Verifica si el nombre del conjunto está presente
    if (nombreHoja.trim() === '') {
        alert('Por favor, ingresa un título para la nueva hoja.');
    } else {
        window.location.href = 'hojas.jsp?nombreHoja='+nombreHoja;
    }
}
async function guardarHoja() {
    const {value: nombreHoja} = await Swal.fire({
        title: "Ingresa el título de la nueva hoja:",
        input: "text",
        inputPlaceholder: "Ingresa el título",
        inputAttributes: {
            maxlength: "45",
            autocapitalize: "off",
            autocorrect: "off"
        }
    });
    // Verifica si el nombre del conjunto está presente
    if (nombreHoja.trim() === '') {
        alert('Por favor, ingresa un título para la nueva hoja.');
    } else {
        window.location.href = 'hojas.jsp?nombreHoja='+nombreHoja;
    }
}