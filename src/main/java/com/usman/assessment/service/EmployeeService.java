package com.usman.assessment.service;

import com.usman.assessment.model.Employee;

import java.util.List;
import java.util.Optional;

public interface EmployeeService {

    public List<Employee> fetchAllEmployees();
    public Optional<Employee> fetchEmployeeById(Long id);
    public boolean saveOrUpdateEmployee(Employee employee);
    public boolean deleteEmployee(Long id);

}
