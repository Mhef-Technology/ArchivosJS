<%@page import="javax.servlet.http.*" %>
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
        <title>Meksh - Soporte Técnico</title>
    </head>
    <%

        // Obtiene la fecha actual
        java.util.Date currentDate = new java.util.Date();
        // Declarar las variables fuera del bloque try-catch
        HttpSession sesion = null;
        String usuario = null;
        String tipo = null;
        Cookie loginCountCookie = null;
        Cookie lastLoginCookie = null;
        String firstLoginDate = null; // Declarar aquí para que esté en el mismo ámbito

        int loginCount = 1; // Declarar e inicializar fuera del bloque try-catch

        try {
            sesion = request.getSession();
            usuario = (sesion.getAttribute("usu") != null) ? sesion.getAttribute("usu").toString() : "";
            tipo = (sesion.getAttribute("tipo") != null) ? sesion.getAttribute("tipo").toString() : "";

            // Define el nombre de la cookie para la fecha del último inicio de sesión
            String lastLoginCookieName = "lastLogin";

            // Define el nombre de la cookie para el contador de días consecutivos de inicio de sesión
            String loginCountCookieName = "loginCount";

            // Actualiza la cookie de la fecha del último inicio de sesión (si no existe)
            if (request.getParameter("logout") == null) {
                lastLoginCookie = new Cookie(lastLoginCookieName, currentDate.toString());
                lastLoginCookie.setMaxAge(24 * 60 * 60); // Expira en 24 horas
                response.addCookie(lastLoginCookie); // Agrega la cookie a la respuesta
            }

            // Actualiza el contador de días consecutivos de inicio de sesión (si no existe)
            Cookie[] existingCookies = request.getCookies();
            if (existingCookies != null) {
                for (Cookie existingCookie : existingCookies) {
                    if (loginCountCookieName.equals(existingCookie.getName())) {
                        loginCount = Integer.parseInt(existingCookie.getValue()) + 1;
                        break;
                    }
                }
            }
            loginCountCookie = new Cookie(loginCountCookieName, String.valueOf(loginCount));
            loginCountCookie.setMaxAge(24 * 60 * 60); // Expira en 24 horas
            response.addCookie(loginCountCookie); // Agrega la cookie a la respuesta

            // Obtiene la fecha del primer inicio de sesión
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (lastLoginCookieName.equals(cookie.getName())) {
                        firstLoginDate = cookie.getValue();
                        break;
                    }
                }
            }
            // Resto del código...
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Excepción: " + e.getMessage());
        }
    %>
    <script>

    </script>
    <body>
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
                    </div>
                    <div class="cont2" id="containsChat">
                        <div id="reloj"></div>
                    </div>
                    <div class="cont3"> 
                        <div class="int"><input type="text" id="mensaje" placeholder="Escribe tu mensaje aquí"></div>
                        <button onclick="envio()">Enviar</button>
                    </div>
                </section>
                <section class="box2">
                    <p class="heading">Preguntas comúnes</p>
                    <div class="faqs" id="faqContainer">
                        <details>
                            <summary>¿Por qué no tengo logros?</summary>
                            <p class="text">Es posible que aún no hayas desbloqueado ninguno, de no ser así, ponte en contacto con nuestro soporte técnico.</p>
                        </details>
                        <details>
                            <summary>¿Cómo consigo la aplicación?</summary>
                            <p class="text">Puedes descargarla desde la página web directamente.</p>
                        </details>
                        <details>
                            <summary>¿Qué hago si no guardé mi progreso?</summary>
                            <p class="text">Puedes hablar con un agente para buscar tu resplado mas reciente y de esa manera no afectar tu progreso en gran medida.</p>
                        </details>
                        <details>
                            <summary>¿Que hacer si no deja iniciar sesión?</summary>
                            <p class="text">Verifica que estés ingresando los datos correctos y que la cuenta sea existente.</p>
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
                {question: '¿Por qué no tengo logros?', answer: 'Es posible que aún no hayas desbloqueado ninguno, de no ser así, ponte en contacto con nuestro soporte técnico.'},
                {question: '¿Cómo consigo la aplicación?', answer: 'Puedes descargarla desde la página web directamente.'},
                {question: '¿Qué hago si no guardé mi progreso?', answer: 'Puedes hablar con un agente para buscar tu resplado mas reciente y de esa manera no afectar tu progreso en gran medida.'},
                {question: '¿Qué hago si no funciona el cronómetro?', answer: 'Verifica que estés iniciando el cronómetro por primera vez.'},
                {question: '¿Que hacer si no deja iniciar sesión?', answer: 'Verifica que estés ingresando los datos correctos y que la cuenta sea existente.'},
                {question: '¿Qué hago si me marca error al cerrar sesión?', answer: 'Reporta el problema con soporte técnico, refresca la página web o ciérrala por completo.'}
            ];

            document.getElementById('rotateIcon').addEventListener('click', function () {
                generateRandomQuestions();
            });

            function generateRandomQuestions() {
                var faqContainer = document.getElementById('faqContainer');
                faqContainer.innerHTML = ''; // Elimina las preguntas actuales

                var selectedQuestions = getRandomElements(allQuestions, 3);

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

            const usuario = "<%=usuario%>";
            const socket = new WebSocket("ws://mhef.gerdoc.com:8080/Meksh_/websocketMeksh/" + usuario + "/");

            socket.onmessage = function (event) {
                const encriptadito = event.data;
                const pruebaUsuario = encriptadito.split(":");
                if (pruebaUsuario[0] !== usuario){
                    añadirMensaje(encriptadito, 1);
                    console.log("El mensaje ha sido recibido: ", encriptadito);
                }
            };

            function envio() {
                const texto = document.getElementById("mensaje");
                const msg = texto.value.trim();

                if (msg !== "") {
                    añadirMensaje(msg, 2);
                    const encriptadito = encriptar(msg);
                    socket.send(": " + encriptadito);
                    console.log("El mensaje ha sido enviado: ", encriptadito);
                    texto.value = "";
                    texto.focus();
                }
            }

            function añadirMensaje(msg, tipo) {
                const container = document.getElementById("containsChat");
                const messagei = document.createElement("div");

                if (tipo === 1) {
                    messagei.className = "recibido";
                    const msgdes = desencriptar(msg);
                    messagei.textContent = msgdes;
                } else if (tipo === 2) {
                    messagei.className = "enviado";
                    messagei.textContent = msg;
                }

                container.appendChild(messagei);
            }

            function desencriptar(encript) {
                var desencriptada = '';
                var encrB = encript.split(":");
                var largo = encrB[1].length;
                var caracter;

                for (var i = 0; i < largo; i++) {
                    caracter = encrB[1].charAt(i);

                    switch (caracter) {
                        case 'A':
                            desencriptada += 'Q';
                            break;
                        case 'B':
                            desencriptada += 'G';
                            break;
                        case 'C':
                            desencriptada += 'D';
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
                return encrB[0] + ": " + desencriptada;
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
                sesion.setAttribute("tipo", null);
                sesion.setAttribute("usu", null);
                usuario = null;
                tipo = null;
                out.println("<script>document.getElementById('usuario').value = '';</script>");

                response.sendRedirect("login.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                if (lastLoginCookie != null) {
                    response.addCookie(lastLoginCookie);
                }
                response.addCookie(loginCountCookie);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
</html>