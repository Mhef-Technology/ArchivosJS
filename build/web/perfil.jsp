
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
<%@ page import="java.io.*" %>
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


    <body>
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="inicio.jsp" title="Ir al Inicio"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="#amigos">Amigos</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <main>
            <section class="box">
                <div class="profile">
                    <div class="banner">
                       
                    </div>
                    <div class="avatar" style="background-image: url('img/predeterminado.jpeg');">
                    </div>
                    <div class="content">
                        <div class="racha-container">
                        <div class="racha-circle" id="contador"><%= loginCount %></div>
                        <div class="day">Streak</div>
                        <div class="flame">&#128293;</div>
                        </div>
                        <div class="textinicio">
                        <p>Último inicio de sesión: <%= lastLoginCookie != null ? lastLoginCookie.getValue() : "N/A" %></p>
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
        // Lógica para cerrar sesión
        if (request.getParameter("logout") != null) {
            try {
                // ... (Código existente para cerrar sesión)

                // Resto del código para cerrar sesión
                sesion.setAttribute("tipo", null);
                sesion.setAttribute("usu", null);
                usuario = null;
                tipo = null;
                out.println("<script>document.getElementById('usuario').value = '';</script>");

                // Redirige al usuario después de cerrar sesión
                response.sendRedirect("login.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // Añade las cookies a la respuesta
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
