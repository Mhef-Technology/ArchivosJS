<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css//materias/bio.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Geografía</title>
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
            <div class="container7">
                <header>
                    <h1>Geografía</h1>
                </header>
                <section class="content">
                    <nav>
                        <ul>
                            <li><a class="espaciado" href="#geografia_fisica"><h2>Geografía Física</h2></a></li>
                            <li><a class="espaciado" href="#geografia_humana"><h2>Geografía Humana</h2></a></li>
                            <li><a class="espaciado" href="#herramientas"><h2>Herramientas y Métodos</h2></a></li>
                            <li><a class="espaciado" href="#importancia"><h2>Importancia de la Geografía</h2></a></li>
                        </ul>
                    </nav>
                    <article class="espaciado" id="geografia_fisica">
                        <h2>1. Geografía Física</h2>
                        <h3>Relieve</h3>
                        <p><strong>Montañas:</strong> Ejemplo: Los Andes en América del Sur, que influyen en el clima, la vegetación y la vida humana en sus alrededores.</p>
                        <p><strong>Valles:</strong> Ejemplo: El Valle del Nilo en Egipto, una región fértil que ha sustentado civilizaciones durante milenios.</p>
                        <p><strong>Mesetas:</strong> Ejemplo: La Meseta Central en España, que afecta la climatología y la agricultura de la región.</p>
                        <p><strong>Llanuras:</strong> Ejemplo: Las Grandes Llanuras en Norteamérica, que son importantes para la agricultura y la ganadería.</p>
                        <h3>Clima</h3>
                        <p><strong>Clima Tropical:</strong> Caracterizado por temperaturas altas y lluvias abundantes todo el año, como en el Amazonas.</p>
                        <p><strong>Clima Árido:</strong> Caracterizado por escasas precipitaciones, como en el Desierto del Sahara.</p>
                        <p><strong>Clima Templado:</strong> Con estaciones bien definidas, como en Europa occidental.</p>
                        <p><strong>Clima Polar:</strong> Con temperaturas extremadamente bajas y hielo permanente, como en la Antártida.</p>
                        <h3>Hidrología</h3>
                        <p><strong>Ríos:</strong> Ejemplo: El río Amazonas, el más caudaloso del mundo, esencial para la biodiversidad y la economía regional.</p>
                        <p><strong>Lagos:</strong> Ejemplo: El Lago Victoria en África, una fuente vital de agua y recursos para millones de personas.</p>
                        <p><strong>Océanos:</strong> Ejemplo: El Océano Pacífico, que cubre la mayor parte de la superficie terrestre y regula el clima global.</p>
                        <p><strong>Glaciares:</strong> Ejemplo: Los glaciares en Groenlandia, que actúan como indicadores del cambio climático.</p>
                        <h3>Biogeografía</h3>
                        <p><strong>Ecosistemas Terrestres:</strong> Ejemplo: La Selva Amazónica, que alberga una vasta biodiversidad y juega un papel crucial en la regulación del clima.</p>
                        <p><strong>Ecosistemas Marinos:</strong> Ejemplo: Los arrecifes de coral, que son hábitats ricos en biodiversidad y protectores de las costas.</p>
                        <p><strong>Zonas de Transición:</strong> Ejemplo: Las zonas ecotonales, donde se encuentran diferentes tipos de vegetación y fauna, como las sabanas.</p>
                    </article>
                    <img src="img/materias/g1.jpeg" width="250" height="250" alt="Geografía Física"/>
                    <article class="espaciado" id="geografia_humana">
                        <h2>2. Geografía Humana</h2>
                        <h3>Demografía</h3>
                        <p><strong>Crecimiento Poblacional:</strong> Ejemplo: China e India, países con las mayores poblaciones del mundo.</p>
                        <p><strong>Migración:</strong> Ejemplo: La migración desde Siria a Europa debido a conflictos armados.</p>
                        <p><strong>Urbanización:</strong> Ejemplo: El rápido crecimiento de ciudades como Lagos en Nigeria.</p>
                        <h3>Cultural</h3>
                        <p><strong>Lenguas:</strong> Ejemplo: La diversidad lingüística en la India, con cientos de lenguas y dialectos.</p>
                        <p><strong>Religiones:</strong> Ejemplo: La diversidad religiosa en Jerusalén, un punto de encuentro de judaísmo, cristianismo e islam.</p>
                        <p><strong>Tradiciones:</strong> Ejemplo: Las festividades tradicionales en Japón, como el Hanami (floración del cerezo).</p>
                        <h3>Económica</h3>
                        <p><strong>Recursos Naturales:</strong> Ejemplo: El petróleo en Oriente Medio, que ha transformado la economía de la región.</p>
                        <p><strong>Industria:</strong> Ejemplo: El cinturón industrial del noreste de Estados Unidos, conocido como el Rust Belt.</p>
                        <p><strong>Agricultura:</strong> Ejemplo: Las plantaciones de café en Colombia y su impacto en la economía local.</p>
                        <h3>Política</h3>
                        <p><strong>Fronteras:</strong> Ejemplo: La frontera entre Estados Unidos y México, una de las más transitadas y controvertidas del mundo.</p>
                        <p><strong>Territorios Disputados:</strong> Ejemplo: La región de Cachemira, disputada entre India y Pakistán.</p>
                        <p><strong>Geopolítica:</strong> Ejemplo: El papel estratégico del Estrecho de Ormuz en el transporte mundial de petróleo.</p>
                    </article>
                    <img src="img/materias/g2.jpeg" width="250" height="250" alt="Geografía Humana"/>
                    <article class="espaciado" id="herramientas">
                        <h2>3. Herramientas y Métodos en Geografía</h2>
                        <h3>Cartografía</h3>
                        <p><strong>Mapas Topográficos:</strong> Representan el relieve y la altitud del terreno, utilizados para la planificación urbana y la ingeniería.</p>
                        <p><strong>Mapas Temáticos:</strong> Ilustran datos específicos como la distribución de la población o las zonas climáticas.</p>
                        <h3>Sistemas de Información Geográfica (SIG)</h3>
                        <p><strong>Análisis Espacial:</strong> Permite estudiar la distribución de fenómenos y prever patrones futuros.</p>
                        <p><strong>Gestión de Datos:</strong> Facilita la administración de información geográfica para proyectos de infraestructura y conservación.</p>
                        <h3>Teledetección</h3>
                        <p><strong>Satélites Meteorológicos:</strong> Monitorizan el clima y los cambios ambientales en tiempo real.</p>
                        <p><strong>Drones:</strong> Utilizados para cartografía detallada y monitoreo de cultivos.</p>
                    </article>
                    <img src="img/materias/g3.jpeg" width="250" height="250" alt="Herramientas y Métodos"/>
                    <article class="espaciado" id="importancia">
                        <h2>4. Importancia de la Geografía</h2>
                        <p>La geografía es esencial para comprender y abordar desafíos globales como el cambio climático, la urbanización descontrolada, la gestión sostenible de recursos y la mitigación de desastres naturales. Además, proporciona conocimientos fundamentales para la toma de decisiones en políticas públicas, desarrollo económico, conservación del medio ambiente y planificación territorial.</p>
                    </article>
                    <article class="espaciado" id="recursos">
                        <h2>15. Recursos y Enlaces Útiles</h2>
                        <h3>Libros Recomendados</h3>
                        <p>"Geografía Física" de Robert E. Gabler, James F. Petersen y L. Michael Trapasso</p>
                        <p>"Geografía Humana" de Mark C. Schug, Richard G. Boehm</p>
                        <p>"Geografía Mundial" de Harm J. De Blij y Peter O. Muller</p>
                        <p>"Geografía de los Paisajes" de Carl O. Sauer</p>
                        <p>"Geografía Económica" de Neil Coe, Philip Kelly y Henry W.C. Yeung</p>
                        <p>"Geografía Urbana" de Michael Pacione</p>
                        <p>"Geografía y Género" de Linda McDowell</p>
                        <p>"Geografía Regional" de Alexander B. Murphy</p>
                        h3>Enlaces a Sitios Educativos</h3>
                        <h3>Geografía Física</h3>
                        <ul>
                            <li><a href="https://www.physicalgeography.net/" target="_blank">Physical Geography</a> - Recurso completo sobre los principios y conceptos de la geografía física.</li>
                        </ul>

                        <h3>Geografía Humana</h3>
                        <ul>
                            <li><a href="http://geography.about.com/" target="_blank">About Geography</a> - Textos y recursos sobre geografía humana y otros temas relacionados.</li>
                        </ul>

                        <h3>Ejercicios y Problemas</h3>
                        <ul>
                            <li><a href="https://www.nationalgeographic.org/education/" target="_blank">National Geographic Education</a> - Biblioteca en línea de recursos educativos, abarca todos los niveles y temas de geografía.</li>
                            <li><a href="https://www.khanacademy.org/humanities/geography" target="_blank">Khan Academy - Geography</a> - Videos educativos y ejercicios sobre geografía mundial.</li>
                        </ul>

                        <h3>Foros y Comunidades</h3>
                        <ul>
                            <li><a href="https://geography.stackexchange.com/" target="_blank">Geography Stack Exchange</a> - Foro de preguntas y respuestas sobre temas específicos de geografía.</li>
                            <li><a href="https://www.reddit.com/r/geography/" target="_blank">Reddit - Geography</a> - Comunidad activa donde se discuten una amplia variedad de temas de geografía.</li>
                        </ul>
                        <h3>Aplicaciones y Herramientas en Línea</h3>
                        <p>Software y herramientas para aprender y practicar geografía.</p>
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
