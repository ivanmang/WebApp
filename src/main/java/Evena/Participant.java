package Evena;

public class Participant {
    private String id;
    private String name;
    private String specinfo;
    public Participant() {
    }

    public Participant(String id, String name, String specinfo) {
        this.id = id;
        this.name = name;
        this.specinfo = specinfo;
    }

    public void setSpecinfo(String specinfo) {
        this.specinfo = specinfo;
    }
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecinfo() {
        return specinfo;
    }
    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
