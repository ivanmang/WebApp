package Evena;

public class Participant {
    private String id;
    private String name;
    private String email;
    private String phone;
    private String age;
    private String gender;
    private String specinfo;



    public Participant() {
    }

    public Participant(String id, String name, String email, String phone, String age, String gender, String specinfo) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.age = age;
        this.gender = gender;
        this.specinfo = specinfo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSpecinfo() {
        return specinfo;
    }

    public void setSpecinfo(String specinfo) {
        this.specinfo = specinfo;
    }
}
