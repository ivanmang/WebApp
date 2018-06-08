package Evena.DataService;

import java.util.List;
import java.util.ListIterator;

/**
 * Created by admin on 8/6/2018.
 */
public class InsertQueryBuilder implements QueryBuilder{
    private String t_name;
    private List<String> cols;
    private List<String> vals;

    public InsertQueryBuilder(){}
    public InsertQueryBuilder anInsertQueryBuilder(){
        return new InsertQueryBuilder();
    }
    public InsertQueryBuilder addT_name(String t_name){
        this.t_name = t_name;
        return this;
    }
    public InsertQueryBuilder addCols(String col){
        cols.add(col);
        return this;
    }
    public InsertQueryBuilder addVals(String val){
        vals.add(val);
        return this;
    }

    public String build() {
        String query = "Insert Into ";
        if (cols.size() == 0) {
            return null;
        }
        ListIterator<String> iterator = cols.listIterator();
        query = query.concat(t_name + "(" + iterator.next());
        while (iterator.hasNext()) {
            query = query.concat(", " + iterator.next());
        }
        iterator = vals.listIterator();
        query = query.concat(") Values('" + iterator.next() + "'");
        while (iterator.hasNext()) {
            query = query.concat(", '" + iterator.next() + "'");
        }
        query = query.concat(")");
        return query;
    }
}
