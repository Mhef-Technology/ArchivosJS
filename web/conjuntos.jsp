<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita, conexion.PreguntaRespuestaServlet" %>
<%@page import="javax.servlet.http.*" %>
<%@page session="true"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/conjuntosStyle.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css"> <!-- Si has descargado los archivos localmente -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href='https://fonts.googleapis.com/css?family=Merriweather' rel='stylesheet'>
        <title>Meksh - Flashcards</title>
    </head>
    <%
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usu") != null) {
            String usuario = sesion.getAttribute("usu").toString();
            String tema = sesion.getAttribute("tema").toString();
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rst = null;
            conectadita conect = new conectadita();
            con = conect.getConnection();
            String newName = "";
            if (request.getParameter("nombreConjunto") != null) {
                newName = request.getParameter("nombreConjunto");
                CallableStatement cstmt = con.prepareCall("call sp_agregarConjunto(?,?)");
                cstmt.setString(1, usuario);
                cstmt.setString(2, newName);
                cstmt.execute();
                ResultSet rst2 = cstmt.getResultSet();
                rst2.next();
                if (rst2.getString("mensaje").equals("n")) {
    %>
    <body onload="metodo(10)" class="<%=tema%>">
        <%
        } else if (rst2.getString("mensaje").equals("s")) {
            CallableStatement cstmt2 = con.prepareCall("call sp_agregarLogros(?,?)");
            cstmt2.setString(1, usuario);
            cstmt2.setString(2, "Flash-Inicia");
            cstmt2.execute();
            ResultSet rst3 = cstmt2.getResultSet();
            rst3.next();
            if (rst3.getString("mensaje").equals("s")) {
        %>
    <body onload="logro(1, 1)" class="<%=tema%>">
        <%
        } else if (rst3.getString("mensaje").equals("n")) {
        %>
    <body onload="metodo(4)" class="<%=tema%>">
        <%
        } else if (rst3.getString("mensaje").equals("x")) {
        %>
    <body onload="logro(1, 2)" class="<%=tema%>">
        <%
                }
                cstmt2.close();
            }
            cstmt.close();
        } else if (request.getParameter("generado") != null) {
        %>
    <body onload="metodo(4)" class="<%=tema%>">
        <%
        } else {
        %>
    <body class="<%=tema%>">
        <%
            }

            pstmt = con.prepareStatement("select nombre_Usuario, idConjunto, Conjunto.idUsuario, nombre_Conjunto, date_format(fechaCreacion_Conjunto, '%d-%m-%Y') fechaCreacionConjunto, date_format(ultimaModificacion_Conjunto, '%d:%m:%Y') fechaUltimaModifConjunto, time_format(ultimaModificacion_Conjunto, '%H:%i:%s') horaUltimaModifConjunto from Conjunto inner join Usuario on Conjunto.idUsuario = Usuario.idUsuario where nombre_Usuario = ?;");
            pstmt.setString(1, usuario);
            rst = pstmt.executeQuery();
        %>
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="inicio.jsp" title="Ir al Inicio"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <div class="all">
            <div class="texto">Conjuntos de Tarjetas de Memoria</div>
            <table class="all2">
                <tr class="fila 1">
                    <td>
                        <a href="#" title="Crear un nuevo conjunto de Flashcards" class="agregar">
                            <div class="set <%=tema%> add" onclick="guardarConjunto()">
                                <img src="img/plus-1270001_1280.png" width="80" height="80" alt="agregar"/>
                            </div>
                        </a>
                    </td>
                    <%
                        int fila = 1;
                        int columna = 2;
                        int totConjuntos = 0;
                        while (rst.next()) {
                            if (columna >= 2 && columna <= 4) {
                                totConjuntos++;
                    %>
                    <td>
                        <a href="tarjetas.jsp?conjunto=<%=rst.getString("nombre_Conjunto")%>" title="Abrir conjunto" class="abrir <%=rst.getString("nombre_Conjunto")%>">
                            <div class="set <%=tema%> <%=totConjuntos%>">
                                <p class="nombre"><%=rst.getString("nombre_Conjunto")%></p>
                                <p class="fechaC">Fecha de creación:</p>
                                <p class="creacion"><%=rst.getString("fechaCreacionConjunto")%></p>
                                <p class="fechaU">Última modificación:</p>
                                <p class="fechaUltima"><%=rst.getString("fechaUltimaModifConjunto")%></p>
                                <p class="horaUltima">A las <%=rst.getString("horaUltimaModifConjunto")%></p>
                            </div>
                        </a>
                    </td>
                    <%
                        if (columna == 4) {
                    %>
                </tr>
                <%
                        columna = 1;
                    } else {
                        columna++;
                    }
                } else if (columna == 1) {
                    columna++;
                    totConjuntos++;
                    fila++;
                %>
                <tr class="fila <%=fila%>">
                    <td>
                        <a href="tarjetas.jsp?conjunto=<%=rst.getString("nombre_Conjunto")%>" title="Abrir conjunto" class="abrir <%=rst.getString("nombre_Conjunto")%>">
                            <div class="set <%=tema%> <%=totConjuntos%>">
                                <p class="nombre"><%=rst.getString("nombre_Conjunto")%></p>
                                <p class="fechaC">Fecha de creación:</p>
                                <p class="creacion"><%=rst.getString("fechaCreacionConjunto")%></p>
                                <p class="fechaU">Última modificación:</p>
                                <p class="fechaUltima"><%=rst.getString("fechaUltimaModifConjunto")%></p>
                                <p class="horaUltima">A las <%=rst.getString("horaUltimaModifConjunto")%></p>
                            </div>
                        </a>
                    </td>
                    <%
                            }
                        }
                    %>
                </tr>
            </table>
        </div>
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
                        <ul>
                            <li><p class="tit2">¿Necesitas ayuda?</p></li>
                            <li><a href="soporte.jsp"><i class="fa-solid fa-headset" style="color: #ffffff; display: flex; justify-content: left; margin-left: 20px; font-size: 20px; "></i></a></li>
                            <li><a href="chatbot.jsp"><i class="fa-solid fa-robot" style="color: #ffffff; display: flex; justify-content: left; margin-left: 20px; font-size: 20px; "></i></a></li>
                        </ul>
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
            let preguntasRespuestas = [];

            async function generarQuiz(tema) {
                const usuario = "<%=usuario%>";
                console.log(tema);
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
                        messages: [{"role": "user", "content": 'Elabora una lista de 5 preguntas para un quiz sobre el tema ' + tema + ' con sus respuestas.'}]
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
                    window.location.href = 'conjuntos.jsp?generado=1';
                } else {
                    console.log('No se pudieron generar las preguntas.');
                }
            }
            async function enviarPreguntaRespuesta(tema, pregunta, respuesta, usuario, vez) {
                const response = await fetch('http://mhef.gerdoc.com:9080/Meksh_/pregunta-respuesta', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({tema, pregunta, respuesta, usuario, vez})
                });

                if (!response.ok) {
                    console.error('Error al enviar pregunta y respuesta al servidor.');
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="js/agregarRegistros.js"></script>
        <script type="text/javascript" src="js/infoMetodos.js"></script>
        <script type="text/javascript" src="js/genera.js"></script>
    </body>
    <%
    } else {
    %>
    <html class="fail">
        <body class="failbody">
            <main>
                <section class="box">
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
