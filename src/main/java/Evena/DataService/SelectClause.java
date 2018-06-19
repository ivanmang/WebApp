package Evena.DataService;

/**
 * Created by admin on 8/6/2018.
 */
public class SelectClause {
    private String c_name;
    private String func = null;

    public SelectClause() {}

    public String plusC_name() {
        return "\"" + c_name + "\"";
    }
    public SelectClause addC_name(String c_name){
        this.c_name = c_name;
        return this;
    }

    public String getFunc() {
        return func;
    }
}
