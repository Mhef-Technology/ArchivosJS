<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css//materias/bio.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Historia</title>
    </head>
    <%
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usu") != null) {
            String usuario = sesion.getAttribute("usu").toString();
            String tema = sesion.getAttribute("tema").toString();
    %>
    <body class="<%=tema%>">
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="info.jsp" title="Ir al menú de información"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <main>
            <div class="container2">
                <header>
                    <h1>Historia</h1>
                </header>
                <section class="content">
                    <nav>
                        <ul>
                            <li><a class="espaciado" href="#prehistoria"><h2>1. Prehistoria</h2></a></li>
                            <li><a class="espaciado" href="#edad_antigua"><h2>2. Edad Antigua</h2></a></li>
                            <li><a class="espaciado" href="#edad_media"><h2>3. Edad Media</h2></a></li>
                            <li><a class="espaciado" href="#edad_moderna"><h2>4. Edad Moderna</h2></a></li>
                            <li><a class="espaciado" href="#edad_contemporanea"><h2>5. Edad Contemporánea</h2></a></li>
                        </ul>
                    </nav>
                    <article class="espaciado" id="prehistoria">
                        <h2>1. Prehistoria</h2>
                        <h3>Paleolítico</h3>
                        <p>Concepto: Es el periodo más antiguo de la historia humana, caracterizado por el uso de herramientas de piedra.</p>
                        <p>Ejemplo: Las pinturas rupestres de Altamira.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Caza y recolección</li>
                            <li>Sociedades nómadas</li>
                        </ul>
                        <h3>Neolítico</h3>
                        <p>Concepto: Periodo caracterizado por el desarrollo de la agricultura y la domesticación de animales.</p>
                        <p>Ejemplo: Los primeros asentamientos permanentes como Çatalhöyük.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Agricultura y ganadería</li>
                            <li>Sociedades sedentarias</li>
                        </ul>
                    </article>
                    <img src="img/materias/h1.jpeg" width="250" height="250" alt="memorama"/>
                    <article class="espaciado" id="edad_antigua">
                        <h2>2. Edad Antigua</h2>
                        <h3>Civilizaciones Mesopotámicas</h3>
                        <p>Concepto: Civilizaciones que se desarrollaron en el área del río Tigris y Éufrates.</p>
                        <p>Ejemplo: Sumerios, babilonios y asirios.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Desarrollo de la escritura cuneiforme</li>
                            <li>Códigos de leyes como el Código de Hammurabi</li>
                        </ul>
                        <h3>Civilización Egipcia</h3>
                        <p>Concepto: Civilización que se desarrolló a lo largo del río Nilo.</p>
                        <p>Ejemplo: Las pirámides de Giza.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Escritura jeroglífica</li>
                            <li>Construcción de monumentos</li>
                        </ul>
                    </article>
                    <img src="img/materias/h2.jpeg" width="250" height="250" alt="memorama"/>
                    <article class="espaciado" id="edad_media">
                        <h2>3. Edad Media</h2>
                        <h3>Imperio Bizantino</h3>
                        <p>Concepto: Imperio romano de Oriente, que perduró tras la caída del Imperio romano de Occidente.</p>
                        <p>Ejemplo: La ciudad de Constantinopla.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Cultura grecorromana</li>
                            <li>Influencia cristiana ortodoxa</li>
                        </ul>
                        <h3>Feudalismo</h3>
                        <p>Concepto: Sistema socioeconómico basado en la posesión de tierras y relaciones de vasallaje.</p>
                        <p>Ejemplo: Los señoríos medievales.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Estructura jerárquica</li>
                            <li>Economía agrícola</li>
                        </ul>
                    </article>
                    <article class="espaciado" id="edad_moderna">
                        <img src="img/materias/h4.jpeg" width="250" height="250" alt="memorama"/>
                        <h2>4. Edad Moderna</h2>
                        <h3>Renacimiento</h3>
                        <p>Concepto: Movimiento cultural que revivió el interés por el arte y la ciencia de la antigüedad clásica.</p>
                        <p>Ejemplo: Obras de artistas como Leonardo da Vinci y Miguel Ángel.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Humanismo</li>
                            <li>Desarrollo de las artes y ciencias</li>
                        </ul>
                        <h3>Revolución Científica</h3>
                        <p>Concepto: Período de grandes avances en el conocimiento científico.</p>
                        <p>Ejemplo: Trabajos de científicos como Galileo Galilei y Isaac Newton.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Experimentación y observación</li>
                            <li>Formulación de leyes naturales</li>
                        </ul>
                    </article>
                    <article class="espaciado" id="edad_contemporanea">
                        <img src="img/materias/h3.jpeg" width="250" height="250" alt="memorama"/>
                        <h2>5. Edad Contemporánea</h2>
                        <h3>Revolución Francesa</h3>
                        <p>Concepto: Movimiento revolucionario que llevó al derrocamiento de la monarquía en Francia y proclamación de la República.</p>
                        <p>Ejemplo: La toma de la Bastilla.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Libertad, igualdad y fraternidad</li>
                            <li>Fin del Antiguo Régimen</li>
                        </ul>
                        <h3>Revolución Industrial</h3>
                        <p>Concepto: Proceso de transformación económica, social y tecnológica iniciado en el siglo XVIII.</p>
                        <p>Ejemplo: Desarrollo de la maquinaria y las fábricas.</p>
                        <h4>Características</h4>
                        <ul>
                            <li>Urbanización</li>
                            <li>Cambio en los sistemas de producción</li>
                        </ul>
                    </article>
                    <article class="espaciado" id="recursos">
                        <h3>Libros Recomendados</h3>
                        <p>"Breve Historia del Mundo" de Ernst Gombrich</p>
                        <p>"Historia del Siglo XX" de Eric Hobsbawm</p>
                        <p>"Guerra y Paz" de Lev Tolstói</p>
                        <p>"Los Orígenes del Totalitarismo" de Hannah Arendt</p>
                        <p>"La Historia de Roma" de Theodor Mommsen</p>
                        <p>"Historia de la Revolución Rusa" de León Trotsky</p>
                        <p>"El Declive de Occidente" de Oswald Spengler</p>
                        <p>"Historia Económica Mundial" de Angus Maddison</p>

                        <h3>Enlaces a Sitios Educativos</h3>

                        <h3>Historia Antigua</h3>
                        <ul>
                            <li><a href="https://www.ancient.eu/" target="_blank">Ancient History Encyclopedia</a> - Recurso completo sobre la historia antigua, cubriendo diversas civilizaciones y períodos.</li>
                        </ul>

                        <h3>Historia Medieval</h3>
                        <ul>
                            <li><a href="https://sourcebooks.fordham.edu/sbook.asp" target="_blank">Internet Medieval Sourcebook</a> - Colección de textos e información sobre la Edad Media.</li>
                        </ul>

                        <h3>Historia Moderna</h3>
                        <ul>
                            <li><a href="https://www.history.com/" target="_blank">History.com</a> - Sitio con artículos y videos sobre eventos históricos y figuras clave de la historia moderna.</li>
                            <li><a href="https://www.bbc.co.uk/history" target="_blank">BBC History</a> - Amplia gama de recursos históricos, incluyendo artículos, videos y documentales sobre la historia mundial.</li>
                        </ul>

                        <h3>Foros y Comunidades</h3>
                        <ul>
                            <li><a href="https://history.stackexchange.com/" target="_blank">History Stack Exchange</a> - Foro de preguntas y respuestas sobre temas específicos de historia.</li>
                            <li><a href="https://www.reddit.com/r/history/" target="_blank">Reddit - History</a> - Comunidad activa donde se discuten una amplia variedad de temas históricos.</li>
                        </ul>

                        <h3>Aplicaciones y Herramientas en Línea</h3>
                        <p>Software y herramientas para aprender y explorar la historia.</p>

                    </article>
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
                    <button name="boton-continuar" id="boton-continuar" onclick="window.location.href = 'login.jsp';"><-- Regresar</button>
                </section>
            </main>
        </body>
    </html>
    <%
        }
    %>
</html>
