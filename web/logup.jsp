<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexión.conectadita" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Meksh - Logup</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/logupStyle.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css"> <!-- Si has descargado los archivos localmente -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <script>
            function mostrarContrasenia() {
                var contraseniaInput = document.getElementById("password");
                var botonMostrar = document.getElementById("mostrar-contrasenia");
                if (contraseniaInput.type === "password") {
                    contraseniaInput.type = "text";
                    botonMostrar.textContent = "👁️";
                } else {
                    contraseniaInput.type = "password";
                    botonMostrar.textContent = "👁️";
                }
            }
            function valnomusu(e) {
                var letritas = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-./", x = e.which || e.keycode, letra = String.fromCharCode(x);
                var n = letritas.indexOf(letra);
                if (n === -1)
                    return false;
                else
                    return true;
            }
            function valemail(e) {
                var letritas = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890.@", x = e.which || e.keycode, letra = String.fromCharCode(x);
                var n = letritas.indexOf(letra);
                if (n === -1)
                    return false;
                else
                    return true;
            }
        </script>
    </head>
    <body>
        <section class="box">
            <h1>Meksh</h1>
            <form action="logup.jsp" method="post">
                <div class="inputbox">
                    <input type="text" name="username" required onkeypress="return valnomusu(event)">
                    <label>Nombre de usuario</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="mail-outline"></ion-icon>
                    <input type="email" name="usermail" required onkeypress="return valemail(event)">
                    <label>Correo electrónico</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" name="password" required>
                    <label>Contraseña</label>
                </div>
                <div class="inputbox">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                    <input type="password" name="password2" required>
                    <label>Confirmar contraseña</label>
                </div>
                <button id="boton-continuar" name="boton-continuar">Continuar</button>
            </form>
            <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión</a></p>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>

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
                conectadita conect = new conectadita();
                Connection con = conect.conectar();
                PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Usuario WHERE nombre_Usuario = ?;");
                pstmt.setString(1, username);
                ResultSet rst = pstmt.executeQuery();

                if (!rst.next()) {
                    CallableStatement cstmt = con.prepareCall("call sp_agregarBase(?,?,?)");
                    cstmt.setString(1, username);
                    cstmt.setString(2, usermail);
                    cstmt.setString(3, password);
                    cstmt.execute();
                    con.close();
    %>
    <script>
        alert('Registro exitoso.');
    </script>
    <%
        response.sendRedirect("login.jsp");
    } else {
    %>
    <script>
        alert('El nombre de usuario ya está en uso. Por favor, elige otro nombre de usuario.');
    </script>
    <%
        }
    } else {
    %>
    <script>
        alert('Las contraseñas no coinciden. Por favor, verifica tus contraseñas.');
    </script>
    <%
            }
        }
    %>
</html>
