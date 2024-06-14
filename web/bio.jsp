<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css//materias/bio.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Biología</title>
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
            <div class="container33">
                <header>
                    <h1>Biología</h1>
                </header>
                <section class="content">
                    <nav>
                        <ul>
                            <li><a class="espaciado" href="#¿Qué-es-la-Biología?"><h2>¿Qué es la Biología?</h2></a></li>
                            <li><a class="espaciado" href="#Historia-de-la-Biología"><h2>Historia de la Biología</h2></a></li>
                            <li><a class="espaciado" href="#Ramas-de-la-Biología"><h2>Ramas de la Biología</h2></a></li>
                            <li><a class="espaciado" href="#Importancia-de-la-Biología"><h2>Importancia de la Biología</h2></a></li>
                            <li><a class="espaciado" href="#Conceptos-Fundamentales-en-Biología"><h2>Conceptos Fundamentales en Biología</h2></a></li>
                        </ul>
                    </nav>
                    <article class="espaciado">
                        <h2>¿Qué es la Biología?</h2>
                        <p>La biología es la ciencia que estudia la vida en todas sus formas y manifestaciones. Se ocupa del estudio de los seres vivos, desde las bacterias más pequeñas hasta los organismos más complejos como los seres humanos, así como de los procesos vitales que los caracterizan.</p>
                    </article>
                    <article class="espaciado">
                        <h2>Historia de la Biología</h2>
                        <p>La biología tiene una rica historia que se remonta a la antigüedad, con aportaciones significativas de muchas culturas y civilizaciones:</p>
                        <ul>
                            <li><strong>Antigüedad:</strong> Los griegos, como Aristóteles, hicieron observaciones detalladas sobre la naturaleza y los organismos vivos.</li>
                            <li><strong>Edad Media:</strong> Los estudios biológicos avanzaron en el mundo islámico con científicos como Avicena, quien escribió enciclopedias médicas.</li>
                            <li><strong>Renacimiento:</strong> Hubo un resurgimiento del interés por la biología con figuras como Leonardo da Vinci, que realizó estudios anatómicos detallados.</li>
                            <li><strong>Siglo XIX:</strong> Charles Darwin revolucionó la biología con su teoría de la evolución por selección natural, y Gregor Mendel estableció las bases de la genética.</li>
                            <li><strong>Siglo XX y XXI:</strong> El descubrimiento de la estructura del ADN por Watson y Crick y los avances en biotecnología y biología molecular han transformado nuestro entendimiento de la vida.</li>
                        </ul>
                    </article>
                    <img src="img/materias/b1.jpeg" width="250" height="250" alt="Geografía Física"/>
                    <article class="espaciado">
                        <h2>Ramas de la Biología</h2>
                        <h3>1. Botánica</h3>
                        <p>La botánica es la rama de la biología que estudia las plantas. Analiza su estructura, propiedades, procesos vitales, clasificación y distribución. Los botánicos investigan temas como la fotosíntesis, la reproducción vegetal y la ecología de las plantas.</p>
                        <h3>2. Zoología</h3>
                        <p>La zoología se centra en el estudio de los animales. Investiga su anatomía, fisiología, comportamiento, desarrollo y evolución. Los zoólogos pueden especializarse en áreas como la entomología (estudio de insectos), ornitología (estudio de aves) y herpetología (estudio de reptiles y anfibios).</p>
                        <h3>3. Microbiología</h3>
                        <p>La microbiología estudia los microorganismos, como bacterias, virus, hongos y protozoos. Es fundamental para la medicina, la industria y la ecología. Los microbiólogos trabajan en áreas como la patología de enfermedades infecciosas, la biotecnología y la investigación ambiental.</p>
                        <h3>4. Genética</h3>
                        <p>La genética examina cómo se heredan las características de una generación a otra. Incluye el estudio del ADN, genes y cromosomas, y cómo estas moléculas influyen en el desarrollo y funcionamiento de los organismos. La genética tiene aplicaciones en la medicina, la agricultura y la conservación de especies.</p>
                        <h3>5. Ecología</h3>
                        <p>La ecología estudia las relaciones entre los seres vivos y su entorno. Analiza cómo los organismos interactúan con su medio ambiente y entre sí. Los ecólogos investigan temas como la biodiversidad, los ecosistemas y la conservación del medio ambiente.</p>
                        <h3>6. Biología Molecular</h3>
                        <p>La biología molecular se enfoca en los procesos biológicos a nivel molecular, especialmente en las interacciones entre las diferentes moléculas de la célula, como el ADN, ARN y proteínas. Este campo ha sido fundamental en el desarrollo de técnicas como la ingeniería genética y la terapia génica.</p>
                    </article>
                    <article class="espaciado">
                        <h2>Importancia de la Biología</h2>
                        <p>La biología es esencial para entender el mundo natural y los procesos que sustentan la vida. Sus aplicaciones son vastas y variadas:</p>
                        <ul>
                            <li><strong>Medicina y Salud:</strong> La biología es fundamental en el desarrollo de tratamientos médicos, vacunas y terapias. Ayuda a entender enfermedades, su prevención y cura. Por ejemplo, la investigación en biología molecular ha permitido el desarrollo de medicamentos dirigidos a enfermedades específicas a nivel genético.</li>
                            <li><strong>Agricultura:</strong> Contribuye a mejorar cultivos y ganado a través de técnicas como la ingeniería genética y el manejo sostenible de recursos. Los avances en biotecnología han permitido la creación de plantas resistentes a plagas y condiciones climáticas adversas.</li>
                            <li><strong>Conservación:</strong> Es crucial para la conservación de especies y ecosistemas, ayudando a prevenir la extinción y a mantener la biodiversidad. Los biólogos trabajan en programas de conservación, rehabilitación de hábitats y estudios de impacto ambiental.</li>
                            <li><strong>Biotecnología:</strong> La biología es la base para la biotecnología, que utiliza organismos vivos o sus sistemas para desarrollar productos útiles, como alimentos transgénicos o medicamentos biológicos. La biotecnología tiene aplicaciones en la medicina, la agricultura y la industria.</li>
                        </ul>
                    </article>
                    <img src="img/materias/b2.jpeg" width="250" height="250" alt="Geografía Física"/>
                    <article class="espaciado">
                        <h2>Conceptos Fundamentales en Biología</h2>
                        <h3>1. Célula</h3>
                        <p>La célula es la unidad básica de la vida. Todos los organismos vivos están formados por células, ya sean unicelulares (como las bacterias) o multicelulares (como los humanos). Hay dos tipos principales de células: procariotas (sin núcleo definido, como las bacterias) y eucariotas (con núcleo definido, como las células animales y vegetales).</p>
                        <h3>2. ADN (Ácido Desoxirribonucleico)</h3>
                        <p>El ADN es la molécula que contiene la información genética de los organismos. Esta información se transmite de una generación a otra y es responsable de las características heredadas. El ADN está compuesto por dos cadenas que forman una doble hélice, y su secuencia de nucleótidos codifica los genes.</p>
                        <h3>3. Evolución</h3>
                        <p>La evolución es el proceso mediante el cual las especies cambian con el tiempo a través de la selección natural y otras fuerzas. Es un concepto central en biología que explica la diversidad de la vida en la Tierra. Las especies evolucionan adaptándose a su entorno, y estas adaptaciones pueden ser físicas, comportamentales o fisiológicas.</p>
                        <h3>4. Metabolismo</h3>
                        <p>El metabolismo es el conjunto de reacciones químicas que ocurren en los organismos para mantener la vida. Incluye procesos como la digestión, la respiración celular y la síntesis de moléculas. El metabolismo se divide en anabolismo (construcción de moléculas complejas) y catabolismo (descomposición de moléculas complejas para liberar energía).</p>
                        <h3>5. Homeostasis</h3>
                        <p>La homeostasis es la capacidad de los organismos para mantener un ambiente interno estable, a pesar de los cambios en el entorno externo. Esto es crucial para el funcionamiento adecuado de los procesos biológicos. Ejemplos de homeostasis incluyen la regulación de la temperatura corporal, el equilibrio de agua y electrolitos, y el pH sanguíneo.</p>
                    </article>
                    <article class="espaciado" id="recursos">
                        <h2>15. Recursos y Enlaces Útiles</h2>
                        <h3>Libros Recomendados</h3>
                        <p>"Biología" de Neil A. Campbell y Jane B. Reece</p>
                        <p>"Biología Celular y Molecular" de Gerald Karp</p>
                        <p>"Genética" de Benjamin A. Pierce</p>
                        <p>"Microbiología" de Prescott, Harley y Klein</p>
                        <p>"Ecología" de Manuel C. Molles</p>
                        <p>"Biología del Desarrollo" de Scott F. Gilbert</p>
                        <p>"Inmunología" de Charles A. Janeway</p>
                        <p>"Biología Molecular de la Célula" de Bruce Alberts</p>

                        <h3>Enlaces a Sitios Educativos</h3>
                        <h3>Biología General</h3>
                        <ul>
                            <li><a href="https://www.khanacademy.org/science/biology">Khan Academy - Biology</a> - Extenso recurso con lecciones sobre todos los aspectos de la biología.</li>
                        </ul>

                        <h3>Genética</h3>
                        <ul>
                            <li><a href="https://www.genome.gov/">Genome.gov</a> - Recursos sobre genómica y genética del Instituto Nacional de Investigación del Genoma Humano.</li>
                        </ul>

                        <h3>Ecología</h3>
                        <ul>
                            <li><a href="https://www.nature.com/subjects/ecology">Nature - Ecology</a> - Artículos de investigación y noticias sobre ecología y ciencias ambientales.</li>
                        </ul>

                        <h3>Ejercicios y Problemas</h3>
                        <ul>
                            <li><a href="https://bio.libretexts.org/">Biology LibreTexts</a> - Biblioteca en línea de textos de biología gratuitos, cubriendo todos los niveles y temas de biología.</li>
                            <li><a href="https://www.hhmi.org/biointeractive">BioInteractive</a> - Videos educativos, simulaciones y recursos interactivos sobre biología.</li>
                        </ul>

                        <h3>Foros y Comunidades</h3>
                        <ul>
                            <li><a href="https://biology.stackexchange.com/" target="_blank">Biology Stack Exchange</a> - Foro de preguntas y respuestas sobre temas específicos de biología.</li>
                            <li><a href="https://www.reddit.com/r/biology/" target="_blank">Reddit - Biology</a> - Comunidad activa donde se discuten una amplia variedad de temas de biología.</li>
                        </ul>
                        <h3>Aplicaciones y Herramientas en Línea</h3>
                        <p>Software y herramientas para aprender y practicar biología.</p>
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
</html>
