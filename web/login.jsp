<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*, org.mindrot.jbcrypt.BCrypt, conexion.conectadita" %>
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
            function togglePasswordVisibility() {
                var passwordInput = document.getElementById('password');
                var passwordIcon = document.querySelector('ion-icon[name="lock-closed-outline"]');
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    passwordIcon.name = 'lock-open-outline';
                } else {
                    passwordInput.type = 'password';
                    passwordIcon.name = 'lock-closed-outline';
                }
            }
        </script>
        <%
            HttpSession sesion = request.getSession();
            String linkText = "Regístrate";
            String linkHref = "logup.jsp";
            String linkp = "¿Aún no tienes una cuenta? ";
            String source = request.getParameter("source");
            if ("startButton2".equals(source)) {
                sesion.setAttribute("bandera", 1);
                linkText = "Cancelar";
                linkHref = "index.html";
                linkp = "";
        %>
    <div class="circle-icon">
        <i class="fas fa-circle"></i>
        <span class="number">2</span>
    </div>
    <%
        } else if (sesion.getAttribute("bandera") == null) {

            sesion.setAttribute("bandera", 0);
        }

    %>
</head>
<%        sesion.setAttribute("tipo", 0);
    sesion.setAttribute("usu", null);
    sesion.setAttribute("tema", null);
    if (request.getParameter("registro") != null) {
%>
<body onload="metodo(4)">
    <%
    } else if (request.getParameter("boton-continuar") != null) {
        request.setAttribute("boton-continuar", null);
        if ((Integer) sesion.getAttribute("tipo") == 0 && sesion.getAttribute("usu") == null) {
            Connection con = null;
            ResultSet rst = null;
            PreparedStatement pstmt = null;
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            conectadita conect = new conectadita();
            con = conect.getConnection();
            pstmt = con.prepareCall("select * from Usuario inner join Perfil on Usuario.idUsuario = Perfil.idUsuario where nombre_Usuario = ?;");
            pstmt.setString(1, username);
            rst = pstmt.executeQuery();

            if (rst.next() && BCrypt.checkpw(password, rst.getString("contraseña"))) {
                int clave = rst.getInt("idUsuario");
                String tema = rst.getString("tema");
                PreparedStatement pstmt2 = null;
                ResultSet rst2 = null;
                pstmt2 = con.prepareCall("select * from RelUsuarioTipo where idUsuario = ?;");
                pstmt2.setInt(1, clave);
                rst2 = pstmt2.executeQuery();
                rst2.next();
                int tipo = rst2.getInt("idTipoUsuario");
                sesion.setAttribute("idUsuario", clave);
                sesion.setAttribute("tipo", tipo);
                sesion.setAttribute("usu", username);
                sesion.setAttribute("tema", tema);
                int bandera = (Integer) sesion.getAttribute("bandera");
                if (tipo == 1 || tipo == 2) {
                    if (bandera == 1) {
                        response.sendRedirect("premiumpag.jsp");
                        sesion.setAttribute("bandera", null);
                    } else {
                        response.sendRedirect("inicio.jsp");
                    }
                } else if (tipo == 3) {
                    response.sendRedirect("inicioA.jsp");
                } else {
                    response.sendRedirect("index.html");
                }
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
                <input type="text" name="username" class="put" required onkeypress="return valnomusu(event)">
                <label>Nombre de usuario</label>
            </div>
            <div class="inputbox">
                <ion-icon name="lock-closed-outline" onclick="togglePasswordVisibility()"></ion-icon>
                <input type="password" name="password" class="put" id="password" required>
                <label>Contraseña</label>
            </div>
            <button name="boton-continuar" id="boton-continuar">Continuar</button>
        </form>


        <p><%= linkp%><a href="<%= linkHref%>"><%= linkText%></a></p>


    </section>
        <script>
            window.addEventListener('change',e=>{
                if (e.target.matches('input')) {
                    let data = new String(e.target.value);
                    setTimeout(()=>{
                        e.target.value = '';
                        e.target.value = data;
                    }, 10);
                } 
            });
        </script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.0/dist/sweetalert2.all.min.js"></script>
    <script type="text/javascript" src="js/infoMetodos.js"></script>
    <script type="text/javascript" src="js/validaciones.js"></script>
</body>
</html>
