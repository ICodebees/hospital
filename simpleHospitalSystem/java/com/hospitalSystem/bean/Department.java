package com.hospitalSystem.bean;

public class Department {
    private String department_name;

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    @Override
    public String toString() {
        return "Department{" +
                "department_name='" + department_name + '\'' +
                '}';
    }
}
