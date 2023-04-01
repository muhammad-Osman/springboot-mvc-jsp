package com.usman.assessment.service.impl;

import com.usman.assessment.model.Employee;
import com.usman.assessment.model.EmployeePrimaryKey;
import com.usman.assessment.repository.EmployeeRepository;
import com.usman.assessment.service.EmployeeService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeRepository employeeRepository;

    public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Override
    public List<Employee> fetchAllEmployees() {
        return employeeRepository.findAll();
    }

    @Override
    public Optional<Employee> fetchEmployeeById(Long id) {
        EmployeePrimaryKey employeePrimaryKey = new EmployeePrimaryKey();
        employeePrimaryKey.setId(id);
        return employeeRepository.findEmployeeById(employeePrimaryKey.getId());
    }

    @Override
    public boolean saveOrUpdateEmployee(Employee employee) {
        System.out.println("\n hurry working => " + employee + "\n");
        employeeRepository.save(employee);

        return this.fetchEmployeeById(employee.getId()).isPresent();
    }

    @Override
    public boolean deleteEmployee(Long id) {
        employeeRepository.deleteEmployeeById(id);

        return this.fetchEmployeeById(id).isPresent();
    }
}
