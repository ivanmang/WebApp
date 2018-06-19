package Evena.DataService;

import Evena.Event;
import Evena.EventList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class DataServiceAPI {

  private static String database = "jdbc:postgresql://db.doc.ic.ac.uk/g1727106_u?&ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";
  private static String user = "g1727106_u";
  private static String password = "Rjfz8pWxZM";
  private static DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  private static Date date = new Date();
  public static String today = dateFormat.format(date);
  public static String selectAllSql = "SELECT * FROM events";
  public static String selectUpcomingSql = "SELECT * FROM events WHERE eventdate >= \'" + today + "\'";

  public static Map<String, Integer> tagToID = new LinkedHashMap<String, Integer>() {{
    put("academic", 1);
    put("music", 2);
    put("charity", 3);
    put("cultural", 4);
    put("indoor", 5);
    put("outdoor", 6);
    put("social", 7);
    put("sport", 8);
    put("misc", 9);
  }};

//    public static void main(String[] args) {
//        String user_id = "XX";
//        String sqlStr1 = "Select \"userid\" From \"user\" Where \"userid\" = '" + user_id + "'";
//        System.out.println(sqlStr1);
//        SelectClause s = new SelectClause("userid", null);
//        WhereClause w = new WhereClause("userid", "=", user_id, null, null);
//        String testStr1 = new SelectQueryBuilder().addselectClauses(s).addFromClause("user").addWhereList(w).build();
//        System.out.println(testStr1);
//    }


  public static Connection connect() throws SQLException, ClassNotFoundException {
    Class.forName("org.postgresql.Driver");
    String url = database;
    Properties connectionProps = new Properties();
    connectionProps.setProperty("user", user);
    connectionProps.setProperty("password", password);
    return DriverManager.getConnection(url, connectionProps);


  }

  public EventList selectall(String sql) throws SQLException, ClassNotFoundException {

    Connection conn = connect();

    List<Event> events = new ArrayList<>();
    EventList eventList = new EventList();

    try {
      //String sql = new SelectQueryBuilder().setTable("Event").createSelectQuery().ReturnQuerry();
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();

      addResultSetToEventList(result, events);

      pstmt.close();

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }
    eventList.setEvents(events);
    return eventList;
  }

  public void addResultSetToEventList(ResultSet result, List<Event> events)
      throws SQLException {
    while (result.next()) {
      String date = result.getString("eventdate");
      if (date == null) {
        date = "NA";
      }
      String location = result.getString("eventlocation");
      if (location == null) {
        location = "NA";
      }
      String startTime = result.getString("eventstart");
      if (startTime == null) {
        startTime = "NA";
      }
      String endTime = result.getString("eventend");
      if (endTime == null) {
        endTime = "NA";
      }
      String about = result.getString("info");
      if (about == null) {
        about = "NA";
      }
      String tagids = result.getString("tagids");
      if (tagids == null) {
        tagids = "";
      }
      List<Integer> tags = new ArrayList<>();
      if (tagids.length() != 0) {
        for (String str : tagids.split(",")) {
          if(!str.equals("null")) {
            tags.add(Integer.valueOf(str));
          }
        }
      }
      Event event = new Event(String.valueOf(result.getInt("eventid")),
          result.getString("eventName"), date, startTime,endTime, location, about,
          tags);
      events.add(event);
    }
  }

  public int select(String name) throws SQLException, ClassNotFoundException {

    Connection conn = connect();
    int i = 0;

    try {

        SelectClause s
                = new SelectClause()
                .addC_name("eventid");
        WhereClause w
                = new WhereClause()
                .addWc_Name("eventname")
                .addwOp("=")
                .addWVal1(name);
        String sql = new SelectQueryBuilder()
                .addselectClauses(s)
                .addFromClause("events")
                .addWhereList(w)
                .build();
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if (result.next()) {
        i = result.getInt("eventId");
      }
      pstmt.close();

    } catch (Exception e) {
      System.out.println(e.getMessage());
      e.printStackTrace();
    }
    return i;
  }

  public boolean insert(int id, String eventName, String eventDate, String eventStart, String eventEnd, String eventLocation, String info, String tagids)
      throws SQLException, ClassNotFoundException {
    Class.forName("org.postgresql.Driver");

    Connection conn = connect();

    try {
      String idStr = String.valueOf(id);
      String sql =
              new InsertQueryBuilder()
                      .addT_name("events")
                      .addCols("eventID")
                      .addCols("eventName")
                      .addCols("eventLocation")
                      .addCols("eventDate")
                      .addCols("eventStart")
                      .addCols("eventEnd")
                      .addCols("info")
                      .addCols("tagids")
                      .addVals(idStr)
                      .addVals(eventName)
                      .addVals(eventLocation)
                      .addVals(eventDate)
                      .addVals(eventStart)
                      .addVals(eventEnd)
                      .addVals(info)
                      .addVals(tagids)
                      .build();
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

  public boolean exist(int i) throws SQLException, ClassNotFoundException {

    Connection conn = connect();

    try {
        SelectClause s
                = new SelectClause()
                .addC_name("eventid");
        WhereClause w
                = new WhereClause()
                .addWc_Name("eventid")
                .addwOp("=")
                .addWVal1(String.valueOf(i));
        String sql = new SelectQueryBuilder()
                .addselectClauses(s)
                .addFromClause("events")
                .addWhereList(w)
                .build();
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet result = pstmt.executeQuery();
      if (result.next()) {
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
