
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
                out.println("Excepci�n: " + e.getMessage());
            }
    %>

    <body class="<%=tema%>">
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="juegos.jsp" title="Ir al men� de juegos"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesi�n</a></li>
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
                            {question: "�Qui�n pint� la Mona Lisa?", options: ["Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci", "Claude Monet"], answer: "Leonardo da Vinci"},
                            {question: "�En qu� a�o lleg� el hombre a la luna por primera vez?", options: ["1965", "1967", "1969", "1971"], answer: "1969"},
                            {question: "�Cu�l es la capital de Australia?", options: ["S�dney", "Melbourne", "Canberra", "Perth"], answer: "Canberra"},
                            {question: "�Qui�n escribi� 'Romeo y Julieta'?", options: ["Charles Dickens", "William Shakespeare", "Jane Austen", "Mark Twain"], answer: "William Shakespeare"},
                            {question: "�Qu� es la Estatua de la Libertad un regalo de qu� pa�s?", options: ["Italia", "Francia", "Espa�a", "Alemania"], answer: "Francia"},
                            {question: "�Cu�l es la monta�a m�s alta del mundo?", options: ["K2", "Monte Everest", "Kangchenjunga", "Lhotse"], answer: "Monte Everest"},
                            {question: "�Cu�l es la moneda oficial de Jap�n?", options: ["Yuan", "Won", "Yen", "D�lar"], answer: "Yen"},
                            {question: "�Qui�n pint� 'La noche estrellada'?", options: ["Pablo Picasso", "Vincent van Gogh", "Leonardo da Vinci", "Salvador Dal�"], answer: "Vincent van Gogh"},
                            {question: "�Cu�l es la capital de Espa�a?", options: ["Barcelona", "Madrid", "Sevilla", "Valencia"], answer: "Madrid"},
                            {question: "�Qui�n fue el primer presidente de los Estados Unidos?", options: ["Abraham Lincoln", "Thomas Jefferson", "George Washington", "John Adams"], answer: "George Washington"},
                            {question: "�En qu� pa�s se encuentra la Torre Eiffel?", options: ["Italia", "Reino Unido", "Francia", "Alemania"], answer: "Francia"},
                            {question: "�Qui�n escribi� 'Don Quijote de la Mancha'?", options: ["Miguel de Cervantes", "Gabriel Garc�a M�rquez", "Jorge Luis Borges", "Federico Garc�a Lorca"], answer: "Miguel de Cervantes"},
                            {question: "�Cu�l es el oc�ano m�s grande del mundo?", options: ["Oc�ano Atl�ntico", "Oc�ano �ndico", "Oc�ano Pac�fico", "Oc�ano �rtico"], answer: "Oc�ano Pac�fico"},
                            {question: "�Cu�l es la capital de Italia?", options: ["Mil�n", "Venecia", "Florencia", "Roma"], answer: "Roma"},
                            {question: "�Qui�n pint� 'La persistencia de la memoria'?", options: ["Salvador Dal�", "Pablo Picasso", "Joan Mir�", "Henri Matisse"], answer: "Salvador Dal�"},
                            {question: "�Qui�n descubri� Am�rica?", "options": ["Crist�bal Col�n", "Fernando de Magallanes", "Am�rico Vespucio", "Vasco da Gama"], "answer": "Crist�bal Col�n"},
                            {question: "�Cu�l es el planeta m�s grande del sistema solar?", "options": ["Marte", "J�piter", "Saturno", "Neptuno"], "answer": "J�piter"},
                            {"question": "�Qui�n es el autor de 'Cien a�os de soledad'?", "options": ["Julio Cort�zar", "Gabriel Garc�a M�rquez", "Isabel Allende", "Mario Vargas Llosa"]}, {
                                "question": "�Cu�l es el pa�s con mayor extensi�n territorial en �frica?",
                                "options": ["Sud�frica", "Nigeria", "Argelia", "Egipto"],
                                "answer": "Argelia"
                            },
                            {"question": "�Cu�l es la moneda oficial de Jap�n?",
                                "options": ["Yuan", "Won", "Yen", "Ringgit"],
                                "answer": "Yen"
                            },
                            {"question": "�Cu�l es el animal terrestre m�s r�pido?",
                                "options": ["Le�n", "Ant�lope", "Guepardo", "Tigre"],
                                "answer": "Guepardo"
                            },
                            {"question": "�Qu� pa�s es conocido como la tierra del sol naciente?",
                                "options": ["China", "Corea del Sur", "Jap�n", "Vietnam"],
                                "answer": "Jap�n"
                            },
                            {"question": "�Cu�l es el s�mbolo qu�mico del oro?",
                                "options": ["Au", "Ag", "O", "Gd"],
                                "answer": "Au"
                            },
                            {
                                "question": "�Cu�l es la capital de Australia?",
                                "options": ["S�dney", "Melbourne", "Canberra", "Brisbane"],
                                "answer": "Canberra"
                            },
                            {
                                "question": "�En qu� continente se encuentra Egipto?",
                                "options": ["Asia", "�frica", "Europa", "Am�rica"],
                                "answer": "�frica"
                            },
                            {
                                "question": "�Cu�l es el pa�s m�s peque�o del mundo?",
                                "options": ["Liechtenstein", "San Marino", "M�naco", "Vaticano"],
                                "answer": "Vaticano"
                            },
                            {
                                "question": "�Qui�n fue el primer presidente de los Estados Unidos?",
                                "options": ["Thomas Jefferson", "John Adams", "George Washington", "Abraham Lincoln"],
                                "answer": "George Washington"
                            },
                            {
                                "question": "�Cu�l es el libro sagrado del Islam?",
                                "options": ["Tor�", "Biblia", "Cor�n", "Vedas"],
                                "answer": "Cor�n"
                            },
                            {
                                "question": "�En qu� a�o comenz� la Primera Guerra Mundial?",
                                "options": ["1912", "1914", "1916", "1918"],
                                "answer": "1914"
                            },
                            {
                                "question": "�Qui�n escribi� 'Hamlet'?",
                                "options": ["Oscar Wilde", "Charles Dickens", "Jane Austen", "William Shakespeare"],
                                "answer": "William Shakespeare"
                            },
                            {
                                "question": "�Qu� pa�s gan� la Copa Mundial de F�tbol en 2018?",
                                "options": ["Brasil", "Alemania", "Francia", "Argentina"],
                                "answer": "Francia"
                            },
                            {
                                "question": "�Cu�l es la ciudad m�s poblada del mundo?",
                                "options": ["Tokio", "Nueva York", "Sao Paulo", "Shangh�i"],
                                "answer": "Tokio"
                            },
                            {
                                "question": "�Cu�l es la monta�a m�s alta del mundo?",
                                "options": ["K2", "Kangchenjunga", "Lhotse", "Everest"],
                                "answer": "Everest"
                            },
                            {
                                "question": "�Qui�n invent� la bombilla el�ctrica?",
                                "options": ["Nikola Tesla", "Alexander Graham Bell", "Thomas Edison", "Benjamin Franklin"],
                                "answer": "Thomas Edison"
                            },
                            {
                                "question": "�Cu�l es el desierto m�s grande del mundo?",
                                "options": ["Desierto del Sahara", "Desierto de Arabia", "Desierto de Gobi", "Desierto de Kalahari"],
                                "answer": "Desierto del Sahara"
                            },
                            {
                                "question": "�Cu�l es el �rgano m�s grande del cuerpo humano?",
                                "options": ["Cerebro", "H�gado", "Coraz�n", "Piel"],
                                "answer": "Piel"
                            },
                            {
                                "question": "�Qu� pa�s tiene la forma de una bota?",
                                "options": ["Espa�a", "Portugal", "Italia", "Grecia"],
                                "answer": "Italia"
                            },
                            {
                                "question": "�En qu� a�o cay� el Muro de Berl�n?",
                                "options": ["1985", "1987", "1989", "1991"],
                                "answer": "1989"
                            },
                            {
                                "question": "�Cu�l es el pa�s m�s grande de Am�rica del Sur?",
                                "options": ["Argentina", "Brasil", "Chile", "Per�"],
                                "answer": "Brasil"
                            },
                            {
                                "question": "�Qu� inventor es conocido por su trabajo con la electricidad y la corriente alterna?",
                                "options": ["Isaac Newton", "Albert Einstein", "Nikola Tesla", "Galileo Galilei"],
                                "answer": "Nikola Tesla"
                            },
                            {
                                "question": "�Cu�l es el pa�s m�s poblado de �frica?",
                                "options": ["Egipto", "Etiop�a", "Sud�frica", "Nigeria"],
                                "answer": "Nigeria"
                            },
                            {
                                "question": "�Cu�l es el idioma oficial de Brasil?",
                                "options": ["Espa�ol", "Franc�s", "Portugu�s", "Ingl�s"],
                                "answer": "Portugu�s"
                            },
                            {
                                "question": "�Cu�l es la ciudad m�s antigua del mundo?",
                                "options": ["Roma", "Atenas", "Jerusal�n", "Damasco"],
                                "answer": "Damasco"
                            },
                            {
                                "question": "�Cu�l es el pa�s con m�s islas en el mundo?",
                                "options": ["Indonesia", "Filipinas", "Noruega", "Suecia"], "answer": "Suecia"}, {"question": "�Cu�l es el �nico mam�fero capaz de volar?", "options": ["Murci�lago", "Ornitorrinco", "Ardilla voladora", "Perezoso"], "answer": "Murci�lago"
                            }

                        ];

                        // Variable para almacenar las preguntas seleccionadas
                        var selectedQuestions = [];

                        // Funci�n para obtener preguntas aleatorias
                        function getRandomQuestions(numQuestions) {
                            var shuffledQuestions = questions.sort(() => Math.random() - 0.5);
                            return shuffledQuestions.slice(0, numQuestions);
                        }

                        // Funci�n para crear elementos HTML de pregunta
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

                        // Funci�n para mostrar las preguntas en el formulario
                        function displayQuestions() {
                            var questionsContainer = document.getElementById('questions');
                            selectedQuestions = getRandomQuestions(10);
                            selectedQuestions.forEach(function (questionObj, index) {
                                var questionElement = createQuestionElement(questionObj, index);
                                questionsContainer.appendChild(questionElement);
                            });
                        }

                        // Funci�n para procesar las respuestas
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

                        // Funci�n para reiniciar el quiz
                        document.getElementById('resetButton').addEventListener('click', function () {
                            var questionsContainer = document.getElementById('questions');
                            questionsContainer.innerHTML = ''; // Limpiar las preguntas
                            displayQuestions(); // Mostrar nuevas preguntas
                            var results = document.getElementById('results');
                            results.innerHTML = ''; // Limpiar los resultados
                        });

                        // Mostrar las preguntas al cargar la p�gina
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
                        <div class="aboutus">Con�cenos</div>
                        <ul>
                            <li><a href="http://mhef.gerdoc.com/#mision">Misi�n</a></li>
                            <li><a href="http://mhef.gerdoc.com/#vision">Visi�n</a></li>
                            <li><a href="http://mhef.gerdoc.com/#objetivos">Objetivos</a></li>
                            <li><a href="http://mhef.gerdoc.com/#politicas">Pol�ticas</a></li>
                            <li><a href="http://mhef.gerdoc.com/#filosofia">Filosof�a</a></li>
                            <li><a href="http://mhef.gerdoc.com/#valores">Valores</a></li>
                        </ul>
                    </div>
                    <div class="centerfooter">
                        <div class="help">Ayuda</div>
                    </div>
                    <div class="rightfooter">
                        <div class="contact">Contacto</div>
                        <ul>
                            <li><p class="tit2">Tel�fono:</p></li>
                            <li><p class="numero"><i class="fa-solid fa-phone" style="color: #ffffff;"></i>5503923923</p></li>
                            <li><p class="tit2">Correo electr�nico:</p></li>
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
