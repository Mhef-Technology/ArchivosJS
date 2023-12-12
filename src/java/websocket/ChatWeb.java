package websocket;

import javax.websocket.*;
import javax.websocket.server.*;
import conexión.conectadita;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint(value = "/websocketMeksh/{usuario}")
public class ChatWeb {
    private static final Map<String, Session> sesioncitas = new ConcurrentHashMap<>();
    
    @OnOpen
    public void onOpen(Session session) {
        String usuario = session.getPathParameters().get("usuario");
        sesioncitas.put(usuario, session);

        System.out.println("Bienvenido " + usuario);
    }

    @OnMessage
    public void onMessage(Session session, String mensajito) {
        String[] msgDividido = mensajito.split(":");
        if (!msgDividido[0].equals("")) {
            String para = msgDividido[0].trim();
            String msg = msgDividido[1].trim();
            envioAdmin(para, msg);
        } else {
            String username = session.getPathParameters().get("usuario");
            guardar(username, msgDividido[1].trim());
            envioNormal(msgDividido[1].trim(), username);
        }
    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("Sesión finalizada");
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        throwable.printStackTrace();
    }

    private void envioAdmin(String usuarioAdmin, String adminMessage) {
        Session targetSession = sesioncitas.get(usuarioAdmin);
        if (targetSession != null) {
            try {
                targetSession.getBasicRemote().sendText("Soporte: " + adminMessage);
                System.out.println("Mensaje enviado a " + usuarioAdmin + ": " + adminMessage);
            } catch (IOException e) {
                e.printStackTrace();
                System.err.println("Error al enviar mensaje a " + usuarioAdmin);
            }
        }
    }

    private void envioNormal(String mensaje, String usuario) {
        for (Session sesionUsuario : sesioncitas.values()) {
            try {
                sesionUsuario.getBasicRemote().sendText(usuario + ": " + mensaje);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void guardar(String usu, String mensajeUsu) {
        try {
            Connection con = null;
            PreparedStatement pstmt = null;
            PreparedStatement pstmt2 = null;
            conectadita conecta = new conectadita();
            con = conecta.getConnection();

            pstmt = con.prepareStatement("call sp_agregarMensajeSoporte(?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, usu);
            pstmt.setString(2, mensajeUsu);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}