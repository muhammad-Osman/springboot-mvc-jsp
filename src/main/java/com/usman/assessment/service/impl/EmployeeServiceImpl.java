package com.usman.assessment.service.impl;

import com.usman.assessment.model.Employee;
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
        return employeeRepository.findEmployeeById(id);
    }

    @Override
    public boolean saveOrUpdateEmployee(Employee employee) {
        System.out.println("\n hurry working => " + employee + "\n");
        if(employee.getId() == null) {
            employeeRepository.save(employee);
        } else {

            Employee updateEmployee = employeeRepository.findEmployeeById(employee.getId()).orElse(null);
            if(updateEmployee != null) {

                updateEmployee.setFirstName(employee.getFirstName());
                updateEmployee.setLastName(employee.getLastName());
                updateEmployee.setSalary(employee.getSalary());
                updateEmployee.setDob(employee.getDob());
                updateEmployee.setDepartment(employee.getDepartment());
                updateEmployee.setManager(employee.getManager());

                employeeRepository.save(updateEmployee);
            }
        }

        return true;
    }

    @Override
    public boolean deleteEmployee(Long id) {
        employeeRepository.deleteById(id);

        return this.fetchEmployeeById(id).isPresent();
    }
}
