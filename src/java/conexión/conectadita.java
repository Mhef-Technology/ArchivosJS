package conexión;

import java.io.Serializable;
import java.sql.*;

public class conectadita implements Serializable{

    public static String user = "root";
    public static String password = "1234";
    public static String db = "Bitcube";
    public static String port = "3306";

    public boolean testDriver() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Connection getConnection(String user, String password, String db, String server) {
        String url = null;
        if (user == null || password == null || db == null || server == null) {
            return null;
        }
        if ("".equals(user) || "".equals(password) || "".equals(db) || "".equals(server)) {
            return null;
        }
        url = String.format("jdbc:mysql://%s:%s/%s?user=%s&password=%s", server, port, db, user, password);
        try {
            if (!testDriver()) {
                return null;
            }
            return DriverManager.getConnection(url);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Connection getConnection() {
        return getConnection(user, password, db, "localhost");
    }

    public void closeConnection(Connection connection) {
        try {
            if (connection == null) {
                return;
            }
            if (connection.isClosed()) {
                return;
            }
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
