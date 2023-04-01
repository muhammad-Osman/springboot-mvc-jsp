package com.usman.assessment.repository;

import com.usman.assessment.model.Employee;
import com.usman.assessment.model.EmployeePrimaryKey;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface EmployeeRepository extends JpaRepository<Employee, EmployeePrimaryKey> {

    public Optional<Employee> findEmployeeById(Long id);
    public void deleteEmployeeById(Long id);

}
