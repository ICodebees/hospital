package com.hospitalSystem.Service;

import com.hospitalSystem.bean.*;

import java.util.List;

public interface MedicalService {
    public List<Operation> findOperation();
    public List<Medicine> findMedicine();
    public List<Doctor> findDoctor();
    public List<Department> getDepartment();
    public void saveAppointment(Appointment appointment);
    public List<Appointment> getAppointment();
    public void deleteAppointment(String username);
    public boolean checkUser(String username);
}
