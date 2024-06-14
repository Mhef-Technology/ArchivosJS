async function guardarConjunto() {
    const { value: formValues } = await Swal.fire({
        title: "Ingresa el nombre del nuevo conjunto",
        html:
            '<input id="nombreConjunto" class="swal2-input" placeholder="Ingresa el nombre" maxlength="40">' +
            '<div style="text-align: center;"><input type="checkbox" id="generar" style="margin-top: 25px; margin-bottom: 10px; "> Generar tarjetas mediante IA</div>',
        focusConfirm: false,
        preConfirm: () => {
            return {
                nombreConjunto: document.getElementById('nombreConjunto').value,
                generar: document.getElementById('generar').checked
            };
        }
    });

    if (!formValues) {
        return;
    }

    const { nombreConjunto, generar } = formValues;

    if (nombreConjunto.trim() === '') {
        alert('Por favor, ingresa un nombre para el nuevo conjunto.');
    } else if (!generar) {
        window.location.href = 'conjuntos.jsp?nombreConjunto=' + nombreConjunto;
    } else {
        generarQuiz(nombreConjunto);
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
        window.location.href = 'tarjetas.jsp?nombreTarjeta=' + nombreTarjeta + '&conjunto=' + conjunto;
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
        window.location.href = 'hojas.jsp?nombreHoja=' + nombreHoja;
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
        window.location.href = 'hojas.jsp?nombreHoja=' + nombreHoja;
    }
}