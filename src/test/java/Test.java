import static org.junit.Assert.assertNotEquals;

import Evena.DataService.InsertQueryBuilder;
import Evena.DataService.SelectClause;
import Evena.DataService.SelectQueryBuilder;
import Evena.DataService.WhereClause;
import Evena.Functions;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import jdk.nashorn.internal.objects.annotations.Where;
import junit.framework.TestCase;
import org.junit.Assert;

public class Test extends TestCase{

//    public static void main(String[] args) {
//        String user_id = "XX";
//        String sqlStr1 = "Select \"userid\" From \"user\" Where \"userid\" = '" + user_id + "'";
//        System.out.println(sqlStr1);
//        SelectClause s = new SelectClause("userid", null);
//        WhereClause w = new WhereClause("userid", "=", user_id, null, null);
//        String testStr1 = new SelectQueryBuilder().addselectClauses(s).addFromClause("user").addWhereList(w).build();
//        System.out.println(testStr1);
//    }

    public void testSimpleSelectQuery() {
        String user_id = "XX";
        String sqlStr = "Select \"userid\" From \"user\" Where \"userid\" = '" + user_id + "'";
        SelectClause s = new SelectClause("userid", null);
        WhereClause w = new WhereClause("userid", "=", user_id, null, null);
        String testStr = new SelectQueryBuilder().addselectClauses(s).addFromClause("user").addWhereList(w).build();
        Assert.assertEquals(sqlStr, testStr);
    }

    public void testSimpleInsertQuery() {
        String user_id = "XX";
        String username = "YY";
        String password = "ZZ";
        String sqlStr = "Insert Into \"user\"(userid, username, password) Values (" + "'"+ user_id+"'" +", '" +
                username + "', '"+ password + "')";
        String testStr = new InsertQueryBuilder().addT_name("user").addCols("userid").
                addCols("username").addCols("password").addVals(user_id).addVals(username)
                .addVals(password).build();
        Assert.assertEquals(sqlStr, testStr);
    }

    public void testDataServiceAPISelectFunctionSQL() {
        String name = "Tim";
        String sql = "Select \"Event Id\" From \"Event\" Where \"Event Name\" = '" + name
                + "'";
        SelectClause s = new SelectClause("Event Id", null);
        WhereClause w = new WhereClause("Event Name", "=", name, null, null);
        String test = new SelectQueryBuilder().addselectClauses(s).addFromClause("Event")
                .addWhereList(w).build();
        Assert.assertEquals(sql, test);
    }

    public void testDataServiceAPIExistFunctionSQL() {
        int i = 0;
        String iStr = String.valueOf(i);
        String sql = "Select \"eventID\" From \"events\" Where \"eventID\" = '" + i + "'";
        SelectClause s = new SelectClause("eventID", null);
        WhereClause w = new WhereClause("eventID", "=", iStr, null, null);
        String test = new SelectQueryBuilder().addselectClauses(s).addFromClause("events").addWhereList(w).build();
        Assert.assertEquals(sql,test);
    }

    public void testDataServiceAPIInsertFunctionSQL() {
        String id = "AA";
        String eventName = "BB";
        String eventLocation = "CC";
        String eventDate = "DD";
        String eventStart = "EE";
        String eventEnd = "FF";
        String info = "GG";
        String tagids = "HH";
        String sqlStr = "Insert Into \"events\"(eventID, eventName, eventLocation, eventDate, eventStart, eventEnd, info, tagids) Values ('"
                + id + "', '" + eventName + "', '" + eventLocation + "', '" + eventDate + "', '" + eventStart + "', '" + eventEnd +  "', '" + info
                + "', '" + tagids + "')";
        String testStr = new InsertQueryBuilder().addT_name("events").addCols("eventID").addCols("eventName")
                .addCols("eventLocation").addCols("eventDate").addCols("eventStart").addCols("eventEnd")
                .addCols("info").addCols("tagids").addVals(id).addVals(eventName).addVals(eventLocation)
                .addVals(eventDate).addVals(eventStart).addVals(eventEnd).addVals(info).addVals(tagids).build();
        Assert.assertEquals(sqlStr, testStr);
    }




//  public void testDatabaseConnectedToBackEnd() throws SQLException, ClassNotFoundException {
//    Class.forName("org.postgresql.Driver");
//
//    Connection conn = null;
//    String url = "jdbc:postgresql://db.doc.ic.ac.uk/g1727106_u?&ssl=true" + "&sslfactory=org.postgresql.ssl.NonValidatingFactory";
//    Properties connectionProps = new Properties();
//    connectionProps.setProperty("user", "g1727106_u");
//    connectionProps.setProperty("password", "Rjfz8pWxZM");
//    conn = DriverManager.getConnection(url, connectionProps);
//    assertNotEquals(conn, null);
//  }

//  public void testSelectAndInsertFunction() throws SQLException, ClassNotFoundException {
//    Class.forName("org.postgresql.Driver");
//
//    int var;
//    Functions func = new Functions();
//    func.runInsert(26, "IVANVeryLengJai6", "09-09-2019", "IVAN", "IVAN", "IVAN", "IVAN", "IVAN");
//    var = func.runSelect("IVANVeryLengJai6");
//    assertEquals(var, 26);

//    //delete entry in database
//    Connection conn = null;
//    String url = "jdbc:postgresql://db.doc.ic.ac.uk/g1727106_u?&ssl=true" + "&sslfactory=org.postgresql.ssl.NonValidatingFactory";
//    Properties connectionProps = new Properties();
//    connectionProps.setProperty("user", "g1727106_u");
//    connectionProps.setProperty("password", "Rjfz8pWxZM");
//    conn = DriverManager.getConnection(url, connectionProps);
//    try {
//      String sql = "DELETE FROM \"Event\" WHERE \"Event Id\" = " + var;
//      PreparedStatement pstmt = conn.prepareStatement(sql);
//      pstmt.executeUpdate();
//      pstmt.close();
//    } catch (Exception e) {
//      System.out.println(e.getMessage());
//      e.printStackTrace();
//    }


//  }

}