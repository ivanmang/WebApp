package Evena.DataService;

import static Evena.DataService.DataServiceAPI.selectAllSql;
import static Evena.DataService.DataServiceAPI.today;

import Evena.Event;
import java.sql.SQLException;

/**
 * Created by admin on 9/6/2018.
 */
public class Main {

  public static void main(String[] args)
      throws SQLException, ClassNotFoundException {
    //run to see list of outcomes when building the query
    //Testing insert query
//        InsertQueryBuilder b = new InsertQueryBuilder();
//        String insert = b.addT_name("FK").addCols("AS").addCols("KL").addVals("3").addVals("2").build();
//        System.out.println(insert);
//        //Testing select query
//        SelectQueryBuilder s = new SelectQueryBuilder();
//        SelectClause sc = new SelectClause("column", "Avg");
//        WhereClause wc = new WhereClause("phantom", "=", "3", null, null);
//        String select = s.addFromClause("fromClause").addselectClauses(sc).addWhereList(wc).build();
//        System.out.println(select);
//        //Testing delete query
//        DeleteQueryBuilder d = new DeleteQueryBuilder();
//        WhereClause wc1 = new WhereClause("phantom", "Between", "King", "Queen", "AND");
//        String del = d.addT_name("Ivana").addWhereList(wc1).addWhereList(wc).build();
//        System.out.println(del);



    String[] array = "1,2,3,4,5,6".split(",");
    for (String str : array) {
      System.out.println(str);
    }
/*    DataServiceAPI data = new DataServiceAPI();
    for (Event event : data.selectall(selectAllSql).getEvents()) {
      System.out.println(event);
    }*/
    System.out.println(today);
  }
}
