<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css//materias/bio.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Matemáticas</title>
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
            <div class="container1">
                <header>
                    <h1>Matemáticas</h1>
                </header>
                <section class="content">
                    <nav>
                        <ul>
                            <li><a class="espaciado" href="#algebra"><h2>Álgebra</h2></a></li>
                            <li><a class="espaciado" href="#geometria"><h2>Geometría</h2></a></li>
                            <li><a class="espaciado" href="#trigonometria"><h2>Trigonometría</h2></a></li>
                            <li><a class="espaciado" href="#calculo"><h2>Cálculo</h2></a></li>
                            <li><a class="espaciado" href="#estadistica"><h2>Estadística y Probabilidad</h2></a></li>
                        </ul>
                    </nav>
                    <article class="espaciado" id="algebra">
                        <h2>1. Álgebra</h2>
                        <p>El álgebra utiliza letras y símbolos para representar números y expresar relaciones entre ellos. Es fundamental para resolver ecuaciones y modelar situaciones reales.</p>
                        <h3>Expresiones Algebraicas</h3>
                        <p><strong>Términos y Coeficientes:</strong> Un término es un producto de un número (coeficiente) y una variable. Ejemplo: en 3x, 3 es el coeficiente y x es la variable.</p>
                        <p><strong>Simplificación:</strong> Reducción de expresiones combinando términos semejantes. Ejemplo: 2x+3x=5x.</p>
                        <h3>Ecuaciones y Desigualdades</h3>
                        <p><strong>Ecuaciones Lineales:</strong> ax+b=c. Ejemplo: 2x+3=7.</p>
                        <p><strong>Ecuaciones Cuadráticas:</strong> ax^2+bx+c=0. Ejemplo: x^2−5x+6=0.</p>
                        <p><strong>Desigualdades:</strong> ax+b>c, ax+b≤c.</p>
                    </article>
                    <img src="img/materias/m1.jpeg" width="250" height="250" alt="memorama"/>
                    <article class="espaciado" id="geometria">
                        <h2>2. Geometría</h2>
                        <p>La geometría estudia las propiedades y relaciones de los puntos, líneas, superficies y sólidos.</p>
                        <h3>Figuras Básicas</h3>
                        <p><strong>Triángulos:</strong> Ángulos que suman 180°. Tipos: equilátero, isósceles, escaleno.</p>
                        <p><strong>Cuadriláteros:</strong> Figuras de cuatro lados. Ejemplo: cuadrados, rectángulos.</p>
                        <p><strong>Círculos:</strong> Conjunto de puntos equidistantes de un punto central.</p>
                        <h3>Fórmulas Clave</h3>
                        <p><strong>Perímetro:</strong> Suma de todos los lados de una figura. Ejemplo: Perímetro de un rectángulo = 2(largo+ancho).</p>
                        <p><strong>Área:</strong> Superficie de una figura. Ejemplo: Área de un círculo = πr^2.</p>
                        <p><strong>Volumen:</strong> Espacio que ocupa un sólido. Ejemplo: Volumen de un cubo = lado^3.</p>
                    </article>
                    <article class="espaciado" id="trigonometria">
                        <h2>3. Trigonometría</h2>
                        <p>La trigonometría se centra en el estudio de los ángulos y las relaciones entre los lados de los triángulos.</p>
                        <h3>Funciones Trigonométricas</h3>
                        <p><strong>Seno (sin):</strong> Opuesto / Hipotenusa.</p>
                        <p><strong>Coseno (cos):</strong> Adyacente / Hipotenusa.</p>
                        <p><strong>Tangente (tan):</strong> Opuesto / Adyacente.</p>
                        <h3>Identidades Trigonométricas</h3>
                        <p><strong>Pitagórica:</strong> sin^2(x) + cos^2(x) = 1.</p>
                        <p><strong>Ángulos Complementarios:</strong> sin(90°−x) = cos(x).</p>
                    </article>
                    <img src="img/materias/m3.jpeg" width="250" height="250" alt="memorama"/>
                    <article class="espaciado" id="calculo">
                        <h2>4. Cálculo</h2>
                        <p>El cálculo se divide en dos ramas principales: diferencial e integral, y se ocupa del estudio de los cambios y las áreas bajo las curvas.</p>
                        <h3>Cálculo Diferencial</h3>
                        <p><strong>Derivada:</strong> Tasa de cambio instantánea de una función. Ejemplo: f′(x) = d/dx f(x).</p>
                        <p><strong>Regla de la Cadena:</strong> d/dx f(g(x)) = f′(g(x)) ⋅ g′(x).</p>
                        <h3>Cálculo Integral</h3>
                        <p><strong>Integral Definida:</strong> Área bajo una curva entre dos puntos. Ejemplo: ∫_a^b f(x) dx.</p>
                        <p><strong>Teorema Fundamental del Cálculo:</strong> Relación entre derivadas e integrales. Ejemplo: ∫_a^b f′(x) dx = f(b) − f(a).</p>
                    </article>
                    <img src="img/materias/m2.jpeg" width="250" height="250" alt="memorama"/>
                    <article class="espaciado" id="estadistica">
                        <h2>5. Estadística y Probabilidad</h2>
                        <p>La estadística y la probabilidad se ocupan de la recolección, análisis e interpretación de datos, así como del estudio de eventos aleatorios.</p>
                        <h3>Estadística Descriptiva</h3>
                        <p><strong>Media:</strong> Promedio de un conjunto de datos.</p>
                        <p><strong>Mediana:</strong> Valor central de un conjunto de datos ordenados.</p>
                        <p><strong>Moda:</strong> Valor más frecuente en un conjunto de datos.</p>
                        <h3>Probabilidad</h3>
                        <p><strong>Evento:</strong> Resultado posible de un experimento.</p>
                    </article>
                    <article class="espaciado" id="recursos">
                        <h2>15. Recursos y Enlaces Útiles</h2>
                        <h3>Libros Recomendados</h3>
                        <p>"Álgebra Lineal y sus Aplicaciones" de Gilbert Strang</p>
                        <p>"Cálculo" de James Stewart</p>
                        <p>"Matemáticas Avanzadas para Ingeniería" de Erwin Kreyszig</p>
                        <p>"Principios de Análisis Real" de Walter Rudin</p>
                        <p>"Ecuaciones Diferenciales" de Dennis G. Zill</p>
                        <p>"Probabilidad y Estadística" de Morris H. DeGroot y Mark J. Schervish</p>
                        <p>"Teoría de Números" de George E. Andrews</p>
                        <p>"Geometría Euclidiana y No Euclidiana" de Marvin Jay Greenberg</p>

                        <h3>Enlaces a Sitios Educativos</h3>
                        <h3>Álgebra</h3>
                        <ul>
                            <li><a href="https://www.khanacademy.org/math/algebra" target="_blank">Khan Academy - Algebra</a> - Recurso gratuito que cubre una amplia gama de conceptos de álgebra.</li>
                        </ul>

                        <h3>Geometría</h3>
                        <ul>
                            <li><a href="https://www.mathsisfun.com/geometry/index.html" target="_blank">Math is Fun - Geometry</a> - Explicaciones detalladas y ejercicios interactivos sobre geometría.</li>
                        </ul>

                        <h3>Ejercicios y Problemas</h3>
                        <ul>
                            <li><a href="https://brilliant.org/" target="_blank">Brilliant</a> - Plataforma que ofrece problemas y cursos interactivos en varios temas de matemáticas.</li>
                            <li><a href="https://www.artofproblemsolving.com/" target="_blank">Art of Problem Solving</a> - Recursos y comunidades para estudiantes interesados en matemáticas avanzadas y competencias.</li>
                        </ul>

                        <h3>Foros y Comunidades</h3>
                        <ul>
                            <li><a href="https://math.stackexchange.com/" target="_blank">Mathematics Stack Exchange</a> - Foro de preguntas y respuestas sobre temas específicos de matemáticas.</li>
                            <li><a href="https://www.reddit.com/r/math/" target="_blank">Reddit - Math</a> - Comunidad activa donde se discuten una amplia variedad de temas de matemáticas.</li>
                        </ul>
                        <h3>Aplicaciones y Herramientas en Línea</h3>
                        <p>Software y herramientas para aprender y practicar matemáticas.</p>
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
