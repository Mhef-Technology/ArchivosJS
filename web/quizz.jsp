
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/quizz.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css"> <!-- Si has descargado los archivos localmente -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Quiz</title>
    </head>
    <%@ page import="javax.servlet.http.*" %>
    <%@ page import="java.io.*" %>
    <%
        HttpSession sesion = sesion = request.getSession();;
        String usuario = null;
        String tema = null;
        if (sesion.getAttribute("usu") != null) {
            try {
                usuario = (sesion.getAttribute("usu") != null) ? sesion.getAttribute("usu").toString() : "";
                tema = sesion.getAttribute("tema").toString();

            } catch (Exception e) {
                e.printStackTrace();
                out.println("Excepción: " + e.getMessage());
            }
    %>

    <body class="<%=tema%>">
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="juegos.jsp" title="Ir al menú de juegos"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <main>
            <section class="box">
                <div class="profile">
                    <h1>Quiz</h1>
                    <form id="quizForm">
                        <div id="questions">

                        </div>
                        <br>
                        <button type="submit" class="btn-envio">Enviar respuestas</button>
                    </form>

                    <div id="results"></div>

                    <button id="resetButton" class="btn-reinicio">Reiniciar Quiz</button>

                    <script>
                        var questions = [
                            {question: "¿Quién pintó la Mona Lisa?", options: ["Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci", "Claude Monet"], answer: "Leonardo da Vinci"},
                            {question: "¿En qué año llegó el hombre a la luna por primera vez?", options: ["1965", "1967", "1969", "1971"], answer: "1969"},
                            {question: "¿Cuál es la capital de Australia?", options: ["Sídney", "Melbourne", "Canberra", "Perth"], answer: "Canberra"},
                            {question: "¿Quién escribió 'Romeo y Julieta'?", options: ["Charles Dickens", "William Shakespeare", "Jane Austen", "Mark Twain"], answer: "William Shakespeare"},
                            {question: "¿Qué es la Estatua de la Libertad un regalo de qué país?", options: ["Italia", "Francia", "España", "Alemania"], answer: "Francia"},
                            {question: "¿Cuál es la montaña más alta del mundo?", options: ["K2", "Monte Everest", "Kangchenjunga", "Lhotse"], answer: "Monte Everest"},
                            {question: "¿Cuál es la moneda oficial de Japón?", options: ["Yuan", "Won", "Yen", "Dólar"], answer: "Yen"},
                            {question: "¿Quién pintó 'La noche estrellada'?", options: ["Pablo Picasso", "Vincent van Gogh", "Leonardo da Vinci", "Salvador Dalí"], answer: "Vincent van Gogh"},
                            {question: "¿Cuál es la capital de España?", options: ["Barcelona", "Madrid", "Sevilla", "Valencia"], answer: "Madrid"},
                            {question: "¿Quién fue el primer presidente de los Estados Unidos?", options: ["Abraham Lincoln", "Thomas Jefferson", "George Washington", "John Adams"], answer: "George Washington"},
                            {question: "¿En qué país se encuentra la Torre Eiffel?", options: ["Italia", "Reino Unido", "Francia", "Alemania"], answer: "Francia"},
                            {question: "¿Quién escribió 'Don Quijote de la Mancha'?", options: ["Miguel de Cervantes", "Gabriel García Márquez", "Jorge Luis Borges", "Federico García Lorca"], answer: "Miguel de Cervantes"},
                            {question: "¿Cuál es el océano más grande del mundo?", options: ["Océano Atlántico", "Océano Índico", "Océano Pacífico", "Océano Ártico"], answer: "Océano Pacífico"},
                            {question: "¿Cuál es la capital de Italia?", options: ["Milán", "Venecia", "Florencia", "Roma"], answer: "Roma"},
                            {question: "¿Quién pintó 'La persistencia de la memoria'?", options: ["Salvador Dalí", "Pablo Picasso", "Joan Miró", "Henri Matisse"], answer: "Salvador Dalí"},
                            {question: "¿Quién descubrió América?", "options": ["Cristóbal Colón", "Fernando de Magallanes", "Américo Vespucio", "Vasco da Gama"], "answer": "Cristóbal Colón"},
                            {question: "¿Cuál es el planeta más grande del sistema solar?", "options": ["Marte", "Júpiter", "Saturno", "Neptuno"], "answer": "Júpiter"},
                            {"question": "¿Quién es el autor de 'Cien años de soledad'?", "options": ["Julio Cortázar", "Gabriel García Márquez", "Isabel Allende", "Mario Vargas Llosa"]}, {
                                "question": "¿Cuál es el país con mayor extensión territorial en África?",
                                "options": ["Sudáfrica", "Nigeria", "Argelia", "Egipto"],
                                "answer": "Argelia"
                            },
                            {"question": "¿Cuál es la moneda oficial de Japón?",
                                "options": ["Yuan", "Won", "Yen", "Ringgit"],
                                "answer": "Yen"
                            },
                            {"question": "¿Cuál es el animal terrestre más rápido?",
                                "options": ["León", "Antílope", "Guepardo", "Tigre"],
                                "answer": "Guepardo"
                            },
                            {"question": "¿Qué país es conocido como la tierra del sol naciente?",
                                "options": ["China", "Corea del Sur", "Japón", "Vietnam"],
                                "answer": "Japón"
                            },
                            {"question": "¿Cuál es el símbolo químico del oro?",
                                "options": ["Au", "Ag", "O", "Gd"],
                                "answer": "Au"
                            },
                            {
                                "question": "¿Cuál es la capital de Australia?",
                                "options": ["Sídney", "Melbourne", "Canberra", "Brisbane"],
                                "answer": "Canberra"
                            },
                            {
                                "question": "¿En qué continente se encuentra Egipto?",
                                "options": ["Asia", "África", "Europa", "América"],
                                "answer": "África"
                            },
                            {
                                "question": "¿Cuál es el país más pequeño del mundo?",
                                "options": ["Liechtenstein", "San Marino", "Mónaco", "Vaticano"],
                                "answer": "Vaticano"
                            },
                            {
                                "question": "¿Quién fue el primer presidente de los Estados Unidos?",
                                "options": ["Thomas Jefferson", "John Adams", "George Washington", "Abraham Lincoln"],
                                "answer": "George Washington"
                            },
                            {
                                "question": "¿Cuál es el libro sagrado del Islam?",
                                "options": ["Torá", "Biblia", "Corán", "Vedas"],
                                "answer": "Corán"
                            },
                            {
                                "question": "¿En qué año comenzó la Primera Guerra Mundial?",
                                "options": ["1912", "1914", "1916", "1918"],
                                "answer": "1914"
                            },
                            {
                                "question": "¿Quién escribió 'Hamlet'?",
                                "options": ["Oscar Wilde", "Charles Dickens", "Jane Austen", "William Shakespeare"],
                                "answer": "William Shakespeare"
                            },
                            {
                                "question": "¿Qué país ganó la Copa Mundial de Fútbol en 2018?",
                                "options": ["Brasil", "Alemania", "Francia", "Argentina"],
                                "answer": "Francia"
                            },
                            {
                                "question": "¿Cuál es la ciudad más poblada del mundo?",
                                "options": ["Tokio", "Nueva York", "Sao Paulo", "Shanghái"],
                                "answer": "Tokio"
                            },
                            {
                                "question": "¿Cuál es la montaña más alta del mundo?",
                                "options": ["K2", "Kangchenjunga", "Lhotse", "Everest"],
                                "answer": "Everest"
                            },
                            {
                                "question": "¿Quién inventó la bombilla eléctrica?",
                                "options": ["Nikola Tesla", "Alexander Graham Bell", "Thomas Edison", "Benjamin Franklin"],
                                "answer": "Thomas Edison"
                            },
                            {
                                "question": "¿Cuál es el desierto más grande del mundo?",
                                "options": ["Desierto del Sahara", "Desierto de Arabia", "Desierto de Gobi", "Desierto de Kalahari"],
                                "answer": "Desierto del Sahara"
                            },
                            {
                                "question": "¿Cuál es el órgano más grande del cuerpo humano?",
                                "options": ["Cerebro", "Hígado", "Corazón", "Piel"],
                                "answer": "Piel"
                            },
                            {
                                "question": "¿Qué país tiene la forma de una bota?",
                                "options": ["España", "Portugal", "Italia", "Grecia"],
                                "answer": "Italia"
                            },
                            {
                                "question": "¿En qué año cayó el Muro de Berlín?",
                                "options": ["1985", "1987", "1989", "1991"],
                                "answer": "1989"
                            },
                            {
                                "question": "¿Cuál es el país más grande de América del Sur?",
                                "options": ["Argentina", "Brasil", "Chile", "Perú"],
                                "answer": "Brasil"
                            },
                            {
                                "question": "¿Qué inventor es conocido por su trabajo con la electricidad y la corriente alterna?",
                                "options": ["Isaac Newton", "Albert Einstein", "Nikola Tesla", "Galileo Galilei"],
                                "answer": "Nikola Tesla"
                            },
                            {
                                "question": "¿Cuál es el país más poblado de África?",
                                "options": ["Egipto", "Etiopía", "Sudáfrica", "Nigeria"],
                                "answer": "Nigeria"
                            },
                            {
                                "question": "¿Cuál es el idioma oficial de Brasil?",
                                "options": ["Español", "Francés", "Portugués", "Inglés"],
                                "answer": "Portugués"
                            },
                            {
                                "question": "¿Cuál es la ciudad más antigua del mundo?",
                                "options": ["Roma", "Atenas", "Jerusalén", "Damasco"],
                                "answer": "Damasco"
                            },
                            {
                                "question": "¿Cuál es el país con más islas en el mundo?",
                                "options": ["Indonesia", "Filipinas", "Noruega", "Suecia"], "answer": "Suecia"}, {"question": "¿Cuál es el único mamífero capaz de volar?", "options": ["Murciélago", "Ornitorrinco", "Ardilla voladora", "Perezoso"], "answer": "Murciélago"
                            }

                        ];

                        // Variable para almacenar las preguntas seleccionadas
                        var selectedQuestions = [];

                        // Función para obtener preguntas aleatorias
                        function getRandomQuestions(numQuestions) {
                            var shuffledQuestions = questions.sort(() => Math.random() - 0.5);
                            return shuffledQuestions.slice(0, numQuestions);
                        }

                        // Función para crear elementos HTML de pregunta
                        function createQuestionElement(questionObj, index) {
                            var questionDiv = document.createElement('div');
                            questionDiv.className = 'question';
                            questionDiv.innerHTML = '<h3>' + questionObj.question + '</h3>';

                            questionObj.options.forEach(function (option, i) {
                                var optionLabel = document.createElement('label');
                                optionLabel.innerHTML = '<input type="radio" name="q' + index + '" value="' + option + '"> ' + option;
                                questionDiv.appendChild(optionLabel);
                            });

                            return questionDiv;
                        }

                        // Función para mostrar las preguntas en el formulario
                        function displayQuestions() {
                            var questionsContainer = document.getElementById('questions');
                            selectedQuestions = getRandomQuestions(10);
                            selectedQuestions.forEach(function (questionObj, index) {
                                var questionElement = createQuestionElement(questionObj, index);
                                questionsContainer.appendChild(questionElement);
                            });
                        }

                        // Función para procesar las respuestas
                        document.getElementById('quizForm').addEventListener('submit', function (event) {
                            event.preventDefault();
                            var formData = new FormData(this);
                            var score = 0;
                            var resultHTML = "<h2>Resultados:</h2>";

                            selectedQuestions.forEach(function (questionObj, index) {
                                var userAnswer = formData.get('q' + index);
                                var correctAnswer = questionObj.answer;
                                if (userAnswer === correctAnswer) {
                                    score++;
                                } else {
                                    resultHTML += "<p class='result'><strong>Pregunta:</strong> " + questionObj.question + "<br><strong>Tu respuesta:</strong> " + (userAnswer || "No respondida") + "<br><strong>Respuesta correcta:</strong> " + correctAnswer + "</p>";
                                }
                            });

                            resultHTML += "<p>Puntaje: " + score + " de 10</p>";
                            document.getElementById('results').innerHTML = resultHTML;
                        });

                        // Función para reiniciar el quiz
                        document.getElementById('resetButton').addEventListener('click', function () {
                            var questionsContainer = document.getElementById('questions');
                            questionsContainer.innerHTML = ''; // Limpiar las preguntas
                            displayQuestions(); // Mostrar nuevas preguntas
                            var results = document.getElementById('results');
                            results.innerHTML = ''; // Limpiar los resultados
                        });

                        // Mostrar las preguntas al cargar la página
                        displayQuestions();
                    </script>




                </div>
            </section>
        </main>
        <footer>
            <div class="subir">
                <a href="#box">Ir al principio</a>
            </div>
            <nav>
                <div class="containfooter">
                    <div class="bordeizq"></div>
                    <div class="leftfooter">
                        <div class="aboutus">Conócenos</div>
                        <ul>
                            <li><a href="http://mhef.gerdoc.com/#mision">Misión</a></li>
                            <li><a href="http://mhef.gerdoc.com/#vision">Visión</a></li>
                            <li><a href="http://mhef.gerdoc.com/#objetivos">Objetivos</a></li>
                            <li><a href="http://mhef.gerdoc.com/#politicas">Políticas</a></li>
                            <li><a href="http://mhef.gerdoc.com/#filosofia">Filosofía</a></li>
                            <li><a href="http://mhef.gerdoc.com/#valores">Valores</a></li>
                        </ul>
                    </div>
                    <div class="centerfooter">
                        <div class="help">Ayuda</div>
                    </div>
                    <div class="rightfooter">
                        <div class="contact">Contacto</div>
                        <ul>
                            <li><p class="tit2">Teléfono:</p></li>
                            <li><p class="numero"><i class="fa-solid fa-phone" style="color: #ffffff;"></i>5503923923</p></li>
                            <li><p class="tit2">Correo electrónico:</p></li>
                            <li><p><i class="fa-solid fa-envelope" style="color: #ffffff;"></i>mhef.technology@gmail.com</p></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="socialNetworks">
                <ul>
                    <li>
                        <a href="https://www.facebook.com/profile.php?id=61550922583788&mibextid=ZbWKwL"><i class="fa-brands fa-square-facebook"></i></a>
                        <a href="https://www.instagram.com/mhef_technology/"><i class="fa-brands fa-square-instagram"></i></a>
                        <a href="https://github.com/Mhef-Technology"><i class="fa-brands fa-square-github"></i></a>
                    </li>
                </ul>
            </div>
            <p class="fin">&copy; 2023 Mhef Technology. Todos los derechos reservados</p>
        </footer>
    </body>
    <%
    } else {
    %>
    <html class="fail">
        <body class="failbody">
            <main>
                <section class="boxx">
                    <div class="inputbox">
                        <h1>Solicitud ilegal</h1>
                    </div>
                    <button name="boton-continuar" id="boton-continuar" onclick="window.location.href = 'login.jsp';"><-- Regresar</button>
                </section>
            </main>
        </body>
    </html>
    <%
        }
    %>
</html>
