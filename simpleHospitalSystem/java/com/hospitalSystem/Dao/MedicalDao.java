package com.hospitalSystem.Dao;

import com.hospitalSystem.bean.*;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MedicalDao {
    @Select("select * from  h_operation")
    public List<Operation> findOperation();
    @Select("select * from  h_medicine")
    public List<Medicine> findMedicine();
    @Select("select * from  h_doctor")
    public List<Doctor> findDoctor();
    @Select("select * from h_department")
    public List<Department> getDepartment();
    @Insert("insert into h_appointment values(#{username},#{department_name},#{date})")
    public void saveAppointment(Appointment appointment);
    @Delete("delete from h_appointment where username=#{username}")
    public void deleteAppointment(String username);
    @Select("select * from h_appointment")
    public List<Appointment> getAppointment();
    @Select("select count(1) from h_appointment where username =#{username}")
    public int checkUser(String username);
}
