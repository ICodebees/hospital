package com.hospitalSystem.Service;

import com.hospitalSystem.bean.User;

public interface UserModifyService {
    public void UpdateAge(int age );
    public void UpdateSex(String sex);
    public void UpdateIdentity_card(String identity_card);
    public void UpdateAddress(User user);
    public void UpdatePassword(User user);
    public void UpdateAll(User user);
}
