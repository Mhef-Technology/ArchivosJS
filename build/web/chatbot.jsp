<%@page import="javax.servlet.http.*"%>
<%@page import="java.io.*" %>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/gorrito.jpeg" type="image/x-icon">
        <link rel="stylesheet" href="css/soporteStyle.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css"> <!-- Si has descargado los archivos localmente -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Chatbot</title>
    </head>
    <%
        request.setCharacterEncoding("UTF-8");
        java.util.Date currentDate = new java.util.Date();
        HttpSession sesion = null;
        String usuario = null;
        String tema = null;

        int loginCount = 1; // Declarar e inicializar fuera del bloque try-catch

        try {
            sesion = request.getSession();
            usuario = (sesion.getAttribute("usu") != null) ? sesion.getAttribute("usu").toString() : "";
            tema = (sesion.getAttribute("tema") != null) ? sesion.getAttribute("tema").toString() : "";

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Excepción: " + e.getMessage());
        }
    %>
    <script>
        const usuario = "<%=usuario%>";
        const socket = new WebSocket("ws://localhost:8080/Meksh_/chatWeb/" + usuario + "/");
        
       socket.onmessage = function (event) {
                const encriptadito = event.data;
                const desencriptadito = desencriptar(encriptadito);
                añadirMensaje(desencriptadito, 1);
                console.log("El mensaje ha sido recibido:", encriptadito);
            };

        function envio() {
            const texto = document.getElementById("mensaje");
            const msg = texto.value.trim();

            if (msg !== "") {
                añadirMensaje(msg, 2);
                const encriptadito = encriptar(msg);
                socket.send("Soporte: " + encriptadito);
                console.log("El mensaje ha sido enviado:", encriptadito);
                texto.value = "";
                texto.focus();
            }
        }

        function añadirMensaje(message, tipo) {
            const container = document.getElementById("containsChat");
            const messagei = document.createElement("div");
            tipo = tipo.this;
            messagei.textContent = message;
            if (tipo === 1) {
                messagei.className = "recibido";
            } else if (tipo === 2) {
                messagei.className = "enviado";
            }
            container.appendChild(messagei);
        }
    </script>
    <body class="<%=tema%>">
        <header>
            <div class="navbar">
                <ul style="margin-left: auto;">
                    <li><a href="inicio.jsp" title="Ir al Inicio"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li style="color: #ffffff;">AYUDA Y CONTACTO</li>
                    <li><a href="soporte.jsp" style="margin-left: 400px;">Servicio al cliente</a></li>
                    <li><a href="inicio.jsp?logout=1" style="margin-left: 100px; margin-right: 200px;">Cerrar sesión</a></li>
                </ul>

            </div>
        </header>
        <main>
            <div class="container">
               
                <section class="box7">
                    <div class="cont1">
                        <i class="fa-solid fa-headset" style="color: #3278AB; display: flex; justify-content: left; margin-left: 20px; font-size: 20px; "></i>
                        <div>Servicio al cliente</div>
                        <iframe src="https://stack-ai.com/internal_ui/46bcccf8-5936-43e1-b87c-8eedd04de6c6/2eef2a6b-f1ca-41ca-bad7-31d01b06329a/66590e888ce38e21b4bcbaba" width="100%" height="620px" style="border: none;"></iframe>
                    </div>
                    <div class="cont2" id="containsChat">
                    </div>
                </section>
              
                <section class="box2">
                    <p class="heading">Preguntas comúnes</p>
                    <div class="faqs" id="faqContainer">
                        <details>
                            <summary>¿Por qué no tengo logros?</summary>
                            <p class="text">Es posible que haya un retraso en la actualización de los logros en tu perfil. Asegúrate de estar conectado a internet.</p>
                        </details>
                        <details>
                            <summary>¿Cómo consigo la aplicación?</summary>
                            <p class="text">Puedes descargar la aplicación desde la tienda de aplicaciones de tu dispositivo móvil. Busca el nombre de la aplicación en Google Play Store si usas un dispositivo Android, o en la App Store si tienes un dispositivo iOS.</p>
                        </details>
                        <details>
                            <summary>¿Qué hago si no guardé mi progreso?</summary>
                            <p class="text">Si tu progreso no se guardó automáticamente, verifica que estés iniciando sesión con la cuenta correcta y que tu dispositivo tenga acceso a internet para sincronizar los datos.</p>
                        </details>
                        <details>
                            <summary>¿Que hacer si no deja iniciar sesión?</summary>
                            <p class="text">Asegúrate de que estás introduciendo correctamente tus credenciales de usuario. Si has olvidado tu contraseña, utiliza la opción de "Olvidé mi contraseña" para restablecerla.</p>
                        </details>
                    </div>
                    <div id="rotateIcon" style="cursor: pointer;">
                        <i class="fa-solid fa-rotate-right" style="color: black;"> Cambiar</i>
                    </div>
                </section>
            </div>
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
        <script>
            var allQuestions = [
                {question: '¿Por qué no tengo logros?', answer: 'Es posible que haya un retraso en la actualización de los logros en tu perfil. Asegúrate de estar conectado a internet.'},
                {question: '¿Cómo consigo la aplicación?', answer: 'Puedes descargar la aplicación desde la tienda de aplicaciones de tu dispositivo móvil. Busca el nombre de la aplicación en Google Play Store si usas un dispositivo Android, o en la App Store si tienes un dispositivo iOS.'},
                {question: '¿Qué hago si no guardé mi progreso?', answer: 'Si tu progreso no se guardó automáticamente, verifica que estés iniciando sesión con la cuenta correcta y que tu dispositivo tenga acceso a internet para sincronizar los datos.'},
                {question: '¿Qué hago si no funciona el cronómetro?', answer: 'Verifica que tu dispositivo tenga acceso a internet para sincronizar los datos.'},
                {question: '¿Que hacer si no deja iniciar sesión?', answer: 'Asegúrate de que estás introduciendo correctamente tus credenciales de usuario. Si has olvidado tu contraseña, utiliza la opción de "Olvidé mi contraseña" para restablecerla.'},
                {question: '¿Qué hago si me marca error al cerrar sesión?', answer: 'Cierra la aplicación y vuelve a abrirla'},
                        // Agrega más preguntas según sea necesario
            ];

            // JavaScript para generar nuevas preguntas aleatorias al hacer clic en el icono de rotación
            document.getElementById('rotateIcon').addEventListener('click', function () {
                generateRandomQuestions();
            });

            function generateRandomQuestions() {
                var faqContainer = document.getElementById('faqContainer');
                faqContainer.innerHTML = ''; // Elimina las preguntas actuales

                // Selecciona aleatoriamente algunas preguntas del array
                var selectedQuestions = getRandomElements(allQuestions, 2); // Puedes ajustar la cantidad según tus necesidades

                // Agrega las preguntas seleccionadas
                selectedQuestions.forEach(function (qa) {
                    addNewQuestion(qa.question, qa.answer);
                });
            }

            function addNewQuestion(question, answer) {
                var faqContainer = document.getElementById('faqContainer');

                var details = document.createElement('details');
                var summary = document.createElement('summary');
                var text = document.createElement('p');

                summary.textContent = question;
                text.textContent = answer;

                details.appendChild(summary);
                details.appendChild(text);

                faqContainer.appendChild(details);
            }

            function getRandomElements(arr, num) {
                var shuffled = arr.slice(0), i = arr.length, min = i - num, temp, index;
                while (i-- > min) {
                    index = Math.floor((i + 1) * Math.random());
                    temp = shuffled[index];
                    shuffled[index] = shuffled[i];
                    shuffled[i] = temp;
                }
                return shuffled.slice(min);
            }
            function actualizarHora() {
                var ahora = new Date();
                var horas = ahora.getHours();
                var minutos = ahora.getMinutes();

                horas = horas < 10 ? "0" + horas : horas;
                minutos = minutos < 10 ? "0" + minutos : minutos;

                var horaActual = horas + ":" + minutos;

                document.getElementById("reloj").innerText = horaActual;
            }

            setInterval(actualizarHora, 1000);
            actualizarHora();
            function desencriptar(encript) {
                var desencriptada = '';
                var largo = encript.length;
                var caracter;

                for (var i = 0; i < largo; i++) {
                    caracter = encript.charAt(i);

                    switch (caracter) {
                        case 'A':
                            desencriptada += 'Q';
                            break;
                        case 'a':
                            desencriptada += 'q';
                            break;
                        case 'B':
                            desencriptada += 'G';
                            break;
                        case 'b':
                            desencriptada += 'g';
                            break;
                        case 'C':
                            desencriptada += 'D';
                            break;
                        case 'c':
                            desencriptada += 'd';
                            break;
                        case 'D':
                            desencriptada += 'E';
                            break;
                        case 'E':
                            desencriptada += '3';
                            break;
                        case 'F':
                            desencriptada += 'R';
                            break;
                        case 'G':
                            desencriptada += 'T';
                            break;
                        case 'H':
                            desencriptada += 'Y';
                            break;
                        case 'I':
                            desencriptada += '8';
                            break;
                        case 'J':
                            desencriptada += 'U';
                            break;
                        case 'K':
                            desencriptada += 'I';
                            break;
                        case 'L':
                            desencriptada += 'O';
                            break;
                        case 'M':
                            desencriptada += 'J';
                            break;
                        case 'N':
                            desencriptada += 'H';
                            break;
                        case 'O':
                            desencriptada += '9';
                            break;
                        case 'P':
                            desencriptada += '0';
                            break;
                        case 'Q':
                            desencriptada += '1';
                            break;
                        case 'R':
                            desencriptada += 'R';
                            break;
                        case 'S':
                            desencriptada += 'W';
                            break;
                        case 'T':
                            desencriptada += '5';
                            break;
                        case 'U':
                            desencriptada += '7';
                            break;
                        case 'V':
                            desencriptada += 'F';
                            break;
                        case 'W':
                            desencriptada += '2';
                            break;
                        case 'X':
                            desencriptada += 'S';
                            break;
                        case 'Y':
                            desencriptada += '6';
                            break;
                        case 'Z':
                            desencriptada += 'A';
                            break;
                        case '1':
                            desencriptada += 'Z';
                            break;
                        case '2':
                            desencriptada += 'X';
                            break;
                        case '3':
                            desencriptada += 'C';
                            break;
                        case '4':
                            desencriptada += 'V';
                            break;
                        case '5':
                            desencriptada += 'B';
                            break;
                        case '6':
                            desencriptada += 'N';
                            break;
                        case '7':
                            desencriptada += 'M';
                            break;
                        case '8':
                            desencriptada += ',';
                            break;
                        case '9':
                            desencriptada += '.';
                            break;
                        case '0':
                            desencriptada += '-';
                            break;
                        case ',':
                            desencriptada += 'K';
                            break;
                        case '.':
                            desencriptada += 'L';
                            break;
                        case '-':
                            desencriptada += 'P';
                            break;
                        case ' ':
                            desencriptada += ' ';
                            break;
                        case ':':
                            desencriptada += ':';
                            break;
                        case '#':
                            desencriptada += '#';
                            break;
                    }
                }
                    return desencriptada;
            }
            function encriptar(desencript) {
                var encriptada = '';
                var largo = desencript.length;
                var caracter;

                for (var i = 0; i < largo; i++) {
                    caracter = desencript.charAt(i);

                    switch (caracter) {
                        case 'a':
                            encriptada += 'Z';
                            break;
                        case 'b':
                            encriptada += '5';
                            break;
                        case 'c':
                            encriptada += '3';
                            break;
                        case 'd':
                            encriptada += 'C';
                            break;
                        case 'e':
                            encriptada += 'D';
                            break;
                        case 'f':
                            encriptada += 'V';
                            break;
                        case 'g':
                            encriptada += 'B';
                            break;
                        case 'h':
                            encriptada += 'N';
                            break;
                        case 'i':
                            encriptada += 'K';
                            break;
                        case 'j':
                            encriptada += 'M';
                            break;
                        case 'k':
                            encriptada += ',';
                            break;
                        case 'l':
                            encriptada += '.';
                            break;
                        case 'm':
                            encriptada += '7';
                            break;
                        case 'n':
                            encriptada += '6';
                            break;
                        case 'o':
                            encriptada += 'L';
                            break;
                        case 'p':
                            encriptada += '-';
                            break;
                        case 'q':
                            encriptada += 'A';
                            break;
                        case 'r':
                            encriptada += 'F';
                            break;
                        case 's':
                            encriptada += 'X';
                            break;
                        case 't':
                            encriptada += 'G';
                            break;
                        case 'u':
                            encriptada += 'J';
                            break;
                        case 'v':
                            encriptada += '4';
                            break;
                        case 'w':
                            encriptada += 'S';
                            break;
                        case 'x':
                            encriptada += '2';
                            break;
                        case 'y':
                            encriptada += 'H';
                            break;
                        case 'z':
                            encriptada += '1';
                            break;
                        case 'A':
                            encriptada += 'Z';
                            break;
                        case 'B':
                            encriptada += '5';
                            break;
                        case 'C':
                            encriptada += '3';
                            break;
                        case 'D':
                            encriptada += 'C';
                            break;
                        case 'E':
                            encriptada += 'D';
                            break;
                        case 'F':
                            encriptada += 'V';
                            break;
                        case 'G':
                            encriptada += 'B';
                            break;
                        case 'H':
                            encriptada += 'N';
                            break;
                        case 'I':
                            encriptada += 'K';
                            break;
                        case 'J':
                            encriptada += 'M';
                            break;
                        case 'K':
                            encriptada += ',';
                            break;
                        case 'L':
                            encriptada += '.';
                            break;
                        case 'M':
                            encriptada += '7';
                            break;
                        case 'N':
                            encriptada += '6';
                            break;
                        case 'O':
                            encriptada += 'L';
                            break;
                        case 'P':
                            encriptada += '-';
                            break;
                        case 'Q':
                            encriptada += 'A';
                            break;
                        case 'R':
                            encriptada += 'F';
                            break;
                        case 'S':
                            encriptada += 'X';
                            break;
                        case 'T':
                            encriptada += 'G';
                            break;
                        case 'U':
                            encriptada += 'J';
                            break;
                        case 'V':
                            encriptada += '4';
                            break;
                        case 'W':
                            encriptada += 'S';
                            break;
                        case 'X':
                            encriptada += '2';
                            break;
                        case 'Y':
                            encriptada += 'H';
                            break;
                        case 'Z':
                            encriptada += '1';
                            break;
                        case '1':
                            encriptada += 'Q';
                            break;
                        case '2':
                            encriptada += 'W';
                            break;
                        case '3':
                            encriptada += 'E';
                            break;
                        case '4':
                            encriptada += 'R';
                            break;
                        case '5':
                            encriptada += 'T';
                            break;
                        case '6':
                            encriptada += 'Y';
                            break;
                        case '7':
                            encriptada += 'U';
                            break;
                        case '8':
                            encriptada += 'I';
                            break;
                        case '9':
                            encriptada += 'O';
                            break;
                        case '0':
                            encriptada += 'P';
                            break;
                        case ',':
                            encriptada += '8';
                            break;
                        case '.':
                            encriptada += '9';
                            break;
                        case '-':
                            encriptada += '0';
                            break;
                        case ' ':
                            encriptada += ' ';
                            break;
                        case ':':
                            encriptada += ':';
                            break;
                        default:
                            encriptada += '#';
                    }
                }
                return encriptada;
            }
        </script>
    </body>
    <%
        if (request.getParameter("logout") != null) {
            try {
                sesion.setAttribute("tipo", 0);
                sesion.setAttribute("usu", null);
                usuario = null;
                out.println("<script>document.getElementById('usuario').value = '';</script>");

                response.sendRedirect("login.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
    %>
</html>