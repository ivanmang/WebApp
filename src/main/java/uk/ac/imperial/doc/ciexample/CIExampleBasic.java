package uk.ac.imperial.doc.ciexample;

import java.util.Arrays;
import java.util.List;

public class CIExampleBasic {

  private String id, name;

  public CIExampleBasic() { }

  public CIExampleBasic(String[] args) {
    if(args.length != 2) {
      printUsage();
    }

    this.id = args[1];
    this.name = args[2];
  }

  public void setParams(String id, String name) {
    this.id = id;
    this.name = name;
  }

  public String getId() {
    return this.id;
  }

  public String getName() {
    return this.name;
  }


  public static void main(String[] args) {
    CIExampleBasic basic = new CIExampleBasic(args);
    String id = basic.getId();
    String name = basic.getName();
    System.out.println("Result is: " + id + ", " + name);
  }

  public void printUsage() {
    System.err.println("Usage: CIExampleBasic <string id> <string name>");
    System.exit(-1);
  }
}