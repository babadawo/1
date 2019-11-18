package service;

import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.User;

import java.util.List;

@Service
public class UserDaoImpl implements UserDao {

    @Autowired
    UserMapper mapper;

    @Override
    public User login(User user) {
        return mapper.login(user);
    }

    @Override
    public List<User> selectAllUser(User user) {
        return mapper.selectAllUser(user);
    }

    @Override
    public void updatethispsw(String newPassword, Integer userid) {
        mapper.updatethispsw(newPassword,userid);
    }

    @Override
    public void adduser(User user) {
        mapper.adduser(user);
    }

    @Override
    public List<User> selectuser(User user) {
        return mapper.selectuser(user);
    }


    @Override
    public User selectUserById(Integer id) {
        return mapper.selectUserById(id);
    }

    @Override
    public void deleteUserById(Integer id) {
        mapper.deleteUserById(id);
    }

    @Override
    public void updateUserById2(User user) {
        mapper.updateUserById2(user);
    }

    @Override
    public void updatePassWordById2(String newPassword, Integer id) {
        mapper.updatePassWordById2(newPassword,id);
    }

    @Override
    public int check(String admin) {
        return mapper.check(admin);
    }
}
