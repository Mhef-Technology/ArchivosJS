<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, conexión.conectadita, conexión.logros" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/meksh-removebg-preview.png" type="image/x-icon">
        <link rel="stylesheet" href="css/logrosStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href='https://fonts.googleapis.com/css?family=Merriweather' rel='stylesheet'>
        <title>Meksh - Logros</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("usu").toString();
            Connection con = null;
            PreparedStatement pstmt = null;
            Statement stmt = null;
            ResultSet rstt = null;
            conectadita conect = new conectadita();
            con = conect.getConnection();
            ArrayList<logros> no = new ArrayList<>();
            
            stmt = con.createStatement();
            pstmt = con.prepareStatement("select * from vw_searchAwards");
            rstt = stmt.executeQuery("select count(*) as IdMax from Logro");
            rstt.next();
            int maximo = rstt.getInt("IdMax");
        %>
        <header>
            <div class="navbar">
                <ul>
                    <li><a href="inicio.jsp" title="Ir al Inicio"><img src="img/logoMeksh.jpg" height="60" alt="logoMeksh" style="margin-left: 20px; margin-right: 5px;"/></a></li>
                    <li><a href="perfil.jsp"><img src="img/predeterminado.jpeg" width="50" alt="logoMeksh" class="perfil" style="margin-left: 10px; margin-right: 10px;"/><p id="usuario"><%=usuario%></p></a></li>
                    <li><a href="#amigos">Amigos</a></li>
                    <li><a href="estatus.jsp">Estatus</a></li>
                    <li><a href="inicio.jsp?logout=1">Cerrar sesión</a></li>
                </ul>
            </div>
        </header>
        <div class="all">
            <table class="all2">
                    <%
                        int fila = 0;
                        int columna = 1;
                        int totLogros = 0;
                        for (int i = 0; i < maximo; i++) {
                            ResultSet rst = pstmt.executeQuery();
                            int banderita = 0;
                            while (rst.next()) {
                                if (rst.getString("nombre_Usuario").equals(usuario)) {
                                    if (rst.getInt("idLogro") == (i+1)) {
                                        logros obj = new logros();
                                        obj.setClave(rst.getInt("idLogro"));
                                        no.add(obj);
                                        banderita = 1;
                                        if (columna >= 2 && columna <= 3) {
                                            totLogros++;
                    %>
                    <td>
                        <div class="group">
                            <div class="award front <%=rst.getString("tipo_Logro")%> <%=rst.getString("nombre_Logro")%>">
                                <div class="image l<%=rst.getInt("idLogro")%>"></div>
                                <p class="titulo <%=rst.getString("nombre_Logro")%>"><%=rst.getString("nombre_Logro")%></p>
                                <p class="desc"><%=rst.getString("descripcionCorta_Logro")%></p>
                            </div>
                            <div class="award back <%=rst.getString("tipo_Logro")%> <%=rst.getString("nombre_Logro")%>">
                                <div class="image l<%=rst.getInt("idLogro")%>"></div>
                                <p class="descMayor"><%=rst.getString("descripcionLarga_Logro")%></p>
                            </div>
                        </div>
                    </td>
                    <%
                        if (columna == 3) {
                    %>
                </tr>
                <%
                        columna = 1;
                    } else {
                        columna++;
                    }
                } else if (columna == 1) {
                    columna++;
                    totLogros++;
                    fila++;
                %>
                <tr class="fila <%=fila%>">
                    <td>
                        <div class="group">
                            <div class="award front <%=rst.getString("tipo_Logro")%> <%=rst.getString("nombre_Logro")%>">
                                <div class="image l<%=rst.getInt("idLogro")%>"></div>
                                <p class="titulo <%=rst.getString("nombre_Logro")%>"><%=rst.getString("nombre_Logro")%></p>
                                <p class="desc"><%=rst.getString("descripcionCorta_Logro")%></p>
                            </div>
                            <div class="award back <%=rst.getString("tipo_Logro")%> <%=rst.getString("nombre_Logro")%>">
                                <div class="image l<%=rst.getInt("idLogro")%>"></div>
                                <p class="descMayor"><%=rst.getString("descripcionLarga_Logro")%></p>
                            </div>
                        </div>
                    </td>
                    <%
                                        }
                                    }
                                }
                            }
                            if (banderita == 0) {
                                totLogros++;
                                logros obj = new logros();
                                obj.setClave(0);
                                no.add(obj);
                            }
                        }
                    %>
                </tr>
            </table>
        </div>
        <div class="alln">
            <table class="all2">
                    <%
                        PreparedStatement pstmt2 = null;
                        pstmt2 = con.prepareStatement("select * from Logro");
                        ResultSet rst2 = null;
                        rst2 = pstmt2.executeQuery();
                        int fila2 = 0;
                        int columna2 = 1;
                        int totLogros2 = 0;
                        for (int i = 0; i < maximo; i++) {
                            rst2.next();
                            if (rst2.getInt("idLogro") != (no.get(i).getClave())) {
                                if (columna2 >= 2 && columna2 <= 3) {
                                    totLogros2++;
                    %>
                    <td>
                        <div class="group">
                            <div class="awardn front <%=rst2.getString("nombre_Logro")%> <%=totLogros2%>">
                                <img src="img/pregunta.jpg" width="190" height="190" alt="?"/>
                                <p class="titulo <%=rst2.getString("nombre_Logro")%>"><%=rst2.getString("nombre_Logro")%></p>
                                <p class="descn">?</p>
                            </div>
                            <div class="awardn back <%=rst2.getString("nombre_Logro")%>">
                                <img src="img/pregunta.jpg" width="190" height="190" alt="?"/>
                                <p class="descMayor"><%=rst2.getString("descripcionLarga_Logro")%></p>
                            </div>
                        </div>
                    </td>
                    <%
                        if (columna2 == 3) {
                    %>
                </tr>
                <%
                        columna2 = 1;
                    } else {
                        columna2++;
                    }
                } else if (columna2 == 1) {
                    columna2++;
                    totLogros2++;
                    fila2++;
                %>
                <tr class="fila <%=fila2%>">
                    <td>
                        <div class="group">
                            <div class="awardn front <%=rst2.getString("nombre_Logro")%>">
                                <img src="img/pregunta.jpg" width="190" height="190" alt="?"/>
                                <p class="titulo <%=rst2.getString("nombre_Logro")%>"><%=rst2.getString("nombre_Logro")%></p>
                                <p class="descn">?</p>
                            </div>
                            <div class="awardn back <%=rst2.getString("nombre_Logro")%>">
                                <img src="img/pregunta.jpg" width="190" height="190" alt="?"/>
                                <p class="descMayor"><%=rst2.getString("descripcionLarga_Logro")%></p>
                            </div>
                        </div>
                    </td>
                    <%
                                }
                            } else {
                                totLogros2++;
                            }
                        }
                    %>
                </tr>
            </table>
        </div>
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
                            <li><p>Teléfono:</p></li>
                            <li><p class="numero">55 3826 9190</p></li>
                            <li><p>Correo electrónico:</p></li>
                            <li><p>mhef.technology@gmail.com</p></li>
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
    </body>
</html>
<!Crea x conjuntos!>
<!Crea x tarjetas!>
<!Usa x veces el cronometro!>
<!Agrega x amigos!>
<!Responde cada pregunta correctamente de las flashcards!>
<!Inicia sesión en Meksh x días!>
<!Crea x hojas!>