package Evena;

import java.util.List;

public class Event {
    private String id;
    private String name;
    private String date;
    private String about;
    private List<Integer> tags;

    public Event() {
    }

    public Event(String id, String name, String date, String about,
        List<Integer> tags) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.about = about;
        this.tags = tags;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Integer> getTags() {
        return tags;
    }

    public void setTags(List<Integer> tags) {
        this.tags = tags;
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

    @Override
    public String toString() {
      StringBuilder str = new StringBuilder();
      str.append("id = ").append(id).append(" name = ").append(name).append(" date = ").append(date).append(" about = ").append(about);
      int tagnum = 1;
      for(Integer tag : tags) {
        str.append(" tag").append(tagnum).append(" = ").append(tag);
        tagnum++;
      }
      return str.toString();
    }
}
