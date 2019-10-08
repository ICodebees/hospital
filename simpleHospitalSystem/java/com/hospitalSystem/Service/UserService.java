package com.hospitalSystem.Service;
import com.hospitalSystem.bean.User;
import java.util.List;
public interface UserService {
    public List<User> findAll ();
    public void saveUser(User user);
    public int findUserIsExist(User user);
    public String verify_password(String username);
    public User findUserById(String username);
}
