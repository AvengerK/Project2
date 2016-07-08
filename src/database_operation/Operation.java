package database_operation;

import bean.Student;

import java.sql.*;
import java.util.Objects;

/**
 * Project2
 * Created by hou on 2016/7/6 21:31 21:32.
 */
public class Operation {

    private Connection connection = null;
    private final String SUCCESSFULLY_LOGIN="CORRECT";
    private final String INCORRECT_PASSWORD="INCORRECT";

    //加载数据库的方法
    private void loadDatabase(){

        try {
            String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
            Class.forName(DATABASE_DRIVER);
            String DATABASE_PASSWORD = "";
            String DATABASE_USER = "root";
            String DATABASE_URL = "jdbc:mysql://localhost:3306/innovation_experiment_class";
            connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //数据库操作方法，返回结果集。参数为操作语句，可选参数为数据库项目
    public ResultSet exec(String sql,Object... args){
        try {
            loadDatabase();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            for (int i=0;i<args.length;i++){
                preparedStatement.setObject(i+1,args[i]);
            }
            preparedStatement.execute();
            return preparedStatement.getResultSet();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    //关闭数据库方法
    private void close(){
        if (connection!=null){
            try {
                connection.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    //检查ID和密码是否正确，返回字符串
    public String checkUser(String id, String password){

        ResultSet resultSet;
        try {
            resultSet=exec("SELECT * FROM student_signup");
        }catch (Exception e){
            e.printStackTrace();
            close();
            return null;
        }

        try {
            while (resultSet.next()){
                String temp_id = resultSet.getString("student_id");
                String temp_password=resultSet.getString("password").trim();
                if (Objects.equals(temp_id, id)){
                    if (password.equals(temp_password)){
                        close();
                        return SUCCESSFULLY_LOGIN;
                    }
                    close();
                    return INCORRECT_PASSWORD;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        close();
        return "NO SUCH USER";
    }

    //检查管理员ID和密码是否输入正确
    public String checkAdmin(String admin_id,String password){
        ResultSet resultSet;
        try {
            resultSet=exec("SELECT * FROM admin");
        }catch (Exception e){
            e.printStackTrace();
            close();
            return null;
        }

        try {
            while (resultSet.next()){
                String temp_admin_id=resultSet.getString("admin_id");
                String temp_password=resultSet.getString("password");
                if (admin_id.equals(temp_admin_id)){
                    if (password.equals(temp_password)){
                        close();
                        return SUCCESSFULLY_LOGIN;
                    }
                    close();
                    return INCORRECT_PASSWORD;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        close();
        return "NO SUCH ADMIN";
    }

    //选择方法，返回符合条件的一个学生对象
    public Student select(String tableName,String key,String value) throws SQLException{
        Student student=new Student();
        ResultSet resultSet=exec("SELECT * FROM "+tableName+" WHERE "+key+"="+value);
        if (resultSet.next()){
            student.setName(resultSet.getString("name"));
            student.setStudent_id(resultSet.getInt("student_id"));
            student.setPassword(resultSet.getString("password"));
            return student;
        }
        return null;
    }

}
