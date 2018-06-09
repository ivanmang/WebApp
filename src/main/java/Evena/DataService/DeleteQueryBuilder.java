package Evena.DataService;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

/**
 * Created by admin on 8/6/2018.
 */
public class DeleteQueryBuilder implements QueryBuilder{
    private String t_name;
    private List<WhereClause> whereList = new ArrayList<>();


    public DeleteQueryBuilder(){}
    public DeleteQueryBuilder aDeleteQueryBuilder(){
        return new DeleteQueryBuilder();
    }
    public DeleteQueryBuilder addT_name(String t_name) {
        this.t_name = t_name;
        return this;
    }
    public DeleteQueryBuilder addWhereList(WhereClause whereClause) {
        whereList.add(whereClause);
        return this;
    }


    public String build() {
        String query = "Delete From ";
        query = query.concat("\"" + t_name + "\"");
        if (whereList.size() == 0) {
            return query;
        } else {
            query = query.concat("Where ");
            for (WhereClause where : whereList) {
                if (where.getwOp() == "Between") {
                    query = query.concat(where.addwc_name() + " " + where.getwOp() + " "
                            + where.addwVal1() + " " + "And " + where.addwVal2());
                } else {
                    query = query.concat(where.addwc_name() + " " + where.getwOp() + " "
                            + where.addwVal1());
                }
                if (where.getNext() != null) {
                    query = query.concat(" " + where.getNext() + " ");
                }
            }
        }
        return query;
    }
}
