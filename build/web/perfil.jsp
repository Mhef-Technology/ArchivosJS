<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/perfilStyle.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css"> <!-- Si has descargado los archivos localmente -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Perfil</title>
    </head>
    <%@ page import="javax.servlet.http.*" %>
    <%@ page import="java.sql.*, conexion.conectadita" %>
    <%@ page import="java.io.*" %>
    <%
        request.setCharacterEncoding("UTF-8");
        java.util.Date currentDate = new java.util.Date();
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usu") != null) {
            String usuario = null;
            int tipo = 0;
            String tema = null;
            Cookie loginCountCookie = null;
            Cookie lastLoginCookie = null;
            String firstLoginDate = null;

            int loginCount = 1;

            try {
                usuario = (sesion.getAttribute("usu") != null) ? sesion.getAttribute("usu").toString() : "";
                tipo = (Integer) sesion.getAttribute("tipo");
                tema = (sesion.getAttribute("tema") != null) ? sesion.getAttribute("tema").toString() : "";

                if (request.getParameter("nuevoModo") != null) {
                    String checks = request.getParameter("toggle");
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    if (checks != null && tema.equals("light")) {
                        sesion.setAttribute("tema", "dark");
                        tema = "dark";
                        conectadita conect = new conectadita();
                        con = conect.getConnection();
                        pstmt = con.prepareStatement("update Perfil inner join Usuario on Usuario.idUsuario = Perfil.idUsuario set tema = 'dark' where nombre_Usuario = '" + usuario + "'");
                        pstmt.executeUpdate();
                    } else if (checks == null && tema.equals("dark")) {
                        sesion.setAttribute("tema", "light");
                        tema = "light";
                        conectadita conect = new conectadita();
                        con = conect.getConnection();
                        pstmt = con.prepareStatement("update Perfil inner join Usuario on Usuario.idUsuario = Perfil.idUsuario set tema = 'light' where nombre_Usuario = '" + usuario + "'");
                        pstmt.executeUpdate();
                    }
                }

                String lastLoginCookieName = "lastLogin";

                String loginCountCookieName = "loginCount";

                if (request.getParameter("logout") == null) {
                    lastLoginCookie = new Cookie(lastLoginCookieName, currentDate.toString());
                    lastLoginCookie.setMaxAge(24 * 60 * 60); // Expira en 24 horas
                    response.addCookie(lastLoginCookie); // Agrega la cookie a la respuesta
                }

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
                loginCountCookie.setMaxAge(24 * 60 * 60);
                response.addCookie(loginCountCookie);

            } catch (Exception e) {
                e.printStackTrace();
                out.println("Excepción: " + e.getMessage());
            }
            String estatusText = "Básico";
            if (tipo == 2) {
                estatusText = "Premium";
            } else {
                estatusText = "Básico";
            }
    %>

    <body class="<%=tema%>" onload="active('<%=tema%>')">
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="inicio.jsp" title="Ir al Inicio"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <main class="<%=tema%>">
            <section class="box">
                <div class="profile">
                    <div class="banner"></div>
                    <div class="avatar" style="background-image: url('img/predeterminado.jpeg');">
                        <div class="nombre"><%=usuario%></div>
                    </div>
                    <div class="content">
                        <div class="infoPerfil">
                            <div class="racha-container">
                                <div class="racha-circle <%=tema%>" id="contador"><%= loginCount%></div>
                                <div class="day">Streak</div>
                                <div class="flame">&#128293;</div>
                            </div>
                            <div class="textinicio">
                                <p>Último inicio de sesión: <%= lastLoginCookie != null ? lastLoginCookie.getValue() : "N/A"%></p>
                                <p>Plan: <%= estatusText%></p>
                            </div>
                        </div>
                        <div class="confPerfil">
                            <form action="perfil.jsp?nuevoModo=1" method="post">
                                <div class="modo">
                                    <input type="checkbox" id="toggle" name='toggle' class="offscreen"/>
                                    <label for="toggle" class="switch" onclick="cambio()"></label>
                                </div>
                                <div class="textModo">
                                    <p>Modo oscuro</p>
                                </div>
                                <div class="aceptarModo">
                                    <button class="btn-aceptar">Aceptar</button>
                                </div>
                            </form>
                        </div>
                    </div>
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
        <script src="js/cambioModo.js"></script>
    </body>
    <%
        if (request.getParameter("logout") != null) {
            try {
                sesion.setAttribute("tipo", 0);
                sesion.setAttribute("usu", null);
                usuario = null;
                tipo = 0;
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
