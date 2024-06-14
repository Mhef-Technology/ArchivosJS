package conexion;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.google.gson.Gson;
import conexion.conectadita;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;

@WebServlet(value = "/pregunta-respuesta")
public class PreguntaRespuestaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        request.setCharacterEncoding("UTF-8");
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        PreguntaRespuestaData data = gson.fromJson(reader, PreguntaRespuestaData.class);

        conectadita conexion = new conectadita();
        Connection conn = null;
        CallableStatement cstmt = null;
        CallableStatement stmt = null;

        try {
            System.out.println(data.getPregunta());
            conn = conexion.getConnection();
            if (data.getVez() == 0 ){
                cstmt = conn.prepareCall("call sp_agregarConjunto(?,?)");
                cstmt.setString(1, data.getUsuario());
                cstmt.setString(2, data.getTema());
                cstmt.execute();
            }
            stmt = conn.prepareCall("call sp_agregarTarjeta2(?,?,?,?)");
            stmt.setString(1, data.getUsuario());
            stmt.setString(2, data.getTema());
            stmt.setString(3, data.getPregunta());
            stmt.setString(4, data.getRespuesta());
            stmt.executeUpdate();

            response.setStatus(HttpServletResponse.SC_OK);
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conexion.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

class PreguntaRespuestaData {
    private String tema;
    private String pregunta;
    private String respuesta;
    private String usuario;
    private int vez;

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }
    
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    public int getVez() {
        return vez;
    }

    public void setVez(int vez) {
        this.vez = vez;
    }
}

