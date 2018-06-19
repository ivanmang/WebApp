package Evena.DataService;

public class WhereClause {
    private String wc_name;
    private String wOp;
    private String wVal1;
    private String wVal2;
    private String next;

    public WhereClause() {
        this.wVal2 = null;
        this.next  = null;
    }

    public WhereClause addWc_Name(String wc_name){
        this.wc_name = wc_name;
        return this;
    }
    public WhereClause addwOp(String wOp){
        this.wOp = wOp;
        return this;
    }
    public WhereClause addWVal1(String wVal1){
        this.wVal1 = wVal1;
        return this;
    }
    public WhereClause addWVal2(String wVal2){
        this.wVal2 = wVal2;
        return this;
    }
    public WhereClause addNext(String next){
        this.next = next;
        return this;
    }


    public String plusWc_name() {
        return "\"" + wc_name + "\"";
    }

    public String getwOp() {
        return wOp;
    }

    public String plusWVal1() {
        return "'" + wVal1 + "'";
    }

    public String plusWVal2() {
        return "'" + wVal2 + "'";
    }

    public String getNext() {
        return next;
    }

    public void setwVal2(String wVal2) {
        this.wVal2 = wVal2;
    }
}
