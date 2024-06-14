<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/info.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Información Extra</title>
    </head>
    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usu") != null) {
            String usuario = sesion.getAttribute("usu").toString();
            String tema = sesion.getAttribute("tema").toString();
    %>
    <body class="<%=tema%>">
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="hojas.jsp" title="Ir a las Hojas"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <main>
            <div class="container40">
                <h1>Materias</h1>
                <div class="img"> 
                    <img src="img/espanol.png" alt="Quizz"  width="250" height="250" class="left-image">
                </div>
                <div class="img1"> 
                    <img src="img/mate.jpg" alt="Quizz"  width="250" height="250" class="left-image">
                </div>
                <div class="img2"> 
                    <img src="img/historia.jpg" width="250" height="250" alt="memorama"/>
                </div>
                <div class="img3"> 
                    <img src="img/quimica.jpg" alt="Quizz"  width="250" height="250" class="left-image">
                </div>
                <div class="img4"> 
                    <img src="img/biolo.jpeg" width="250" height="250" alt="memorama"/>
                </div>
                <div class="img5"> 
                    <img src="img/geo.jpg" alt="Quizz"  width="250" height="250">
                </div>
                <div class="img6"> 
                    <img src="img/fisica.png" width="250" height="250" alt="fisica"/>
                </div>
                <div id="tasksContainer"></div>
                <div class="textt">
                    <h2>Español</h2>
                </div>
                <button class="button" onclick="cambiarPagina()"><h3>Iniciar</h3></button>
                <h2 class="textt1">Matematicas</h2>
                <button class="button1" onclick="cambiarPagina1()"><h3>Iniciar</h3></button>
                <h2 class="textt2">Historia</h2>
                <button class="button2" onclick="cambiarPagina2()"><h3>Iniciar</h3></button>
                <h2 class="textt3">Geografia</h2>
                <button class="button3" onclick="cambiarPagina3()"><h3>Iniciar</h3></button>
                <h2 class="textt4">Biología</h2>
                <button class="button4" onclick="cambiarPagina4()"><h3>Iniciar</h3></button>
                <h2 class="textt5">Quimica</h2>
                <button class="button5" onclick="cambiarPagina5()"><h3>Iniciar</h3></button>
                <h2 class="textt6">Fisica</h2>
                <button class="button6" onclick="cambiarPagina6()"><h3>Iniciar</h3></button>
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
            function cambiarPagina() {
                window.location.href = 'espanol.jsp';
            }
            function cambiarPagina1() {
                window.location.href = 'mate.jsp';
            }
            function cambiarPagina2() {
                window.location.href = 'historia.jsp';
            }
            function cambiarPagina3() {
                window.location.href = 'geo.jsp';
            }
            function cambiarPagina4() {
                window.location.href = 'bio.jsp';
            }
            function cambiarPagina5() {
                window.location.href = 'quimica.jsp';
            }
            function cambiarPagina6() {
                window.location.href = 'fisica.jsp';
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="js/logicaPomodoro.js"></script>
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
                    <button class="buttonx" name="boton-continuar" id="boton-continuar" onclick="window.location.href = 'login.jsp';"><-- Regresar</button>
                </section>
            </main>
        </body>
    </html>
    <%
        }
    %>
</html>
