package com.hospitalSystem.bean;

public class Appointment {
    private String username;
    private String department_name;
    private String date;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "username='" + username + '\'' +
                ", department_name='" + department_name + '\'' +
                ", date=" + date +
                '}';
    }
}
