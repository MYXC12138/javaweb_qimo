package tools;

//数据库有关的包，都在sql
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UTIL {
    public static Connection getCon(){
        Connection con=null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try {
                con= DriverManager.getConnection("" +
                                "jdbc:oracle:thin:@localhost:1521:XE",
                        "system","sun");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }

    public static void main(String[] args) {
        System.out.println(getCon());
    }
}

