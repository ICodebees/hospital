package com.hospitalSystem.Service.Impl;

import com.hospitalSystem.Dao.UserDao;
import com.hospitalSystem.Service.UserService;
import com.hospitalSystem.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("UserService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public int findUserIsExist(User user) {
        return userDao.findUserIsExist(user);
    }

    @Override
    public String verify_password(String username) {
        return userDao.verify_password(username);
    }

    @Override
    public User findUserById(String username) {
        return userDao.findUserById(username);
    }
}
