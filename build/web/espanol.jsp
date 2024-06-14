<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css//materias/bio.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Español</title>
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
        <main><body>
                <div class="container10">
                    <header>
                        <h1>Español</h1>
                    </header>
                    <section class="content">
                        <nav>
                            <ul>
                                <li><a class="espaciado" href="#introduccion"><h2>Introducción al Español</h2></a></li>
                                <li><a class="espaciado" href="#alfabeto"><h2>El Alfabeto Español</h2></a></li>
                                <li><a class="espaciado" href="#pronunciacion"><h2>Pronunciación y Acentuación</h2></a></li>
                                <li><a class="espaciado" href="#sustantivos"><h2>Sustantivos y Artículos</h2></a></li>
                                <li><a class="espaciado" href="#adjetivos"><h2>Adjetivos</h2></a></li>
                                <li><a class="espaciado" href="#verbos"><h2>Verbos</h2></a></li>
                                <li><a class="espaciado" href="#pronombres"><h2>Pronombres</h2></a></li>
                                <li><a class="espaciado" href="#adverbios"><h2>Adverbios</h2></a></li>
                                <li><a class="espaciado" href="#preposiciones"><h2>Preposiciones</h2></a></li>
                                <li><a class="espaciado" href="#conjunciones"><h2>Conjunciones</h2></a></li>
                                <li><a class="espaciado" href="#sintaxis"><h2>Sintaxis</h2></a></li>
                                <li><a class="espaciado" href="#puntuacion"><h2>Puntuación</h2></a></li>
                                <li><a class="espaciado" href="#concordancia"><h2>Concordancia</h2></a></li>
                            </ul>
                        </nav>
                        <article class="espaciado" id="introduccion">
                            <h2>1. Introducción al Español</h2>
                            <p>El español es una lengua romance que evolucionó del latín vulgar. Es la lengua oficial de 21 países y es hablada por más de 500 millones de personas. Su gramática es compleja debido a su rica conjugación verbal y su sistema de género y número.</p>
                        </article>
                        <article class="espaciado" id="alfabeto">
                            <h2>2. El Alfabeto Español</h2>
                            <h3>Letras y Sonidos</h3>
                            <p>El alfabeto consta de 27 letras, cada una con un sonido específico. La letra 'ñ' es única al español.</p>
                            <ul>
                                <li>A: /a/</li>
                                <li>B: /be/</li>
                                <li>C: /ce/ (ante 'a', 'o', 'u' suena /k/, y ante 'e', 'i' suena /θ/ o /s/ dependiendo del dialecto).</li>
                            </ul>
                            <h3>Dígrafos</h3>
                            <p>Combinaciones de dos letras que representan un solo sonido:</p>
                            <ul>
                                <li>CH: /ʧ/ como en "chico".</li>
                                <li>LL: /ʝ/ o /ʎ/ como en "llave".</li>
                            </ul>
                        </article>
                        <img src="img/materias/esp.png" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="pronunciacion">
                            <h2>3. Pronunciación y Acentuación</h2>
                            <h3>Acentuación</h3>
                            <p>Reglas de cómo y cuándo poner una tilde en las palabras.</p>
                            <ul>
                                <li>Agudas: Llevan tilde si terminan en vocal, 'n' o 's'. Ejemplo: canción, sofá.</li>
                                <li>Llanas: Llevan tilde si NO terminan en vocal, 'n' o 's'. Ejemplo: árbol, lápiz.</li>
                                <li>Esdrújulas: Siempre llevan tilde. Ejemplo: teléfono, música.</li>
                            </ul>
                            <h3>Diptongos e Hiatos</h3>
                            <p>Diptongos: Combinación de una vocal cerrada átona y una vocal abierta o dos vocales cerradas diferentes. Ejemplo: tierra, ciudad.</p>
                            <p>Hiatos: Dos vocales fuertes juntas o una vocal fuerte y una cerrada tónica. Ejemplo: aéreo, país.</p>
                        </article>
                        <article class="espaciado" id="sustantivos">
                            <h2>4. Sustantivos y Artículos</h2>
                            <h3>Género</h3>
                            <p>Los sustantivos pueden ser masculinos o femeninos.</p>
                            <ul>
                                <li>Masculino: Normalmente terminan en -o. Ejemplo: el libro.</li>
                                <li>Femenino: Normalmente terminan en -a. Ejemplo: la mesa.</li>
                                <li>Excepciones: el día (masculino), la mano (femenino).</li>
                            </ul>
                            <h3>Número</h3>
                            <p>Los sustantivos pueden ser singulares o plurales.</p>
                            <ul>
                                <li>Singular: Indica una sola entidad. Ejemplo: el perro.</li>
                                <li>Plural: Añade -s o -es. Ejemplo: los perros, las flores.</li>
                            </ul>
                            <h3>Artículos Definidos e Indefinidos</h3>
                            <p>Definidos: Indican algo específico. Ejemplo: el, la, los, las. Ejemplo: El coche, la casa, los libros, las flores.</p>
                            <p>Indefinidos: Indican algo no específico. Ejemplo: un, una, unos, unas. Ejemplo: Un coche, una casa, unos libros, unas flores.</p>
                        </article>
                        <img src="img/materias/e1.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="adjetivos">
                            <h2>5. Adjetivos</h2>
                            <h3>Género y Número</h3>
                            <p>Los adjetivos concuerdan en género y número con el sustantivo que describen.</p>
                            <ul>
                                <li>Masculino singular: alto. Ejemplo: El chico alto.</li>
                                <li>Femenino singular: alta. Ejemplo: La chica alta.</li>
                                <li>Masculino plural: altos. Ejemplo: Los chicos altos.</li>
                                <li>Femenino plural: altas. Ejemplo: Las chicas altas.</li>
                            </ul>
                            <h3>Posición</h3>
                            <p>Los adjetivos descriptivos suelen ir después del sustantivo, mientras que los adjetivos determinativos suelen ir antes.</p>
                            <ul>
                                <li>Descriptivo: La casa grande.</li>
                                <li>Determinativo: Mi casa.</li>
                            </ul>
                        </article>
                        <article class="espaciado" id="verbos">
                            <h2>6. Verbos</h2>
                            <h3>Conjugaciones</h3>
                            <p>Los verbos se agrupan en tres conjugaciones según la terminación del infinitivo: -ar, -er, -ir.</p>
                            <ul>
                                <li>Primera conjugación: -ar. Ejemplo: hablar.</li>
                                <li>Segunda conjugación: -er. Ejemplo: comer.</li>
                                <li>Tercera conjugación: -ir. Ejemplo: vivir.</li>
                            </ul>
                            <h3>Tiempos Verbales</h3>
                            <p>Indicativo, subjuntivo, imperativo, cada uno con sus tiempos específicos.</p>
                            <ul>
                                <li>Presente: Yo hablo, tú comes, él vive.</li>
                                <li>Pasado (pretérito perfecto simple): Yo hablé, tú comiste, él vivió.</li>
                                <li>Futuro: Yo hablaré, tú comerás, él vivirá.</li>
                            </ul>
                        </article>
                        <img src="img/materias/e3.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="pronombres">
                            <h2>7. Pronombres</h2>
                            <h3>Personales</h3>
                            <p>Se utilizan para referirse a las personas sin nombrarlas directamente.</p>
                            <ul>
                                <li>Yo, tú, él, ella, nosotros, vosotros, ellos, ellas.</li>
                            </ul>
                            <h3>Posesivos</h3>
                            <p>Indican pertenencia.</p>
                            <ul>
                                <li>Mío, tuyo, suyo, nuestro, vuestro, suyo.</li>
                            </ul>
                            <h3>Demostrativos</h3>
                            <p>Indican la distancia entre el hablante y el objeto.</p>
                            <ul>
                                <li>Este, ese, aquel.</li>
                            </ul>
                        </article>
                        <img src="img/materias/e4.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="adverbios">
                            <h2>8. Adverbios</h2>
                            <h3>Tipos de Adverbios</h3>
                            <p>Modifican un verbo, un adjetivo o otro adverbio.</p>
                            <ul>
                                <li>De lugar: aquí, allí, cerca, lejos.</li>
                                <li>De tiempo: ahora, antes, después, siempre.</li>
                                <li>De modo: bien, mal, rápidamente.</li>
                                <li>De cantidad: mucho, poco, bastante.</li>
                            </ul>
                        </article>
                        <article class="espaciado" id="preposiciones">
                            <h2>9. Preposiciones</h2>
                            <h3>Lista de Preposiciones</h3>
                            <p>Las preposiciones son palabras que establecen una relación entre dos elementos de la oración.</p>
                            <ul>
                                <li>A, ante, bajo, con, contra, de, desde, en, entre, hacia, hasta, para, por, según, sin, sobre, tras.</li>
                            </ul>
                        </article>
                        <article class="espaciado" id="conjunciones">
                            <h2>10. Conjunciones</h2>
                            <h3>Coordinantes y Subordinantes</h3>
                            <p>Las conjunciones enlazan palabras o grupos de palabras.</p>
                            <ul>
                                <li>Coordinantes: y, o, pero, sino.</li>
                                <li>Subordinantes: que, aunque, si, como.</li>
                            </ul>
                        </article>
                        <img src="img/materias/e5.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="sintaxis">
                            <h2>11. Sintaxis</h2>
                            <h3>Estructura de la Oración</h3>
                            <p>La estructura básica de una oración es Sujeto + Verbo + Complemento.</p>
                            <ul>
                                <li>Sujeto: La parte de la oración que indica quién realiza la acción.</li>
                                <li>Verbo: La acción de la oración.</li>
                                <li>Complemento: Da información
                                <li>Complemento: Da información adicional sobre el sujeto o el verbo.</li>
                            </ul>
                        </article>
                        <article class="espaciado" id="puntuacion">
                            <h2>12. Puntuación</h2>
                            <h3>Signos de Puntuación</h3>
                            <p>Los signos de puntuación se utilizan para organizar el texto y marcar pausas o entonaciones.</p>
                            <ul>
                                <li>Punto (.)</li>
                                <li>Coma (,)</li>
                                <li>Punto y coma (;)</li>
                                <li>Dos puntos (:)</li>
                                <li>Comillas (")</li>
                                <li>Signos de interrogación (?)</li>
                                <li>Signos de exclamación (!)</li>
                                <li>Paréntesis ()</li>
                            </ul>
                        </article>
                        <img src="img/materias/e2.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="concordancia">
                            <h2>13. Concordancia</h2>
                            <h3>Concordancia de Género y Número</h3>
                            <p>Los sustantivos, adjetivos y pronombres deben concordar en género y número.</p>
                            <ul>
                                <li>Ellos son altos (plural masculino).</li>
                                <li>Ellas son altas (plural femenino).</li>
                                <li>El coche rojo (singular masculino).</li>
                                <li>La casa roja (singular femenino).</li>
                            </ul>
                        </article>
                        <article class="espaciado" id="recursos">
                            <h2>15. Recursos y Enlaces Útiles</h2>
                            <h3>Libros Recomendados</h3>
                            <p>"Gramática de la Lengua Española" de Real Academia Española y Asociación de Academias de la Lengua Española</p>
                            <p>"Diccionario de la Lengua Española" de Real Academia Española</p>
                            <p>"El Quijote" de Miguel de Cervantes</p>
                            <p>"Cien Años de Soledad" de Gabriel García Márquez</p>
                            <p>"Ficciones" de Jorge Luis Borges</p>
                            <p>"La Casa de los Espíritus" de Isabel Allende</p>
                            <p>"Rayuela" de Julio Cortázar</p>
                            <p>"La Sombra del Viento" de Carlos Ruiz Zafón</p>

                            <h3>Enlaces a Sitios Educativos</h3>
                            <h3>Aprendizaje del Español</h3>
                            <ul>
                                <li><a href="https://cvc.cervantes.es/" target="_blank">Centro Virtual Cervantes</a> - Recursos y actividades para el aprendizaje y la enseñanza del español.</li>
                            </ul>

                            <h3>Diccionarios y Enciclopedias</h3>
                            <ul>
                                <li><a href="https://dle.rae.es/" target="_blank">Diccionario de la Lengua Española</a> - Diccionario oficial de la Real Academia Española.</li>
                            </ul>

                            <h3>Ejercicios y Prácticas</h3>
                            <ul>
                                <li><a href="https://www.aprendedigital.org/" target="_blank">Aprende Digital</a> - Plataforma con ejercicios interactivos y recursos educativos en español.</li>
                                <li><a href="https://www.curso-ingles.com/" target="_blank">Curso-Inglés.com</a> - Ejercicios y recursos para aprender inglés a través del español.</li>
                            </ul>

                            <h3>Foros y Comunidades</h3>
                            <ul>
                                <li><a href="https://forum.wordreference.com/" target="_blank">WordReference Forums</a> - Foro de preguntas y respuestas sobre el idioma español.</li>
                                <li><a href="https://www.reddit.com/r/Spanish/" target="_blank">Reddit - Spanish</a> - Comunidad activa donde se discuten una amplia variedad de temas relacionados con el español.</li>
                            </ul>

                            <h3>Aplicaciones y Herramientas en Línea</h3>
                            <p>Software y herramientas para aprender y practicar español.</p>
                            <ul>
                                <li><a href="https://www.duolingo.com/" target="_blank">Duolingo</a> - Aplicación gratuita para aprender español y otros idiomas.</li>
                                <li><a href="https://www.memrise.com/" target="_blank">Memrise</a> - Plataforma con cursos interactivos de español.</li>
                            </ul>
                        </article>
                    </section>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            // Smooth scrolling for anchor links
                            const links = document.querySelectorAll('a[href^="#"]');
                            links.forEach(link => {
                                link.addEventListener('click', function (event) {
                                    event.preventDefault();
                                    const targetId = this.getAttribute('href').substring(1);
                                    const targetElement = document.getElementById(targetId);
                                    targetElement.scrollIntoView({behavior: 'smooth'});
                                });
                            });
                        });
                    </script>
                </div>
            </body>

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
