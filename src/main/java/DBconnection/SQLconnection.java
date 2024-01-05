package DBconnection;
/**
 *
 * @author Vaibhav
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class SQLconnection {
static Connection con;
    /**
     *
     * @return
     */
    public static Connection getconnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_attendance","root","");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;
    }
}

