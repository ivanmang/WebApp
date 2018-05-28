import java.sql.*;
import java.util.Properties;

public class Test {

  public static void main(String[] args) throws SQLException {
    Connection conn = null;
    String url = "jdbc:postgresql://db.doc.ic.ac.uk:5432/g1727106_u";
    Properties connectionProps = new Properties();
    connectionProps.setProperty("user", "g1727106_u");
    connectionProps.setProperty("password", "Rjfz8pWxZM");
    conn = DriverManager.getConnection(url, connectionProps);

    try {
      String sql = "SELECT * FROM events";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      while (result.next()) {
        System.out.println(result.getInt("eventid"));
      }

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }
  }
}
