package Evena;

public enum Tags {
  MUSIC(1, "music"), SPORT(2, "sport"), MISC(3, "misc");

  private int tagid;
  private String tagname;

  Tags(int tagid, String tagname) {
    this.tagid = tagid;
    this.tagname = tagname;
  }

  public int getTagid() {
    return tagid;
  }

  public String getTagname() {
    return tagname;
  }

  static {
  }
}


