<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, org.mindrot.jbcrypt.BCrypt, conexión.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/logupStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Meksh - Log up</title>
    </head>
    <%
        HttpSession sesion = request.getSession();
        sesion.setAttribute("tipo", null);
        sesion.setAttribute("usu", null);
        if (request.getParameter("boton-continuar") != null) {
            String username = request.getParameter("username");
            String usermail = request.getParameter("usermail");
            String password = request.getParameter("password");
            String password2 = request.getParameter("password2");
            if (password.equals(password2)) {
                String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
                conectadita conect = new conectadita();
                Connection con = conect.getConnection();
                PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Usuario WHERE nombre_Usuario = ?;");
                pstmt.setString(1, username);
                ResultSet rst = pstmt.executeQuery();

                if (!rst.next()) {
                    CallableStatement cstmt = con.prepareCall("call sp_agregarBase(?,?,?)");
                    cstmt.setString(1, username);
                    cstmt.setString(2, usermail);
                    cstmt.setString(3, hashed);
                    cstmt.execute();
                    con.close();
    %>
    <body onload="metodo(6)">
        <%
            response.sendRedirect("login.jsp");
        } else {
        %>
    <body onload="metodo(7)">
        <%
            }
        } else {
        %>
    <body onload="metodo(8)">
        <%
            }
        } else {
        %>
    <body>
        <%
            }
        %>

        <section class="box">
            <a class="to-start" href="index.html" title="Regresar"><img src="img/darkLogo.png" height="100" alt="logoMeksh"/></a>
            <form action="logup.jsp" method="post">
                <div class="inputbox upp">
                    <input type="text" name="username" required onkeypress="return valnomusu(event)">
                    <label>Nombre de usuario</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="mail-outline"></ion-icon>
                    <input type="email" name="usermail" required onkeypress="return valemail(event)">
                    <label>Correo electrónico</label>
                </div>
                <div class="inputbox">
                    <button  type="button" class="mostrar-contrasenia" id="mostrar-contrasenia1" onclick="mostrarContraseña(1)">👁️</button><ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" name="password" id="password" required onkeyup="ojo(1)">
                    <label>Contraseña</label>
                </div>
                <div class="inputbox downn">
                    <button type="button" class="mostrar-contrasenia" id="mostrar-contrasenia2" onclick="mostrarContraseña(2)">👁️</button><ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" name="password2" id="password2" required onkeyup="ojo(2)">
                    <label>Confirmar contraseña</label>
                </div>
                <div class="validar"><label class="valida"></label></div>
                <button id="boton-continuar" name="boton-continuar">Continuar</button>
            </form>
            <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión</a></p>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.0/dist/sweetalert2.all.min.js"></script>
        <script type="text/javascript" src="js/infoMetodos.js"></script>
        <script type="text/javascript" src="js/validaciones.js"></script>
    </body>
</html>
