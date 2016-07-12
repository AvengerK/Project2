package bean;

/**
 * Created by 74726 on 2016/7/12 0012.
 */
public class Course {
    private String name;
    private int course_id;
    private String introduction;

    public String getName(){
        return name;
    }

    public int getId(){
        return course_id;
    }

    public void setId(int id){
        course_id = id;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}
