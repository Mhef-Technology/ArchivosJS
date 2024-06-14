<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/tarjetasStyle.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css"> <!-- Si has descargado los archivos localmente -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href='https://fonts.googleapis.com/css?family=Merriweather' rel='stylesheet'>
        <title>Meksh - Flashcards</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("usu") != null) {
                String conjunto = request.getParameter("conjunto");
                String usuario = sesion.getAttribute("usu").toString();
                String tema = sesion.getAttribute("tema").toString();
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rst = null;
                conectadita conect = new conectadita();
                con = conect.getConnection();
                String newName = "";

                if (request.getParameter("nombreTarjeta") != null) {
                    newName = request.getParameter("nombreTarjeta");
                    CallableStatement cstmt = con.prepareCall("call sp_agregarTarjeta(?,?,?)");
                    cstmt.setString(1, usuario);
                    cstmt.setString(2, conjunto);
                    cstmt.setString(3, newName);
                    cstmt.executeUpdate();
        %>
    <body onload="metodo(4)" class="<%=tema%>">
        <%
        } else {
        %>
    <body class="<%=tema%>">
        <%
            }

            pstmt = con.prepareStatement("select nombre_Usuario, nombre_Conjunto, pregunta_Tarjeta from Tarjeta inner join Conjunto on Tarjeta.idConjunto = Conjunto.idConjunto inner join Usuario on Conjunto.idUsuario = Usuario.idUsuario where nombre_Usuario = ? and nombre_Conjunto = ?;");
            pstmt.setString(1, usuario);
            pstmt.setString(2, conjunto);
            rst = pstmt.executeQuery();
        %>
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="conjuntos.jsp" title="Ir a los conjuntos"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <main>
            <div class="container">
                <div class="texto">Tarjetas de Memoria</div>
                <button class="boton" onclick="redirigirAPagina()">
                    <h2> Juegos </h2> 
                </button>
                <div class="all">
                    <table class="all2">
                        <tr class="fila 1">
                            <td>
                                <a href="#" title="Crear un nueva tarjeta en <%=conjunto%>" class="agregar">
                                    <div class="card <%=tema%> add"  onclick="guardarTarjeta('<%=conjunto%>')">
                                        <img src="img/plus-1270001_1280.png" width="80" height="80" alt="alt"/>
                                    </div>
                                </a>
                            </td>
                        <div id="tasksContainer"></div>

                        <%
                            int fila = 1;
                            int columna = 2;
                            int totTarjetas = 0;
                            while (rst.next()) {
                                if (columna >= 2 && columna <= 4) {
                                    totTarjetas++;
                        %>
                        <td>
                            <a href="flashcard.jsp?conjunto=<%=conjunto%>&tarjeta=<%=rst.getString("pregunta_Tarjeta")%>" title="Abrir tarjeta" class="abrir <%=rst.getString("pregunta_Tarjeta")%>">
                                <div class="card <%=tema%> <%=totTarjetas%>">
                                    <p class="pregunta"><%=rst.getString("pregunta_Tarjeta")%></p>
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
                            totTarjetas++;
                            fila++;
                        %>
                        <tr class="fila <%=fila%>">
                            <td>
                                <a href="flashcard.jsp?conjunto=<%=conjunto%>&tarjeta=<%=rst.getString("pregunta_Tarjeta")%>" title="Abrir tarjeta" class="abrir <%=rst.getString("pregunta_Tarjeta")%>">
                                    <div class="card <%=tema%> <%=totTarjetas%>">
                                        <p class="pregunta"><%=rst.getString("pregunta_Tarjeta")%></p>
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
            function redirigirAPagina() {
                window.location.href = 'juegos.jsp';
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="js/agregarRegistros.js"></script>
        <script type="text/javascript" src="js/infoMetodos.js"></script>
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
