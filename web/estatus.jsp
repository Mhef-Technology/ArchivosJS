<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <title>Meksh - Estatus</title>
        <link rel="stylesheet" href="css/estatusStyle.css">
        <script src="js/calendario.js" defer></script>
    </head>
    <%@ page import="javax.servlet.http.*" %>
    <%@ page import="java.io.*" %>
    <%

        java.util.Date currentDate = new java.util.Date();
        HttpSession sesion = request.getSession();;
        String usuario = null;
        Cookie loginCountCookie = null;
        Cookie lastLoginCookie = null;
        String firstLoginDate = null; // Declarar aquí para que esté en el mismo ámbito

        int loginCount = 1; // Declarar e inicializar fuera del bloque try-catch
        if (sesion.getAttribute("usu") != null) {
            try {
                usuario = (sesion.getAttribute("usu") != null) ? sesion.getAttribute("usu").toString() : "";

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
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <div class="contianer">
            <div class="calendar">
                <div class="calendar-header">
                    <span class="month-picker" id="month-picker"> May </span>
                    <div class="year-picker" id="year-picker">
                        <span class="year-change" id="pre-year">
                            <pre><</pre>
                        </span>
                        <span id="year">2020 </span>
                        <span class="year-change" id="next-year">
                            <pre>></pre>
                        </span>
                    </div>
                </div>

                <div class="calendar-body">
                    <div class="calendar-week-days">
                        <div>Dom</div>
                        <div>Lun</div>
                        <div>Mar</div>
                        <div>Mie</div>
                        <div>Jue</div>
                        <div>Vie</div>
                        <div>Sab</div>
                    </div>
                    <div class="calendar-days">
                    </div>
                </div>
                <div class="calendar-footer">
                </div>
                <div class="date-time-formate">
                    <div class="day-text-formate">Hoy</div>
                    <div class="date-time-value">
                        <div class="time-formate">02:51:20</div>
                        <div class="date-formate">23 - july - 2022</div>
                    </div>
                </div>
                <div class="month-list"></div>
            </div>
        </div>
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
</body>
<%
    // Lógica para cerrar sesión
    if (request.getParameter("logout") != null) {
        try {
            // ... (Código existente para cerrar sesión)

            // Resto del código para cerrar sesión
            sesion.setAttribute("tipo", 0);
            sesion.setAttribute("usu", null);
            usuario = null;
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
