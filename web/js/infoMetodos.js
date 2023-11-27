function metodo(cual) {
    switch (cual) {
        case 1:
            Swal.fire({
                title: "Método Pomodoro",
                text: "La técnica Pomodoro es un método de gestión de tiempo que sugiere trabajar en intervalos de 25 minutos, sin interrupción ni distracciones, y añadir tiempos de descanso de 5 minutos. Su objetivo es establecer metas y mejorar la productividad.",
                icon: "success"
            });
            break;
        case 2:
            Swal.fire({
                title: "Método Flashcards",
                text: "Las flashcards son unas tarjetas hechas específicamente para estudiar, en las que por una cara se pone el concepto o pregunta a estudiar y por la otra cara se pone la respuesta o el desarrollo.",
                icon: "success"
            });
            break;
        case 3:
            Swal.fire({
                title: "Método Cornell",
                text: "El método de estudio Cornell es un método creado para facilitar la toma de notas. En este, una hojas es dividida en cuatro partes, una dedicada al título (superior), otra para ideas clave (izquierda), otra más para notas (derecha) y una última para un resumen (inferior).",
                icon: "success"
            });
            break;
        case 4:
            Swal.fire({
                text: "Registro exitoso",
                icon: "success"
            });
            break;
        case 5:
            Swal.fire({
                title: "Error",
                text: "Usuario no encontrado",
                icon: "error"
            });
            break;
        case 6:
            Swal.fire({
                text: "Registro exitoso",
                icon: "success"
            });
            break;
        case 7:
            Swal.fire({
                text: "Nombre de usuario en uso",
                icon: "error"
            });
            break;
        case 8:
            Swal.fire({
                text: "Las contraseñas no coinciden",
                icon: "error"
            });
            break;
        case 9:
            Swal.fire({
                text: "Actualizaciones realizadas con éxito",
                icon: "success"
            });
            break;
        case 10:
            Swal.fire({
                text: "Registro fallido",
                icon: "error"
            });
            break;
        default:
            break;
    }
}
function logro(cual, siono) {
    if (siono === 1) {
        switch (cual) {
            case 1:
                Swal.fire({
                    title: "¡Felicidades! Desbloqueaste un nuevo logro",
                    imageUrl: "./img/Flash-Inicia_resized.jpg",
                    html: "Flash-Inicia<br>Besos en el cerebro"
                });
                break;
            case 2:
                Swal.fire({
                    title: "¡Felicidades! Desbloqueaste un nuevo logro",
                    imageUrl: "./img/Crono_Prestigio_resized.jpg",
                    html: "Crono Prestigio<br>¡Eres el más veloz!"
                });
                break;
            case 3:
                Swal.fire({
                    title: "¡Felicidades! Desbloqueaste un nuevo logro",
                    imageUrl: "./img/Creatividad_resized.jpg",
                    html: "Creatividad<br>¡Tomar apuntes nunca había sido tan útil!"
                });
                break;
            default:
                break;
        }
    } else {
        switch (cual) {
            case 1:
                Swal.fire({
                    title: "¡Felicidades! Desbloqueaste un nuevo logro",
                    imageUrl: "./img/Flash-Inicia_resized.jpg",
                    html: "Flash-Inicia<br>Besos en el cerebro"
                }).then((result) => {
                    // Verificar si se hizo clic en "OK" en la primera alerta
                    if (result.isConfirmed) {
                        // Lanzar la segunda alerta
                        return Swal.fire({
                            title: "¡Felicidades! Desbloqueaste un nuevo logro",
                            imageUrl: "./img/Rapidamente_Sabio_resized.jpg",
                            html: "Rapidamente Sabio<br>¡Sigue aprendiendo, no pares!"
                        });
                    }
                });
                break;
            case 2:
                Swal.fire({
                    title: "¡Felicidades! Desbloqueaste un nuevo logro",
                    imageUrl: "./img/Crono_Prestigio_resized.jpg",
                    html: "Crono Prestigio<br>¡Eres el más veloz!"
                }).then((result) => {
                    // Verificar si se hizo clic en "OK" en la primera alerta
                    if (result.isConfirmed) {
                        // Lanzar la segunda alerta
                        return Swal.fire({
                            title: "¡Felicidades! Desbloqueaste un nuevo logro",
                            imageUrl: "./img/Rapidamente_Sabio_resized.jpg",
                            html: "Rapidamente Sabio<br>¡Sigue aprendiendo, no pares!"
                        });
                    }
                });
                break;
            case 3:
                Swal.fire({
                    title: "¡Felicidades! Desbloqueaste un nuevo logro",
                    imageUrl: "./img/Creatividad_resized.jpg",
                    html: "Creatividad<br>¡Tomar apuntes nunca había sido tan útil!"
                }).then((result) => {
                    // Verificar si se hizo clic en "OK" en la primera alerta
                    if (result.isConfirmed) {
                        // Lanzar la segunda alerta
                        return Swal.fire({
                            title: "¡Felicidades! Desbloqueaste un nuevo logro",
                            imageUrl: "./img/Rapidamente_Sabio_resized.jpg",
                            html: "Rapidamente Sabio<br>¡Sigue aprendiendo, no pares!"
                        });
                    }
                });
                break;
            default:
                break;
        }
    }
}