<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html id="box">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/gorrito.jpeg" type="image/x-icon">
        <link rel="stylesheet" href="css/inicioAStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Home</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("usu").toString();
            String tipo = sesion.getAttribute("tipo").toString();
        %>
        <div class="navbar">
            <ul>
                <li><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></li>
                <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                <li><a href="soporteA.jsp" style="margin-left: 200px; margin-right: 10px;">Soporte</a></li>
                <li><a href="#ajustes" style="margin-left: 50px; margin-right: 10px;">Configuración</a></li>
                <li><a href="inicio.jsp?logout=1" style="margin-left: 50px; margin-right: 10px;">Cerrar sesión</a></li>
            </ul>
        </div>
        
        <section class="container" >
        <div class="texto1">
            <h1>Proximamente</h1>
        </div>
           
        </section>
        <script src="js/metodoSlide.js"></script>
        <footer>
            <div class="subir">
                <a href="#box">Ir al principio</a>
            </div>
            <nav>
                
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
        <%
            if (request.getParameter("logout") != null) {
                sesion.setAttribute("tipo", null);
                sesion.setAttribute("usu", null);
                usuario = null;
                tipo = null;
                out.println("<script>document.getElementById('usuario').value = '';</script>");
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>