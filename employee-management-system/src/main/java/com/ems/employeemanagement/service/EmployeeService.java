package com.ems.employeemanagement.service;

import com.ems.employeemanagement.model.Employee;

import java.util.List;

public interface EmployeeService {
    Employee createEmployee(Employee employee, Long departmentId);
    Employee getEmployeeById(Long id);
    List<Employee> getAllEmployees();
    List<Employee> getEmployeesByDepartment(Long departmentId);
    List<Employee> searchByName(String name);
    Employee updateEmployee(Long id, Employee employee, Long departmentId);
    void deleteEmployee(Long id);
}
