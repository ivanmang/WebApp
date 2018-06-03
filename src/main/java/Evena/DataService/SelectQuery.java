package Evena.DataService;

import java.util.ArrayList;
import java.util.List;

class SelectQuery implements Query{
  private List<String> columns = new ArrayList<>();
  private String table;
  private List<WhereClause> whereClauses = new ArrayList<>();


  public SelectQuery(String table) {
    this.table = table;
  }

  SelectQuery addColumn(String column){
    columns.add(column);
    return this;
  }

  SelectQuery addWhereClause(String Object, String Variable){
    WhereClause whereClause = new WhereClause(Object,Variable);
    whereClauses.add(whereClause);
    return this;
  }

  public String build(){
    String query= "Select ";
    if (columns.size() == 0){
      query = query.concat("* ");
    }
    else{
      for (String c : columns) {
        query = query.concat("\"" + c + "\" ");
      }
    }
    query =  query. concat("From ");
    query = query.concat("\"" + table + "\"");
    return query;
  }
}