package project;
import java.sql.*;

public class ConnectionProviderclass {
    private static Connection conn = null;

    private ConnectionProviderclass() {
    }

    public static Connection getConnection() {
        try {
            if (conn == null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://127.0.0.1:3306/rahul";
                    String userName = "root";
                    String passWord = "123456";
                    conn = DriverManager.getConnection(url, userName, passWord);
                } catch (Exception e) {
                    System.out.print(e);
                }
            }
        } catch (Exception e) {
            System.out.print(e);

        }
        return conn;
    }
}