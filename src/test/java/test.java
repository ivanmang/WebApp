import uk.ac.imperial.doc.ciexample.CIExampleBasic;
import uk.ac.imperial.doc.ciexample.DataService.DataServiceAPI;

public class test {

  public static void main(String[] args) {
    CIExampleBasic b = new CIExampleBasic();
    try {
      System.out.println(b.runSelect("Dog"));
    }
    catch (Exception e){

    }
  }
}
