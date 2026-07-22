-- ==========================================================
-- Employee Management System - Database Setup Script
-- Run this in MySQL if you prefer manual setup.
-- (Spring Boot will also auto-create tables via
--  spring.jpa.hibernate.ddl-auto=update)
-- ==========================================================

CREATE DATABASE IF NOT EXISTS employee_management_db;
USE employee_management_db;

CREATE TABLE IF NOT EXISTS departments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    location VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS employees (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(10),
    designation VARCHAR(255),
    salary DOUBLE,
    date_of_joining DATE,
    department_id BIGINT,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS attendance (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    employee_id BIGINT NOT NULL,
    date DATE NOT NULL,
    status ENUM('PRESENT', 'ABSENT', 'ON_LEAVE', 'HALF_DAY') NOT NULL,
    UNIQUE KEY uq_employee_date (employee_id, date),
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- Sample seed data
INSERT INTO departments (name, location) VALUES
('Engineering', 'Hyderabad'),
('Human Resources', 'Bengaluru'),
('Sales', 'Mumbai');

INSERT INTO employees (name, email, phone, designation, salary, date_of_joining, department_id) VALUES
('Ravi Kumar', 'ravi.kumar@example.com', '9876543210', 'Software Engineer', 650000, '2024-01-15', 1),
('Anita Sharma', 'anita.sharma@example.com', '9876543211', 'HR Executive', 500000, '2023-11-01', 2),
('Vikram Singh', 'vikram.singh@example.com', '9876543212', 'Sales Manager', 700000, '2022-06-20', 3);
