package com.hospitalSystem.Service.Impl;

import com.hospitalSystem.Dao.UserModifyDao;
import com.hospitalSystem.Service.UserModifyService;
import com.hospitalSystem.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("UserModifyService")
public class UserModifyServiceImpl implements UserModifyService {
    @Autowired
    UserModifyDao userModifyDao;
    @Override
    public void UpdateAge(int age) {
        userModifyDao.UpdateAge(age);
    }

    @Override
    public void UpdateSex(String sex) {
        userModifyDao.UpdateSex(sex);
    }

    @Override
    public void UpdateIdentity_card(String identity_card) {
        userModifyDao.UpdateIdentity_card(identity_card);
    }

    @Override
    public void UpdateAddress(User user) {
        userModifyDao.UpdateAddress(user);
    }

    @Override
    public void UpdatePassword(User user) {
        userModifyDao.UpdatePassword(user);
    }

    @Override
    public void UpdateAll(User user) {
        userModifyDao.UpdateAll(user);
    }
}
