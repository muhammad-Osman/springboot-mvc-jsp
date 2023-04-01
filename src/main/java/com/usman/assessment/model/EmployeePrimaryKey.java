package com.usman.assessment.model;

import java.io.Serializable;

public class EmployeePrimaryKey implements Serializable {

    private Long id;
    private String manager;

    public EmployeePrimaryKey() {
    }

    public EmployeePrimaryKey(Long id, String manager) {
        this.id = id;
        this.manager = manager;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    @Override
    public String toString() {
        return "EmployeePrimaryKey{" +
                "id=" + id +
                ", manager='" + manager + '\'' +
                '}';
    }

}
