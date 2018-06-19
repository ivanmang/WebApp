import static org.junit.Assert.assertNotEquals;

import Evena.DataService.*;
import Evena.Functions;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import junit.framework.TestCase;
import org.junit.Assert;

public class Test extends TestCase{

    public void testSimpleSelectQuery() {
        String user_id = "XX";
        String sqlStr = "Select \"userid\" From \"user\" Where \"userid\" = '" + user_id + "'";
        SelectClause s
                = new SelectClause()
                .addC_name("userid");
        WhereClause w
                = new WhereClause()
                .addWc_Name("userid")
                .addwOp("=")
                .addWVal1(user_id);
        String testStr = new SelectQueryBuilder()
                .addselectClauses(s)
                .addFromClause("user")
                .addWhereList(w)
                .build();
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
        SelectClause s
                = new SelectClause()
                .addC_name("Event Id");
        WhereClause w
                = new WhereClause()
                .addWc_Name("Event Name")
                .addwOp("=")
                .addWVal1(name);
        String test = new SelectQueryBuilder()
                .addselectClauses(s)
                .addFromClause("Event")
                .addWhereList(w)
                .build();
        Assert.assertEquals(sql, test);
    }

    public void testDataServiceAPIExistFunctionSQL() {
        int i = 0;
        String iStr = String.valueOf(i);
        String sql = "Select \"eventID\" From \"events\" Where \"eventID\" = '" + i + "'";
        SelectClause s
                = new SelectClause()
                .addC_name("eventID");
        WhereClause w
                = new WhereClause()
                .addWc_Name("eventID")
                .addwOp("=")
                .addWVal1(String.valueOf(i));
        String test = new SelectQueryBuilder()
                .addselectClauses(s)
                .addFromClause("events")
                .addWhereList(w)
                .build();
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
        String testStr = new InsertQueryBuilder()
                .addT_name("events")
                .addCols("eventID")
                .addCols("eventName")
                .addCols("eventLocation")
                .addCols("eventDate")
                .addCols("eventStart")
                .addCols("eventEnd")
                .addCols("info")
                .addCols("tagids")
                .addVals(id)
                .addVals(eventName)
                .addVals(eventLocation)
                .addVals(eventDate)
                .addVals(eventStart)
                .addVals(eventEnd)
                .addVals(info)
                .addVals(tagids)
                .build();
        Assert.assertEquals(sqlStr, testStr);
    }

    public void testSimpleDeleteQueryBuilder() {
        String x = "XX";
        String sql = "Delete From \"participants\" Where \"participantid\" = '" + x + "'";
        WhereClause w = new WhereClause().addWc_Name("participantid").addwOp("=").addWVal1(x);
        String test = new DeleteQueryBuilder()
                .addT_name("participants")
                .addWhereList(w)
                .build();
        Assert.assertEquals(sql,test);

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