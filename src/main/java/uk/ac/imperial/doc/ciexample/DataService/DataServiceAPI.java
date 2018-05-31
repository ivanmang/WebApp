package uk.ac.imperial.doc.ciexample.DataService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DataServiceAPI {

  public int select() throws SQLException {
    Connection conn = null;
    String url = "jdbc:postgresql://db.doc.ic.ac.uk:5432/g1727106_u";
    Properties connectionProps = new Properties();
    connectionProps.setProperty("user", "g1727106_u");
    connectionProps.setProperty("password", "Rjfz8pWxZM");
    conn = DriverManager.getConnection(url, connectionProps);
    int i = 0;

    try {
      String sql =  "Select * From \"Event\"";
      //String sql = new SelectQueryBuilder().setTable("Event").createSelectQuery().ReturnQuerry();
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if(result.next()) {
        i = result.getInt("Event Id");
      }
      pstmt.close();

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }
    return i;
  }

  public boolean insert() throws SQLException {
    Connection conn = null;
    String url = "jdbc:postgresql://db.doc.ic.ac.uk:5432/g1727106_u";
    Properties connectionProps = new Properties();
    connectionProps.setProperty("user", "g1727106_u");
    connectionProps.setProperty("password", "Rjfz8pWxZM");
    conn = DriverManager.getConnection(url, connectionProps);

    try {
      String sql = "Insert Into \"Event\"(\"Event Id\", \"Event Name\") Values (123,'Hello')";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      int i = pstmt.executeUpdate();
      System.out.println(i);
      pstmt.close();
      return true;

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
      return false;
    }

  }

}
