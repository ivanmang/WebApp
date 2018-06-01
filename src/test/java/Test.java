import static org.junit.Assert.assertNotEquals;

import Evena.Functions;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import junit.framework.TestCase;

public class Test extends TestCase{

  public void testDatabaseConnectedToBackEnd() throws SQLException, ClassNotFoundException {
    Class.forName("org.postgresql.Driver");

    Connection conn = null;
    String url = "jdbc:postgresql://db.doc.ic.ac.uk/g1727106_u?&ssl=true" + "&sslfactory=org.postgresql.ssl.NonValidatingFactory";
    Properties connectionProps = new Properties();
    connectionProps.setProperty("user", "g1727106_u");
    connectionProps.setProperty("password", "Rjfz8pWxZM");
    conn = DriverManager.getConnection(url, connectionProps);
    assertNotEquals(conn, null);
  }

  public void testSelectAndInsertFunction() throws SQLException, ClassNotFoundException {
    Class.forName("org.postgresql.Driver");

    int var = 3;
    Functions func = new Functions();
    func.runInsert(257, "cat", "09-09-2019", null);
    var = func.runSelect("cat");
    assertEquals(var, 257);

    //delete entry in database
    Connection conn = null;
    String url = "jdbc:postgresql://db.doc.ic.ac.uk/g1727106_u?&ssl=true" + "&sslfactory=org.postgresql.ssl.NonValidatingFactory";
    Properties connectionProps = new Properties();
    connectionProps.setProperty("user", "g1727106_u");
    connectionProps.setProperty("password", "Rjfz8pWxZM");
    conn = DriverManager.getConnection(url, connectionProps);
    try {
      String sql = "DELETE FROM \"Event\" WHERE \"Event Id\" = " + var;
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.executeUpdate();
      pstmt.close();
    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }


  }

}