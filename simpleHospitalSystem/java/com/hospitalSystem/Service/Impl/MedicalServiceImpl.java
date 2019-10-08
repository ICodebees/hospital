package com.hospitalSystem.Service.Impl;



import com.hospitalSystem.Dao.MedicalDao;
import com.hospitalSystem.Service.MedicalService;
import com.hospitalSystem.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("MedicalService")
public class MedicalServiceImpl implements MedicalService {
    @Autowired
    MedicalDao medicalDao;
    private Appointment appointment;

    @Override
    public List<Operation> findOperation() {
        List<Operation>lists = medicalDao.findOperation();
        return lists;
    }

    @Override
    public List<Medicine> findMedicine() {
        List<Medicine> lists= medicalDao.findMedicine();
        return lists;
    }

    @Override
    public List<Doctor> findDoctor() {
        List<Doctor> lists= medicalDao.findDoctor();
        return lists;
    }

    @Override
    public List<Department> getDepartment() {
        List<Department>lists=medicalDao.getDepartment();
        return lists;
    }

    @Override
    public void saveAppointment(Appointment appointment) {
        medicalDao.saveAppointment(appointment);
    }

    @Override
    public List<Appointment> getAppointment() {
        List<Appointment>lists=medicalDao.getAppointment();
        return lists;
    }

    @Override
    public void deleteAppointment(String username) {
        medicalDao.deleteAppointment(username);
    }

    public boolean checkUser(String username){
        int count=medicalDao.checkUser(username);
        return count == 0;
    }

}
