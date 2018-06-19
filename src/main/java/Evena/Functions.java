package Evena;

import Evena.DataService.DataServiceAPI;

import java.awt.FlowLayout;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class Functions {

  private String name;


  public Functions() { }

  public Functions(String[] args) {
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

  public int runSelect(String name) throws SQLException, ClassNotFoundException {
    DataServiceAPI dsa = new DataServiceAPI();
    return dsa.select(name);
  }

  public boolean runInsert(int id,String name,String date,String startTime, String endTime, String location,String about, String tagids) throws SQLException, ClassNotFoundException {
    DataServiceAPI dsa = new DataServiceAPI();
    return dsa.insert(id,name,date,startTime,endTime,location,about, tagids);
  }


  public static void main(String[] args) {
  }

  public void printUsage() {
    System.err.println("Usage: Functions <string name>");
    System.exit(-1);
  }
}