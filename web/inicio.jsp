<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexión.conectadita" %>
<!DOCTYPE html>
<html id="box">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/inicioStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Home</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("usu").toString();
            String tipo = sesion.getAttribute("tipo").toString();
        %>
        <div class="navbar">
            <ul>
                <li><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></li>
                <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                <li><a href="logros.jsp">Logros</a></li>
                <li><a href="#amigos">Amigos</a></li>
                <li><a href="estatus.jsp">Estatus</a></li>
                <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
            </ul>
        </div>
        <div class="texto1">
            <h1>Métodos de estudio</h1>
        </div>
        <div class="texto2">
            <h3>Selecciona el método a utilizar</h3>
        </div>
        <section class="container" >
            <span id="left-arrow" class="arrow">&lsaquo;</span>
            <span id="right-arrow" class="arrow">&rsaquo;</span>
            <div class="slider" id="slider">
                <div class="box">
                    <div class="titleP">
                        <div class="imagP">
                            <img src="img/pomodoro.jpeg" width="115" height="115" alt="pomodoro"/>
                        </div>
                        <div class="nomP">
                            <h4>Pomodoro</h4>
                        </div>
                    </div>
                    <div class="infoP">
                        <a href="#" onclick="metodo(1)">Información sobre el método</a>
                    </div>
                    <div class="empezarP">
                        <a href="pomodoro.jsp" onclick="">Iniciar</a>
                    </div>
                </div>
                <div class="box center">
                    <div class="titleF">
                        <div class="imagF">
                            <img src="img/Flashcards.png" width="115" height="115" alt="flashcards"/>
                        </div>
                        <div class="nomF">
                            <h4>Flashcards</h4>
                        </div>
                    </div>
                    <div class="infoF">
                        <a href="#" onclick="metodo(2)">Información sobre el método</a>
                    </div>
                    <div class="empezarF">
                        <a href="conjuntos.jsp" onclick="">Iniciar</a>
                    </div>
                </div>
                <div class="box">
                    <div class="titleC">
                        <div class="imagC">
                            <img src="img/Cornell.png" width="115" height="115" alt="Cornell"/>
                        </div>
                        <div class="nomC">
                            <h4>Cornell</h4>
                        </div>
                    </div>
                    <div class="infoC">
                        <a href="#" onclick="metodo(3)">Información sobre el método</a>
                    </div>
                    <div class="empezarC">
                        <a href="hojas.jsp" onclick="">Iniciar</a>
                    </div>
                </div>
                <div class="box dummy"></div>
            </div>
        </section>
        <script src="js/metodoSlide.js"></script>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="js/infoMetodos.js"></script>
        <%
            if (request.getParameter("logout") != null) {
                sesion.setAttribute("tipo", null);
                sesion.setAttribute("usu", null);
                usuario = null;
                tipo = null;
                out.println("<script>document.getElementById('usuario').value = '';</script>");
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
