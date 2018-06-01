package Evena;

public class Event {
    private String id;
    private String name;
    private String date;
    private String about;

    public Event() {
    }

    public Event(String id, String name,String date,String about) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.about = about;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
}