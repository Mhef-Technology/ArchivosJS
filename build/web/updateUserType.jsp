<%@page import="java.sql.*, org.mindrot.jbcrypt.BCrypt, conexion.conectadita" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Confirmación de Pago</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("usu") != null) {
                String usuario = (String) sesion.getAttribute("usu");
                int idUsuario = (Integer) session.getAttribute("idUsuario");

                if (usuario == null) {
                    System.out.println("Usuario no encontrado en sesión.");
                    response.sendRedirect("index.html");
                    return;
                }
                String password = request.getParameter("password");
                conectadita conect = new conectadita();

                try (Connection con = conect.getConnection(); PreparedStatement pstmt = con.prepareStatement("select * from Usuario where nombre_Usuario = ?;")) {
                    pstmt.setString(1, usuario);
                    try (ResultSet rst = pstmt.executeQuery()) {
                        if (rst.next() && BCrypt.checkpw(password, rst.getString("contraseña"))) {
                            idUsuario = rst.getInt("idUsuario");

                            System.out.println("Usuario autenticado con ID: " + idUsuario);
                        } else {
                            System.out.println("Fallo de autenticación para el usuario: " + usuario);
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        response.sendRedirect("index.html"); // Redirecciona a una página de error en caso de fallo
                    }

                    if (idUsuario != -1) {
                        try (CallableStatement cs = con.prepareCall("{call sp_actualizarTipoUsuario(?, ?)}")) {
                            cs.setInt(1, idUsuario);
                            cs.setInt(2, 2);
                            cs.execute();

                            sesion.setAttribute("tipo", 2);
                            response.sendRedirect("inicio.jsp"); // Redirecciona a una página de éxito
                        }
                    } else {
                        response.sendRedirect("index.html"); // No se encontró el usuario o la contraseña es incorrecta
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendRedirect("index.html"); // Redirecciona a una página de error en caso de fallo
                }
        %>
    </body>
    <%
    } else {
        response.sendRedirect("login.jsp");
        }
    %>
</html>