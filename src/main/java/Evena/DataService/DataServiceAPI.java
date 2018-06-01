package Evena.DataService;

import Evena.Event;
import Evena.EventList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class DataServiceAPI {

    public EventList selectall() throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");

        Connection conn = null;
        String url = "jdbc:postgresql://db.doc.ic.ac.uk/g1727106_u?&ssl=true" + "&sslfactory=org.postgresql.ssl.NonValidatingFactory";
        Properties connectionProps = new Properties();
        connectionProps.setProperty("user", "g1727106_u");
        connectionProps.setProperty("password", "Rjfz8pWxZM");
        conn = DriverManager.getConnection(url, connectionProps);

        List<Event> events = new ArrayList<>();
        EventList eventList = new EventList();

        try {
            String sql =  "Select * From \"Event\"";
            //String sql = new SelectQueryBuilder().setTable("Event").createSelectQuery().ReturnQuerry();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet result = pstmt.executeQuery();

            while(result.next()){
                String date = result.getString("Date");
                if (date == null){
                    date = "NA";
                }
                String about = result.getString("About");
                if (about == null){
                    about = "NA";
                }
                Event event = new Event(String.valueOf(result.getInt("Event Id")),result.getString("Event Name"),date,about);
                events.add(event);
            }
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        eventList.setEvents(events);
        return eventList;
    }

  public int select(String name) throws SQLException {
    Connection conn = null;
    String url = "jdbc:postgresql://db.doc.ic.ac.uk/g1727106_u?&ssl=true" + "&sslfactory=org.postgresql.ssl.NonValidatingFactory";
    Properties connectionProps = new Properties();
    connectionProps.setProperty("user", "g1727106_u");
    connectionProps.setProperty("password", "Rjfz8pWxZM");
    conn = DriverManager.getConnection(url, connectionProps);
    int i = 0;

    try {
      String sql =  "Select \"Event Id\" From \"Event\" Where \"Event Name\" = '" + name + "' ";
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

  public boolean insert(int id, String name,String Date,String about) throws SQLException {
    Connection conn = null;
    String url = "jdbc:postgresql://db.doc.ic.ac.uk/g1727106_u?&ssl=true" + "&sslfactory=org.postgresql.ssl.NonValidatingFactory";
    Properties connectionProps = new Properties();
    connectionProps.setProperty("user", "g1727106_u");
    connectionProps.setProperty("password", "Rjfz8pWxZM");
    conn = DriverManager.getConnection(url, connectionProps);

    try {
      String sql = "Insert Into \"Event\"(\"Event Id\", \"Event Name\" , \"Date\",\"About\") Values (" + id +" , '" + name + "', '"+ Date + "', '" + about +"')";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.executeUpdate();
      pstmt.close();
      return true;

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
      return false;
    }

  }

    public boolean exist(int i) throws SQLException {
        Connection conn = null;
        String url = "jdbc:postgresql://db.doc.ic.ac.uk/g1727106_u?&ssl=true" + "&sslfactory=org.postgresql.ssl.NonValidatingFactory";
        Properties connectionProps = new Properties();
        connectionProps.setProperty("user", "g1727106_u");
        connectionProps.setProperty("password", "Rjfz8pWxZM");
        conn = DriverManager.getConnection(url, connectionProps);

        try {
            String sql =  "Select \"Event Id\" From \"Event\" Where \"Event Id\" = '" + i + "' ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet result = pstmt.executeQuery();
            if(result.next()) {
                return true;
            }
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

}
