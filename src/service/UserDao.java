package service;

import pojo.User;

import java.util.List;

public interface UserDao {
    public User login(User user);
    public List<User> selectAllUser(User user);
    public void updatethispsw(String newPassword,Integer userid);
    public void adduser(User user);
    public List<User> selectuser(User user);
    public User selectUserById(Integer id);
    public void deleteUserById(Integer id);
    public void updateUserById2(User user);
    public void updatePassWordById2(String newPassword,Integer id);
}
