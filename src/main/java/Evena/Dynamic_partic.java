package Evena;

public class Dynamic_partic {
    private String id;
    private String data;
    private String memo;

    public Dynamic_partic(String id, String data , String memo) {
        this.id = id;
        this.data = data;
        this.memo = memo;
    }

    public String getId() {
        return id;
    }

    public String getData() {
        return data;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
