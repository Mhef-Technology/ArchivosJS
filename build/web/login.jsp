<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Meksh - Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/loginStyle.css">
        <link rel="stylesheet" href="ruta/a/font-awesome.min.css"> <!-- Si has descargado los archivos localmente -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <script>
            function valnomusu(e){
                var letritas = "abdcefghijkmlnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ12345678890_-./", x = e.which||e.keycode, letra = String.fromCharCode(x);
                var n = letritas.indexOf(letra);
                if(n === -1)
                    return false;
                else
                    return true;
            }
        </script>
    </head>
    <body>
        <section class="box">
            <h1>Meksh</h1>
            <form action="" method="post">
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
        <%@page import="java.sql.*, conexión.conectadita" %>
        <%
            HttpSession sesion = request.getSession();
            sesion.setAttribute("tipo", null);
            sesion.setAttribute("usu", null);
            if (request.getParameter("boton-continuar") != null) {
                request.setAttribute("boton-continuar", null);
                if (request.getParameter("username").equals("") || request.getParameter("password").equals("")) {
                    out.println("<script>alert('Llene todos los campos')</script>");
                } else if (sesion.getAttribute("tipo") == null && sesion.getAttribute("usu") == null){
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
        %>
        <script src='js/borrarCuadros.js'></script>
        <%
                        response.sendRedirect("inicio.jsp");
                    } else {
        %>
        <script>alert('Usuario no encontrado');</script>
        <%
                    }
                }
            }
        %>
    </body>
</html>
