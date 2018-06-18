package Evena.DataService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 8/6/2018.
 */
public class SelectQueryBuilder implements QueryBuilder{
    private List<SelectClause> selectClauses = new ArrayList<>();
    private String t_name;
    private List<WhereClause> whereList = new ArrayList<>();

    public SelectQueryBuilder(){};
    public SelectQueryBuilder aSelectQueryBuilder(){
        return new SelectQueryBuilder();
    }
    public SelectQueryBuilder addselectClauses(SelectClause selectClause) {
        selectClauses.add(selectClause);
        return this;
    }
    public SelectQueryBuilder addFromClause(String t_name) {
        this.t_name = t_name;
        return this;
    }
    public SelectQueryBuilder addWhereList(WhereClause whereClause) {
        whereList.add(whereClause);
        return this;
    }

    public String build() {
        String query = "Select ";
        if (selectClauses.size() == 0) {
            query = query.concat("* ");
        } else {
            for (SelectClause s : selectClauses) {
                if (s.getFunc() != null) {
                    query = query.concat(s.getFunc() + "(" + s.addC_name() + ") ");
                } else {
                    query = query.concat(s.addC_name() + " ");
                }
            }
        }
        query = query.concat("From ");
        query = query.concat("\"" + t_name + "\" ");
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
