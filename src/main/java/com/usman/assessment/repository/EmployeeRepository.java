package com.usman.assessment.repository;

import com.usman.assessment.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    public Optional<Employee> findEmployeeById(Long id);

}
