package Evena;

import java.util.List;

public class Event {
    private String id;
    private String name;
    private String location;
    private String date;
    private String startTime;
    private String endTime;
    private String about;
    private List<Integer> tags;

    public Event() {
    }

    public Event(String id, String name, String location, String date, String startTime, String endTime, String about,
        List<Integer> tags) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
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
