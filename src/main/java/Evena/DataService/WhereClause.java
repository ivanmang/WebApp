package Evena.DataService;

public class WhereClause {
    String Object;
    String Variable;

    public WhereClause(String object, String variable) {
        Object = object;
        Variable = variable;
    }

    String build(){
        return Object + "=" + Variable;
    }
}
