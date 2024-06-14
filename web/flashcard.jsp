<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexion.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/flashcardStyle.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("usu") != null) {
                String conjunto = request.getParameter("conjunto");
                String tarjeta = request.getParameter("tarjeta");
                String title = request.getParameter("titleCard");
                String description = request.getParameter("descriptionCard");
                String usuario = sesion.getAttribute("usu").toString();
                String tema = sesion.getAttribute("tema").toString();
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rst = null;
                conectadita conect = new conectadita();
                con = conect.getConnection();
                if (request.getParameter("save") != null) {
                    CallableStatement cstmt = con.prepareCall("call sp_actualizarTarjeta(?,?,?,?,?)");
                    cstmt.setString(1, usuario);
                    cstmt.setString(2, conjunto);
                    cstmt.setString(3, tarjeta);
                    cstmt.setString(4, title);
                    cstmt.setString(5, description);
                    cstmt.executeUpdate();
                    tarjeta = title;
        %>
        <title>Meksh - <%=tarjeta%></title>
    </head>
    <body onload="metodo(9)" class="<%=tema%>">
        <%
        } else {
        %>
        <title>Meksh - <%=tarjeta%></title>
    </head>
<body class="<%=tema%>">
    <%
        }

        pstmt = con.prepareStatement("select * from vw_selectCards where nombre_Usuario = ? and nombre_Conjunto = ? and pregunta_Tarjeta = ?");
        pstmt.setString(1, usuario);
        pstmt.setString(2, conjunto);
        pstmt.setString(3, tarjeta);
        rst = pstmt.executeQuery();

        if (rst.next()) {
    %>
    <header>
        <div class="navbar">
            <ul>
                <li><a href="tarjetas.jsp?conjunto=<%=conjunto%>" title="Ir al listado de tarjetas"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                <li><a href="logros.jsp">Logros</a></li>
                <li><a href="estatus.jsp">Estatus</a></li>
                <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
            </ul>
        </div>
    </header>
    <main>
        <div class="thing">
            <form action="flashcard.jsp?tarjeta=<%=tarjeta%>&conjunto=<%=conjunto%>" method="post">
                <div class="up">
                    <button class="save" name="save">Guardar cambios</button>
                    <button class="question" name="question" onclick="metodo(2)" type="button"><img src="img/pregunta.jpg" class="quest" alt="?"/></button>
                </div>
                <div class="card <%=tarjeta%>">
                    <div class='titulo'>Pregunta: </div>
                    <div class='tituloCard'><textarea id="titleCard" name="titleCard" class='titleCard' placeholder="Ingresa la pregunta o concepto que deseas estudiar"><%=rst.getString("pregunta_Tarjeta")%></textarea></div>
                    <div class='descripcion'>Respuesta: </div>
                    <div class='descripcionCard'><textarea id="descriptionCard" name="descriptionCard" class='descriptionCard' placeholder="Ingresa la respuesta o definición correspondiente"><%=rst.getString("respuesta_Tarjeta")%></textarea></div>
                </div>
            </form>
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
                    <div class="aboutus"><p class="tit1">Conócenos</p></div>
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
                    <div class="help"><p class="tit1">Ayuda</p></div>
                    <ul>
                        <li><p class="tit2">¿Necesitas ayuda?</p></li>
                        <li><a href="soporte.jsp"><i class="fa-solid fa-headset" style="color: #ffffff; display: flex; justify-content: left; margin-left: 20px; font-size: 20px; "></i></a></li>
                        <li><a href="chatbot.jsp"><i class="fa-solid fa-robot" style="color: #ffffff; display: flex; justify-content: left; margin-left: 20px; font-size: 20px; "></i></a></li>
                    </ul>
                </div>
                <div class="rightfooter">
                    <div class="contact" id="contacto"><p class="tit1">Contacto</p></div>
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
    <script type="text/javascript" src="js/textoVacio.js"></script>
    <%
        } else {
            out.println("<script>alert('Tarjeta no encontrada')</script><title>Error</title></head>");
            response.sendRedirect("tarjetas.jsp?conjunto=" + conjunto);
        }
    %>
</body>
<%
} else {
%>
<title>Meksh - Flashcards</title>
</head>
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