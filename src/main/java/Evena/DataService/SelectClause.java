package Evena.DataService;

/**
 * Created by admin on 8/6/2018.
 */
public class SelectClause {
    private String c_name;
    private String func;

    public SelectClause(String c_name, String func) {
        this.c_name = c_name;
        this.func = func;
    }

    public String addC_name() {
        return "\"" + c_name + "\"";
    }

    public String getFunc() {
        return func;
    }
}
