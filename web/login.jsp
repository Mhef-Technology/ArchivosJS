<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*, conexión.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/loginStyle.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css"> <!-- Si has descargado los archivos localmente -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Log in</title>
        <script>
            function valnomusu(e) {
                var letritas = "abdcefghijkmlnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ12345678890_-./", x = e.which || e.keycode, letra = String.fromCharCode(x);
                var n = letritas.indexOf(letra);
                if (n === -1)
                    return false;
                else
                    return true;
            }
        </script>
    </head>
    <%
        HttpSession sesion = request.getSession();
        sesion.setAttribute("tipo", null);
        sesion.setAttribute("usu", null);
        if (request.getParameter("registro") != null) {
    %>
    <body onload="metodo(4)">
        <%
        } else if (request.getParameter("boton-continuar") != null) {
            request.setAttribute("boton-continuar", null);
            if (sesion.getAttribute("tipo") == null && sesion.getAttribute("usu") == null) {
                Connection con = null;
                ResultSet rst = null;
                PreparedStatement pstmt = null;
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                conectadita conect = new conectadita();
                con = conect.getConnection();
                pstmt = con.prepareCall("select * from Usuario where nombre_Usuario = ? and contraseña = ?;");
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                rst = pstmt.executeQuery();

                if (rst.next()) {
                    int clave = rst.getInt("idUsuario");
                    PreparedStatement pstmt2 = null;
                    ResultSet rst2 = null;
                    pstmt2 = con.prepareCall("select * from RelUsuarioTipo where idUsuario = ?;");
                    pstmt2.setInt(1, clave);
                    rst2 = pstmt2.executeQuery();
                    rst2.next();
                    int tipo = rst2.getInt("idTipoUsuario");
                    sesion.setAttribute("tipo", tipo);
                    sesion.setAttribute("usu", username);
                    response.sendRedirect("inicio.jsp");
                } else {
        %>
    <body onload="metodo(5)">
        <%
                }
            }
        } else {
        %>
    <body>
        <%
            }
        %>
        <section class="box">
            <a class="to-start" href="index.html" title="Regresar"><img src="img/darkLogo.png" height="100" alt="logoMeksh"/></a>
            <form action="login.jsp" method="post">
                <div class="inputbox">
                    <input type="text" name="username" required onkeypress="return valnomusu(event)">
                    <label>Nombre de usuario</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" name="password" required>
                    <label>Contraseña</label>
                </div>
                <button name="boton-continuar" id="boton-continuar">Continuar</button>
            </form>
            <p>¿Aún no tienes una cuenta? <a href="logup.jsp">Regístrate</a></p>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="js/infoMetodos.js"></script>
        <script type="text/javascript" src="js/validaciones.js"></script>
    </body>
</html>
