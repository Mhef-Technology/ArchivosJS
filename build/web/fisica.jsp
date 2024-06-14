<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css//materias/bio.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Física</title>
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
        <main>
            <div class="container5">
                <header>
                    <h1>Física</h1>
                </header>
                <section class="content">
                    <nav>
                        <ul>
                            <li><a class="espaciado" href="#mecanica"><h2>1. Mecánica Clásica</h2></a></li>
                            <li><a class="espaciado" href="#termodinamica"><h2>2. Termodinámica</h2></a></li>
                            <li><a class="espaciado" href="#electromagnetismo"><h2>3. Electromagnetismo</h2></a></li>
                            <li><a class="espaciado" href="#optica"><h2>4. Óptica</h2></a></li>
                            <li><a class="espaciado" href="#cuantica"><h2>5. Física Cuántica</h2></a></li>
                            <li><a class="espaciado" href="#moderna"><h2>6. Física Moderna</h2></a></li>
                        </ul>
                    </nav>
                    <article class="espaciado" id="mecanica">
                        <h2>1. Mecánica Clásica</h2>
                        <h3>Cinemática</h3>
                        <h4>Movimiento Rectilíneo Uniforme (MRU)</h4>
                        <p>Concepto: Es el movimiento de un objeto en línea recta con velocidad constante.</p>
                        <p>Ejemplo: Un coche que se desplaza por una carretera recta a 60 km/h.</p>
                        <p>Fórmula: <code>v = d / t</code></p>
                        <h4>Movimiento Rectilíneo Uniformemente Acelerado (MRUA)</h4>
                        <p>Concepto: Es el movimiento en línea recta con aceleración constante.</p>
                        <p>Ejemplo: Un objeto que cae libremente bajo la influencia de la gravedad.</p>
                        <p>Fórmulas:</p>
                        <p><code>v = v0 + at</code></p>
                        <p><code>d = v0t + (1/2)at^2</code></p>
                    </article>
                    <article class="espaciado" id="dinamica">
                        <h3>Dinámica</h3>
                        <h4>Primera Ley de Newton (Ley de la Inercia)</h4>
                        <p>Concepto: Un objeto en reposo permanecerá en reposo y un objeto en movimiento continuará en movimiento con velocidad constante a menos que actúe sobre él una fuerza externa.</p>
                        <p>Ejemplo: Un libro sobre una mesa permanece en reposo hasta que alguien lo empuja.</p>
                        <h4>Segunda Ley de Newton</h4>
                        <p>Concepto: La aceleración de un objeto es directamente proporcional a la fuerza neta que actúa sobre él e inversamente proporcional a su masa.</p>
                        <p>Fórmula: <code>F = ma</code></p>
                        <h4>Tercera Ley de Newton (Acción y Reacción)</h4>
                        <p>Concepto: Para cada acción, hay una reacción igual y opuesta.</p>
                        <p>Ejemplo: Cuando saltas de un bote, el bote se mueve en la dirección opuesta.</p>
                    </article>
                    <img src="img/materias/f1.jpeg" width="250" height="250" alt="memorama"/>
                    <article class="espaciado" id="trabajo">
                        <h3>Trabajo y Energía</h3>
                        <h4>Trabajo</h4>
                        <p>Concepto: Es la energía transferida a un objeto mediante la aplicación de una fuerza que provoca un desplazamiento.</p>
                        <p>Fórmula: <code>W = Fd cosθ</code></p>
                        <h4>Energía Cinética</h4>
                        <p>Concepto: Es la energía que posee un objeto debido a su movimiento.</p>
                        <p>Fórmula: <code>KE = (1/2)mv^2</code></p>
                        <h4>Energía Potencial</h4>
                        <p>Concepto: Es la energía almacenada en un objeto debido a su posición en un campo de fuerzas.</p>
                        <p>Fórmula: <code>PE = mgh</code></p>
                    </article>
                    <article class="espaciado" id="termodinamica">
                        <h2>2. Termodinámica</h2>
                        <h3>Leyes de la Termodinámica</h3>
                        <h4>Primera Ley de la Termodinámica</h4>
                        <p>Concepto: La energía no se crea ni se destruye, solo se transforma de una forma a otra.</p>
                        <p>Fórmula: <code>ΔU = Q − W</code></p>
                        <h4>Segunda Ley de la Termodinámica</h4>
                        <p>Concepto: En cualquier proceso termodinámico, la entropía del sistema y del entorno combinados siempre aumenta.</p>
                        <p>Fórmula: <code>ΔS ≥ 0</code></p>
                    </article>
                    <article class="espaciado" id="procesos">
                        <h3>Procesos Termodinámicos</h3>
                        <h4>Proceso Isotérmico</h4>
                        <p>Concepto: Un proceso en el que la temperatura del sistema permanece constante.</p>
                        <p>Fórmula: <code>PV = nRT</code></p>
                        <h4>Proceso Adiabático</h4>
                        <p>Concepto: Un proceso en el que no hay transferencia de calor hacia o desde el sistema.</p>
                        <p>Fórmula: <code>PV^γ = constante</code></p>
                    </article>
                    <img src="img/materias/f2.jpeg" width="250" height="250" alt="memorama"/>
                    <article class="espaciado" id="electromagnetismo">
                        <h2>3. Electromagnetismo</h2>
                        <h3>Leyes de Maxwell</h3>
                        <h4>Ley de Gauss para el Campo Eléctrico</h4>
                        <p>Concepto: El flujo eléctrico total a través de una superficie cerrada es proporcional a la carga neta encerrada dentro de esa superficie.</p>
                        <p>Fórmula: <code>∮E⋅dA = Q/ϵ0</code></p>
                        <h4>Ley de Gauss para el Campo Magnético</h4>
                        <p>Concepto: El flujo magnético total a través de una superficie cerrada es cero.</p>
                        <p>Fórmula: <code>∮B⋅dA = 0</code></p>
                    </article>
                    <article class="espaciado" id="fuerzas">
                        <h3>Fuerzas y Campos</h3>
                        <h4>Fuerza Eléctrica (Ley de Coulomb)</h4>
                        <p>Concepto: La fuerza entre dos cargas puntuales es directamente proporcional al producto de las cargas e inversamente proporcional al cuadrado de la distancia entre ellas.</p>
                        <p>Fórmula: <code>F = k(q1q2/r^2)</code></p>
                        <h4>Fuerza Magnética (Ley de Lorentz)</h4>
                        <p>Concepto: La fuerza sobre una carga en movimiento en un campo magnético es perpendicular tanto a la velocidad de la carga como al campo magnético.</p>
                        <p>Fórmula: <code>F = q(v × B)</code></p>
                    </article>
                    <article class="espaciado" id="optica">
                        <h2>4. Óptica</h2>
                        <h3>Óptica Geométrica</h3>
                        <h4>Reflexión</h4>
                        <p>Concepto: El cambio de dirección de un rayo de luz al rebotar en una superficie.</p>
                        <p>Ley de Reflexión: El ángulo de incidencia es igual al ángulo de reflexión.</p>
                        <h4>Refracción</h4>
                        <p>Concepto: El cambio de dirección de un rayo de luz al pasar de un medio a otro.</p>
                        <p>Ley de Snell: <code>n1sinθ1 = n2sinθ2</code></p>
                    </article>
                    <article class="espaciado" id="cuantica">
                        <h2>5. Física Cuántica</h2>
                        <h3>Principios de la Física Cuántica</h3>
                        <h4>Dualidad Onda-Partícula</h4>
                        <p>Concepto: Las partículas subatómicas exhiben propiedades tanto de partículas como de ondas.</p>
                        <p>Ejemplo: Los electrones pueden mostrar patrones de interferencia en experimentos de doble rendija.</p>
                        <h4>Principio de Incertidumbre de Heisenberg</h4>
                        <p>Concepto: Es imposible determinar simultáneamente y con precisión arbitraria la posición y el momento de una partícula.</p>
                        <p>Fórmula: <code>Δx Δp ≥ h/4π</code></p>
                    </article>
                    <img src="img/materias/f3.jpeg" width="250" height="250" alt="memorama"/>
                    <article class="espaciado" id="moderna">
                        <h2>6. Física Moderna</h2>
                        <h3>Relatividad</h3>
                        <h4>Relatividad Especial</h4>
                        <p>Concepto: Las leyes de la física son las mismas en todos los sistemas de referencia inerciales y la velocidad de la luz en el vacío es constante.</p>
                        <p>Fórmulas:</p>
                        <p><code>E = mc^2</code></p>
                        <p><code>t' = t / sqrt(1 - v^2/c^2)</code></p>
                        <h4>Relatividad General</h4>
                        <p>Concepto: La gravedad es una curvatura del espacio-tiempo causada por la masa y la energía.</p>
                        <p>Fórmula: <code>Gμν + Λgμν = (8πG/c^4) Tμν</code></p>
                    </article>
                    <article class="espaciado" id="recursos">
                        <h2>15. Recursos y Enlaces Útiles</h2>
                        <h3>Libros Recomendados</h3>
                        <p>"Física Universitaria" de Sears y Zemansky</p>
                        <p>"Principios de Física" de Raymond A. Serway y John W. Jewett</p>
                        <p>"Física Conceptual" de Paul G. Hewitt</p>
                        <p>"Física para Ciencias e Ingeniería" de Paul A. Tipler y Gene Mosca</p>
                        <p>"Mecánica Clásica" de Herbert Goldstein</p>
                        <p>"Fundamentos de Física" de David Halliday, Robert Resnick y Jearl Walker</p>
                        <p>"Termodinámica" de Enrico Fermi</p>
                        <p>"Electromagnetismo" de David J. Griffiths</p>

                        <h3>Enlaces a Sitios Educativos</h3>
                        <h3>Mecánica</h3>
                        <ul>
                            <li><a href="https://www.khanacademy.org/science/physics" target="_blank">Khan Academy - Física</a> - Amplia gama de recursos educativos sobre diferentes temas de física, incluyendo mecánica.</li>
                        </ul>

                        <h3>Termodinámica</h3>
                        <ul>
                            <li><a href="https://ocw.mit.edu/courses/mechanical-engineering/2-006-thermal-fluids-engineering-ii-spring-2004/" target="_blank">MIT OpenCourseWare - Thermal-Fluids Engineering II</a> - Curso completo sobre termodinámica y fluidos térmicos.</li>
                        </ul>

                        <h3>Ejercicios y Problemas</h3>
                        <ul>
                            <li><a href="https://www.physicstutorials.org/" target="_blank">Physics Tutorials</a> - Tutoriales y problemas resueltos de física para diferentes niveles educativos.</li>
                            <li><a href="https://www.physicsforums.com/" target="_blank">Physics Forums</a> - Comunidad en línea para discutir problemas y conceptos de física.</li>
                        </ul>

                        <h3>Foros y Comunidades</h3>
                        <ul>
                            <li><a href="https://physics.stackexchange.com/" target="_blank">Physics Stack Exchange</a> - Foro de preguntas y respuestas sobre temas específicos de física.</li>
                            <li><a href="https://www.reddit.com/r/Physics/" target="_blank">Reddit - Physics</a> - Comunidad activa donde se discuten una amplia variedad de temas de física.</li>
                        </ul>

                        <h3>Aplicaciones y Herramientas en Línea</h3>
                        <p>Software y herramientas para aprender y practicar física.</p>
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
