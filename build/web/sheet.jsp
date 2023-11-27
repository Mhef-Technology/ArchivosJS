<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexión.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/sheetStyle.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css"> <!-- Si has descargado los archivos localmente -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <%
            String hoja = request.getParameter("hoja");
            String nombre = request.getParameter("titHoja");
            String ideas = request.getParameter("ideasHoja");
            String notas = request.getParameter("notasHoja");
            String resumen = request.getParameter("resHoja");
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("usu").toString();
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rst = null;
            conectadita conect = new conectadita();
            con = conect.getConnection();

            if (request.getParameter("save") != null) {
                CallableStatement cstmt = con.prepareCall("call sp_actualizarHoja(?,?,?,?,?,?)");
                cstmt.setString(1, usuario);
                cstmt.setString(2, hoja);
                cstmt.setString(3, nombre);
                cstmt.setString(4, ideas);
                cstmt.setString(5, notas);
                cstmt.setString(6, resumen);
                cstmt.executeUpdate();
                hoja = nombre;
        %>
        <title>Meksh - <%=hoja%></title>
    </head>
    <body onload="metodo(9)">
        <%
        } else {
        %>
        <title>Meksh - <%=hoja%></title>
    </head>
<body>
    <%
        }

        pstmt = con.prepareStatement("select * from Usuario inner join Hoja on Usuario.idUsuario = Hoja.idUsuario where nombre_Usuario = ? and nombre_Hoja = ?");
        pstmt.setString(1, usuario);
        pstmt.setString(2, hoja);
        rst = pstmt.executeQuery();
        if (rst.next()) {
    %>
    <header>
        <div class="navbar">
            <ul>
                <li><a href="hojas.jsp" title="Ir al listado de hojas"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                <li><a href="logros.jsp">Logros</a></li>
                <li><a href="#amigos">Amigos</a></li>
                <li><a href="estatus.jsp">Estatus</a></li>
                <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
            </ul>
        </div>
    </header>
    <main>
        <div class="thing">
            <form action="sheet.jsp?hoja=<%=hoja%>" method="post">
                <div class="up">
                    <button class="save" name="save">Guardar cambios</button>
                    <button class="question" name="question" onclick="metodo(3)" type="button"><img src="img/pregunta.jpg" class="quest" alt="?"/></button>
                </div>
                <div class="sheet <%=hoja%>" style="background-image: url('./img/Group 1.png');background-position-x: -4px;background-position-y: 0;">
                    <div class='titulo'><textarea id="titHoja" class="titHoja" name="titHoja" placeholder=""><%=rst.getString("nombre_Hoja")%></textarea></div>
                    <div class='ideas'><textarea id="ideasHoja" class="ideasHoja" name="ideasHoja" placeholder="De este lado, coloca las ideas principales que encuentras del tema"><%=rst.getString("ideasClave")%></textarea></div>
                    <div class='notas'><textarea id="notasHoja" class="notasHoja" name="notasHoja" placeholder="En esta parte coloca tus notas del tema"><%=rst.getString("notas")%></textarea></div>
                    <div class='resumen'><textarea id="resHoja" class="resHoja" name="resHoja" placeholder="Aquí coloca un resumen del tema"><%=rst.getString("resumen")%></textarea></div>
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
</body>
<%
    } else {
        out.println("<script>alert('Hoja no encontrada')</script><title>Error</title></head>");
        response.sendRedirect("hojas.jsp");
    }
%>
</html>
