<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css//materias/bio.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Química</title>
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
                    <li><a href="info.jsp" title="Ir al menú de información"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="logros.jsp">Logros</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <main><body>
                <div class="container8">
                    <header>
                        <h1>Química</h1>
                    </header>
                    <section class="content">
                        <nav>
                            <ul>
                                <li><a class="espaciado" href="#introduccion"><h2>Introducción</h2></a></li>
                                <li><a class="espaciado" href="#ramas"><h2>Ramas de la Química</h2></a></li>
                                <li><a class="espaciado" href="#estructura-atomica"><h2>Estructura Atómica</h2></a></li>
                                <li><a class="espaciado" href="#tabla-periodica"><h2>Tabla Periódica</h2></a></li>
                                <li><a class="espaciado" href="#enlaces-quimicos"><h2>Enlaces Químicos</h2></a></li>
                                <li><a class="espaciado" href="#reacciones-quimicas"><h2>Reacciones Químicas</h2></a></li>
                                <li><a class="espaciado" href="#termoquimica"><h2>Termoquímica</h2></a></li>
                                <li><a class="espaciado" href="#cinetica-quimica"><h2>Cinética Química</h2></a></li>
                                <li><a class="espaciado" href="#equilibrio-quimico"><h2>Equilibrio Químico</h2></a></li>
                                <li><a class="espaciado" href="#acidos-bases"><h2>Ácidos y Bases</h2></a></li>
                                <li><a class="espaciado" href="#quimica-organica"><h2>Química Orgánica</h2></a></li>
                                <li><a class="espaciado" href="#electroquimica"><h2>Electroquímica</h2></a></li>
                                <li><a class="espaciado" href="#quimica-ambiental"><h2>Química Ambiental</h2></a></li>
                                <li><a class="espaciado" href="#laboratorio-quimica"><h2>Laboratorio de Química</h2></a></li>
                                <li><a class="espaciado" href="#recursos"><h2>Recursos y Enlaces Útiles</h2></a></li>
                                <li><a class="espaciado" href="#formulas"><h2>Fórmulas Clave</h2></a></li>
                            </ul>
                        </nav>

                        <article class="espaciado" id="introduccion">
                            <h2 class="espaciado">1. Introducción a la Química</h2>
                            <h3>Definición de Química</h3>
                            <p>La química es la ciencia que estudia la composición, estructura, propiedades y cambios de la materia.</p>
                            <h3>Historia de la Química</h3>
                            <p>Desde la alquimia antigua hasta la química moderna, destacando figuras como Lavoisier, Mendeleev, y otros.</p>
                            <h3>Importancia de la Química</h3>
                            <p>Su impacto en medicina, medio ambiente, tecnología y más.</p>
                        </article>
                        <img src="img/materias/img.jpg" width="250" height="250" alt="memorama"/>


                        <article class="espaciado" id="ramas">
                            <h2>2. Ramas de la Química</h2>
                            <ul>
                                <li>Química Orgánica: Estudio de los compuestos que contienen carbono.</li>
                                <li>Química Inorgánica: Estudio de compuestos que no contienen carbono (excepto algunos como los carbonatos).</li>
                                <li>Química Física: Aplicación de conceptos físicos para estudiar sistemas químicos.</li>
                                <li>Bioquímica: Estudio de procesos químicos en organismos vivos.</li>
                                <li>Química Analítica: Técnicas y métodos para analizar la composición de sustancias.</li>
                                <li>Química Industrial: Procesos químicos en la industria para producir materiales y productos.</li>
                            </ul>
                        </article>
                        <img src="img/materias/q7.jpeg" width="350" height="350" alt="memorama"/>

                        <article class="espaciado" id="estructura-atomica">
                            <h2>3. Estructura Atómica</h2>
                            <h3>Componentes del Átomo</h3>
                            <ul>
                                <li>Protones: Partículas con carga positiva en el núcleo.</li>
                                <li>Neutrones: Partículas sin carga en el núcleo.</li>
                                <li>Electrones: Partículas con carga negativa que orbitan el núcleo.</li>
                            </ul>
                            <h3>Número Atómico y Masa Atómica</h3>
                            <p>Número de protones y la suma de protones y neutrones.</p>
                            <h3>Isótopos</h3>
                            <p>Átomos del mismo elemento con diferente número de neutrones.</p>
                            <h3>Modelo Atómico de Bohr</h3>
                            <p>Electrones en niveles de energía específicos alrededor del núcleo.</p>
                            <h3>Configuración Electrónica</h3>
                            <p>Distribución de electrones en niveles de energía, p.ej., Oxígeno: 1s<sup>2</sup> 2s<sup>2</sup> 2p<sup>4</sup>.</p>
                        </article>
                        <img src="img/materias/q8.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado"id="tabla-periodica">
                            <h2>4. Tabla Periódica</h2>
                            <h3>Historia y Desarrollo</h3>
                            <p>Creación por Mendeleev y su evolución.</p>
                            <h3>Organización de la Tabla Periódica</h3>
                            <ul>
                                <li>Grupos: Columnas que representan elementos con propiedades similares.</li>
                                <li>Periodos: Filas que indican el número de niveles de energía.</li>
                                <li>Metales, No Metales y Metaloides: Clasificación de elementos según sus propiedades.</li>
                            </ul>
                            <h3>Tendencias Periódicas</h3>
                            <ul>
                                <li>Radio Atómico: Tamaño de un átomo.</li>
                                <li>Energía de Ionización: Energía necesaria para remover un electrón.</li>
                                <li>Electronegatividad: Capacidad de un átomo para atraer electrones en un enlace químico.</li>
                            </ul>
                        </article>
                        <img src="img/materias/q9.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="enlaces-quimicos">
                            <h2>5. Enlaces Químicos</h2>
                            <h3>Tipos de Enlaces</h3>
                            <ul>
                                <li>Enlace Iónico: Transferencia de electrones entre átomos.</li>
                                <li>Enlace Covalente: Compartición de electrones entre átomos.</li>
                                <li>Enlace Metálico: Electrones deslocalizados entre átomos metálicos.</li>
                            </ul>
                            <h3>Propiedades de los Enlaces</h3>
                            <p>Influencia en la dureza, punto de fusión, conductividad, etc.</p>
                            <h3>Fórmulas de Ejemplo</h3>
                            <ul>
                                <li>Cloruro de Sodio (NaCl): Enlace iónico entre sodio y cloro.</li>
                                <li>Agua (H₂O): Enlace covalente entre hidrógeno y oxígeno.</li>
                                <li>Amoníaco (NH₃): Enlace covalente entre nitrógeno e hidrógeno.</li>
                            </ul>
                        </article>
                        <img src="img/materias/q4.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="reacciones-quimicas">
                            <h2>6. Reacciones Químicas</h2>
                            <h3>Tipos de Reacciones</h3>
                            <ul>
                                <li>Síntesis: Dos o más sustancias se combinan para formar una nueva.</li>
                                <li>Descomposición: Una sustancia se descompone en dos o más productos.</li>
                                <li>Desplazamiento Simple: Un elemento reemplaza a otro en un compuesto.</li>
                                <li>Desplazamiento Doble: Intercambio de iones entre dos compuestos.</li>
                                <li>Combustión: Una sustancia se combina con oxígeno liberando energía.</li>
                            </ul>
                            <h3>Ley de Conservación de la Masa</h3>
                            <p>La masa total de los reactivos es igual a la masa total de los productos.</p>
                            <h3>Estequiometría</h3>
                            <p>Relación cuantitativa entre reactivos y productos en una reacción.</p>
                            <h3>Ejemplo de Balanceo de Reacciones</h3>
                            <p>Propano: C<sub>3</sub>H<sub>8</sub> + 5O<sub>2</sub> → 3CO<sub>2</sub> + 4H<sub>2</sub>O</p>
                        </article>
                        <img src="img/materias/q1.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="termoquimica">
                            <h2>7. Termoquímica</h2>
                            <h3>Conceptos Básicos</h3>
                            <ul>
                                <li>Calor y Trabajo: Transferencia de energía en procesos químicos.</li>
                                <li>Sistema y Entorno: El área de estudio y todo lo que la rodea.</li>
                            </ul>
                            <h3>Leyes de la Termodinámica</h3>
                            <ul>
                                <li>Primera Ley: Conservación de la energía.</li>
                                <li>Segunda Ley: Entropía de un sistema cerrado siempre aumenta.</li>
                                <li>Tercera Ley: Entropía de un cristal perfecto a 0 K es cero.</li>
                            </ul>
                            <h3>Entalpía (H)</h3>
                            <p>Cambio de calor a presión constante.</p>
                            <p>Fórmula: ΔH = ΔU + PΔV</p>
                            <h3>Energía Libre de Gibbs (G)</h3>
                            <p>Determina la espontaneidad de una reacción.</p>
                            <p>Fórmula: ΔG = ΔH − TΔS</p>
                        </article>
                        <img src="img/materias/q2.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="cinetica-quimica">
                            <h2>8. Cinética Química</h2>
                            <h3>Velocidad de Reacción</h3>
                            <p>Cambio de concentración de reactivos/productos por unidad de tiempo.</p>
                            <h3>Factores que Afectan la Velocidad</h3>
                            <ul>
                                <li>Concentración: Mayor concentración, mayor velocidad.</li>
                                <li>Temperatura: Mayor temperatura, mayor velocidad.</li>
                                <li>Catalizadores: Aceleran las reacciones sin consumirse.</li>
                            </ul>
                            <h3>Teoría del Estado de Transición</h3>
                            <p>Explica cómo las moléculas reaccionan.</p>
                            <h3>Ecuaciones de Velocidad</h3>
                            <p>Reacción de primer orden: Rate = k[A]</p>
                        </article>

                        <article class="espaciado" id="equilibrio-quimico">
                            <h2>9. Equilibrio Químico</h2>
                            <h3>Principio de Le Châtelier</h3>
                            <p>Un sistema en equilibrio responde a cambios para contrarrestarlos.</p>
                            <h3>Constante de Equilibrio (K)</h3>
                            <p>Relación de concentraciones de productos y reactivos en equilibrio.</p>
                            <p>Fórmula: K<sub>c</sub> = [productos]/[reactivos]</p>
                            <h3>Equilibrios Heterogéneos y Homogéneos</h3>
                            <p>Equilibrios con distintas fases y la misma fase respectivamente.</p>
                        </article>
                        <img src="img/materias/q3.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="acidos-bases">
                            <h2>10. Ácidos y Bases</h2>
                            <h3>Definiciones de Ácidos y Bases</h3>
                            <ul>
                                <li>Arrhenius: Ácidos producen H<sup>+</sup> y bases OH<sup>−</sup> en solución.</li>
                                <li>Brønsted-Lowry: Ácidos donan protones, bases aceptan protones.</li>
                                <li>Lewis: Ácidos aceptan pares de electrones, bases donan pares de electrones.</li>
                            </ul>
                            <h3>Fuerza de Ácidos y Bases</h3>
                            <p>Medida por su grado de disociación en solución.</p>
                            <h3>pH y pOH</h3>
                            <p>Escala para medir la acidez o basicidad de una solución.</p>
                            <p>Fórmula del pH: pH = −log[H<sup>+</sup>]</p>
                            <p>Relación pH y pOH: pH + pOH = 14</p>
                        </article>

                        <article class="espaciado" id="quimica-organica">
                            <h2>11. Química Orgánica</h2>
                            <h3>Introducción a los Compuestos Orgánicos</h3>
                            <p>Compuestos que contienen carbono.</p>
                            <h3>Grupos Funcionales</h3>
                            <ul>
                                <li>Alcanos: Hidrocarburos con enlaces simples.</li>
                                <li>Alquenos: Hidrocarburos con enlaces dobles.</li>
                                <li>Alquinos: Hidrocarburos con enlaces triples.</li>
                                <li>Alcoholes, Aldehídos, Cetonas, Ácidos Carboxílicos: Compuestos con grupos funcionales específicos.</li>
                            </ul>
                            <h3>Nomenclatura Orgánica</h3>
                            <p>Sistema para nombrar compuestos orgánicos.</p>
                            <h3>Reacciones Orgánicas</h3>
                            <ul>
                                <li>Sustitución: Reemplazo de un átomo o grupo por otro.</li>
                                <li>Adición: Adición de átomos a enlaces múltiples.</li>
                                <li>Eliminación: Remoción de átomos para formar enlaces múltiples.</li>
                            </ul>
                        </article>
                        <img src="img/materias/q4.jpeg" width="250" height="250" alt="memorama"/>
                        <article class="espaciado" id="electroquimica">
                            <h2>12. Electroquímica</h2>
                            <h3>Redox: Reacciones de Oxidación y Reducción</h3>
                            <p>Transferencia de electrones entre sustancias.</p>
                            <h3>Celdas Galvánicas y Electrolíticas</h3>
                            <p>Dispositivos que convierten energía química en eléctrica y viceversa.</p>
                            <h3>Ley de Faraday de la Electrólisis</h3>
                            <p>Relación entre cantidad de sustancia y carga eléctrica.</p>
                            <h3>Potencial de Electrodo (E°)</h3>
                            <p>Medida de la tendencia de un electrodo a perder o ganar electrones.</p>
                            <p>Fórmula: ΔG = −nFE</p>
                        </article>

                        <article class="espaciado" id="quimica-ambiental">
                            <h2>13. Química Ambiental</h2>
                            <h3>Contaminación y su Impacto</h3>
                            <p>Efectos negativos de productos químicos en el medio ambiente.</p>
                            <h3>Química del Aire y del Agua</h3>
                            <p>Composición y reacciones químicas en el aire y agua.</p>
                            <h3>Desarrollo Sostenible y Química Verde</h3>
                            <p>Métodos para reducir el impacto ambiental de procesos químicos.</p>
                        </article>

                        <article class="espaciado" id="laboratorio-quimica">
                            <h2>14. Laboratorio de Química</h2>
                            <h3>Seguridad en el Laboratorio</h3>
                            <p>Procedimientos para evitar accidentes.</p>
                            <h3>Materiales y Equipos Comunes</h3>
                            <p>Instrumentos y su uso.</p>
                            <h3>Procedimientos Básicos</h3>
                            <ul>
                                <li>Titulación: Medición de concentración de una solución.</li>
                                <li>Filtración: Separación de sólidos de líquidos.</li>
                                <li>Destilación: Separación de mezclas basadas en puntos de ebullición.</li>
                            </ul>
                        </article>


                        <img src="img/materias/q5.jpeg" width="250" height="250" alt="memorama"/>
                        <article  class="espaciado" id="formulas">
                            <h2>Fórmulas Clave de Química</h2>
                            <h3>Masa Molar (M)</h3>
                            <p>Fórmula: M = masa / moles</p>
                            <h3>Ley de los Gases Ideales</h3>
                            <p>Fórmula: PV = nRT</p>
                            <h3>Equilibrio Químico</h3>
                            <p>Fórmula: K<sub>c</sub> = [productos] / [reactivos]</p>
                            <h3>Cambio de Entalpía (ΔH)</h3>
                            <p>Fórmula: ΔH = ΔU + PΔV</p>
                            <h3>Energía Libre de Gibbs</h3>
                            <p>Fórmula: ΔG = ΔH − TΔS</p>
                            <h3>Constante de Velocidad de Reacción de Primer Orden</h3>
                            <p>Fórmula: Rate = k[A]</p>
                            <h3>pH</h3>
                            <p>Fórmula: pH = −log[H<sup>+</sup>]</p>
                        </article>
                        <article class="espaciado" id="recursos">
                            <h2>15. Recursos y Enlaces Útiles</h2>
                            <h3>Libros Recomendados</h3>
                            <p>"Química General" de Ralph H. Petrucci, William S. Harwood, F. Geoffrey Herring y Jeffry D. Madura</p>
                            <p>"Principios de Química" de Peter Atkins y Loretta Jones</p>
                            <p>"Química" de Raymond Chang</p>
                            <p>"Química Orgánica" de Paula Yurkanis Bruice</p>
                            <p>"Química Inorgánica" de Gary L. Miessler, Paul J. Fischer y Donald A. Tarr</p>
                            <p>"Física Química" de Peter Atkins y Julio de Paula</p>
                            <p>"Química Cuántica" de Ira N. Levine</p>
                            <p>"Química Analítica" de Douglas A. Skoog, Donald M. West, F. James Holler y Stanley R. Crouch</p>

                            <h3>Enlaces a Sitios Educativos</h3>
                            <h3>Química Analítica</h3>
                            <ul>
                                <li><a href="https://chem.libretexts.org/Bookshelves/Analytical_Chemistry">Analytical Chemistry 2.0</a> - Recurso que cubre una amplia gama de técnicas y principios de química analítica.</li>
                            </ul>

                            <h3>Química Física</h3>
                            <ul>
                                <li><a href="http://www.chem1.com/acad/webtext/virtualtextbook.html" target="_blank">Chem1 Virtual Textbook</a> - Textos completos sobre química física y otros temas fundamentales de química.</li>
                            </ul>

                            <h3>Ejercicios y Problemas</h3>
                            <ul>
                                <li><a href="https://chem.libretexts.org/" target="_blank">Chemistry LibreTexts</a> - Biblioteca en línea de textos de química gratuitos, abarca todos los niveles y temas de química.</li>
                                <li><a href="http://www.periodicvideos.com/" target="_blank">Periodic Videos</a> - Videos educativos sobre cada elemento de la tabla periódica y otras reacciones químicas interesantes.</li>
                            </ul>

                            <h3>Foros y Comunidades</h3>
                            <ul>
                                <li><a href="https://chemistry.stackexchange.com/" target="_blank">Chemistry Stack Exchange</a> - Foro de preguntas y respuestas sobre temas específicos de química.</li>
                                <li><a href="https://www.reddit.com/r/chemistry/" target="_blank">Reddit - Chemistry</a> - Comunidad activa donde se discuten una amplia variedad de temas de química.</li>
                            </ul>
                            <h3>Aplicaciones y Herramientas en Línea</h3>
                            <p>Software y herramientas para aprender y practicar química.</p>
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
