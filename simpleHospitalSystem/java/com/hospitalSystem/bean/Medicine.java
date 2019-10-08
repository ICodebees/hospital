package com.hospitalSystem.bean;

public class Medicine {
    private int id;
    private String drug_name;
    private String drug_user;
    private Double price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDrug_name() {
        return drug_name;
    }

    public void setDrug_name(String drug_name) {
        this.drug_name = drug_name;
    }

    public String getDrug_user() {
        return drug_user;
    }

    public void setDrug_user(String drug_user) {
        this.drug_user = drug_user;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Medicine{" +
                "id=" + id +
                ", drug_name='" + drug_name + '\'' +
                ", drug_user='" + drug_user + '\'' +
                ", price=" + price +
                '}';
    }
}
