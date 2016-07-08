package bean;

/**
 * Created by hou on 2016/7/4.
 */
public class Student {

    private String name;
    private String password;
    private int student_id;

    public String getName() {
        return name;
    }

    public int getStudent_id() {
        return student_id;
    }

    public String getPassword() {
        return password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }
}

