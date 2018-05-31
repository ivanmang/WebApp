package uk.ac.imperial.doc.ciexample;

import uk.ac.imperial.doc.ciexample.DataService.DataServiceAPI;

import java.sql.SQLException;

public class CIExampleBasic {

  private String name;


  public CIExampleBasic() { }

  public CIExampleBasic(String[] args) {
    if(args.length != 1) {
      printUsage();
    }
    this.name = args[1];
  }

  public void setParams(String name) {
    this.name = name;
  }


  public String getName() {
    return this.name;
  }

  public int runSelect(String name) throws SQLException {
    DataServiceAPI dsa = new DataServiceAPI();
    return dsa.select(name);
  }

  public boolean runInsert(int id,String name) throws SQLException {
    DataServiceAPI dsa = new DataServiceAPI();
    return dsa.insert(id,name);
  }


  public static void main(String[] args) {
//    CIExampleBasic basic = new CIExampleBasic(args);
//    int idResponse = basic.runSelect();
//    System.out.println("Selected: " + idResponse);
  }

  public void printUsage() {
    System.err.println("Usage: CIExampleBasic <string name>");
    System.exit(-1);
  }
}