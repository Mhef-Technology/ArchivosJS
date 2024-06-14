let preguntasRespuestas = [];

async function generarQuiz(tema, usuario) {
    if (!tema) {
        alert('Por favor, ingresa un tema.');
        return;
    }

    const response = await fetch('https://api.openai.com/v1/chat/completions', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer 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`
        },
        body: JSON.stringify({
            model: 'gpt-3.5-turbo',
            messages: [{"role": "user", "content": `Elabora una lista de 5 preguntas para un quiz sobre el tema ${tema} con sus respuestas, procurando que las preguntas no pasen los 55 caracteres.`}]
        })
    });

    const data = await response.json();
    preguntasRespuestas = [];

    if (data.choices && data.choices.length > 0) {
            preguntasRespuestas = data.choices[0].message.content.split('\n\n');
        for (let i = 0; i < preguntasRespuestas.length; i++) {
            let [pregunta, respuesta] = preguntasRespuestas[i].split('Respuesta:');
            if (pregunta && respuesta) {
                console.log(pregunta);
                console.log("answer:" + respuesta);
                await enviarPreguntaRespuesta(tema, pregunta.trim(), respuesta.trim(), usuario, i);
            }
        }
    } else {
        console.log('No se pudieron generar las preguntas.');
    }
}
async function enviarPreguntaRespuesta(tema, pregunta, respuesta, usuario, vez) {
    const response = await fetch('http://localhost:8080/MekshFinal1/pregunta-respuesta', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ tema, pregunta, respuesta, usuario, vez })
    });
    console.log(usuario);

    if (!response.ok) {
        console.error('Error al enviar pregunta y respuesta al servidor.');
    }
}