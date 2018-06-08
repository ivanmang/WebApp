package Evena.DataService;

public class WhereClause {
    private String wc_name;
    private String wOp;
    private String wVal1;
    private String wVal2;
    private String next;

    public WhereClause(String wc_name, String wOp, String wVal1, String next) {
        this.wc_name = wc_name;
        this.wOp = wOp;
        this.wVal1 = wVal1;
        this.wVal2 = null;
        this.next = next;
    }

    public String addwc_name() {
        return "\"" + wc_name + "\"";
    }

    public String getwOp() {
        return wOp;
    }

    public String addwVal1() {
        return "'" + wVal1 + "'";
    }

    public String addwVal2() {
        return "'" + wVal2 + "'";
    }

    public String getNext() {
        return next;
    }

    public void setwVal2(String wVal2) {
        this.wVal2 = wVal2;
    }
}
