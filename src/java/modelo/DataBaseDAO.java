package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseDAO {

    Connection conn;

    public void conectar() throws Exception {
        String url = "jdbc:mysql://localhost/odonto";
        String user = "root";
        String pass = "";
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
    }

    public void desconectar() throws Exception {
        if (!conn.isClosed()) {
            conn.close();
        }
    }
}
