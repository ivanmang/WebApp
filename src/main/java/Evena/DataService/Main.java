package Evena.DataService;

import com.sun.org.apache.xpath.internal.SourceTree;

/**
 * Created by admin on 9/6/2018.
 */
public class Main {
    public static void main(String[] args) {
        //run to see list of outcomes when building the query
        //Testing insert query
        InsertQueryBuilder b = new InsertQueryBuilder();
        String insert = b.addT_name("FK").addCols("AS").addCols("KL").addVals("3").addVals("2").build();
        System.out.println(insert);
        //Testing select query
        SelectQueryBuilder s = new SelectQueryBuilder();
        SelectClause sc = new SelectClause("column", "Avg");
        WhereClause wc = new WhereClause("phantom", "=", "3", null);
        String select = s.addFromClause("fromClause").addselectClauses(sc).addWhereList(wc).build();
        System.out.println(select);
    }
}
