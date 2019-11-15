package pojo;

import java.util.Date;

public class User {
    Integer userid;
    String username;
    String admin;
    String password;
    String sex;
    Date date;
    String adress;
    String root;
    String tel;
    String headpath;
    public String getHeadpath() {
        return headpath;
    }

    public void setHeadpath(String headpath) {
        this.headpath = headpath;
    }
    @Override
    public String
    toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", admin='" + admin + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", date=" + date +
                ", adress='" + adress + '\'' +
                ", root='" + root + '\'' +
                ", tel='" + tel + '\'' +
                ", headpath='" + headpath + '\'' +
                '}';
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getRoot() {
        return root;
    }

    public void setRoot(String root) {
        this.root = root;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
