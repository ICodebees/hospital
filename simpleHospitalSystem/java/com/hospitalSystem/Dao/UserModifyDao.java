package com.hospitalSystem.Dao;

import com.hospitalSystem.bean.User;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface UserModifyDao {
    @Update("update h_user set age = #{age} where username=#{username}")
    public void UpdateAge(int age );
    @Update("update h_user set sex = #{sex} where username=#{username}")
    public void UpdateSex(String sex);
    @Update("update h_user set identity_card = #{identity_card} where username=#{username}")
    public void UpdateIdentity_card(String identity_card);
    @Update("update h_user set address = #{address} where username=#{username}")
    public void UpdateAddress(User user);
    @Update("update h_user set password = #{password} where username=#{username}")
    public void UpdatePassword(User user);
    @Update("update h_user set password = #{password},address = #{address},age = #{age},identity_card = #{identity_card},sex = #{sex} where username=#{username}")
    public void UpdateAll(User user);
}
