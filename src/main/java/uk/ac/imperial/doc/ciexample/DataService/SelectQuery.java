package uk.ac.imperial.doc.ciexample.DataService;

import java.util.List;

class SelectQuery {
  List<String> column = null;
  String table = null;

  SelectQuery(List<String> column, String table) {
    this.column = column;
    this.table = table;
  }

  String ReturnQuerry(){
    String query= "Select ";
    if (column.size() == 0){
      query = query.concat("* ");
    }
    else{
      for (String c : column) {
        query = query.concat("\"" + c + "\" ");
      }
    }
    query =  query. concat("From ");
    query = query.concat("\"" + table + "\"");
    return query;
  }
}