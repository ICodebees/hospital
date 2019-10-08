package com.hospitalSystem.Dao;

import com.hospitalSystem.bean.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserDao {

    @Select("select * from h_user")
    public List<User> findAll ();
    @Insert("insert into h_user values(#{username},#{age},#{sex},#{identity_card},#{address},#{password})")
    public void saveUser(User user);
    @Select("select count(1) from h_user where username =#{username}")
    public int findUserIsExist(User user);
    @Select("select password from h_user where username =#{username}")
    public String verify_password(String username);
    @Select("select * from h_user where username = #{username}")
    public User findUserById(String username);
}
