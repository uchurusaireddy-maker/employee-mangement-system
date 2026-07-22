# Employee Management System

A full-stack, web-based REST API for managing employee records, attendance, and department information.
Built with **Java, Spring Boot, Spring Data JPA, and MySQL**.

## Project Structure (root files)

```
employee-management-system/
├── pom.xml                          # Maven build file (dependencies, plugins)
├── README.md                        # This file
├── .gitignore
├── database/
│   └── schema.sql                   # Manual DB setup + seed data (optional)
├── postman/
│   └── EmployeeManagementSystem.postman_collection.json
└── src/
    ├── main/
    │   ├── java/com/ems/employeemanagement/
    │   │   ├── EmployeeManagementSystemApplication.java   # main() entry point
    │   │   ├── model/          # JPA entities: Employee, Department, Attendance
    │   │   ├── repository/     # Spring Data JPA repositories
    │   │   ├── service/        # Service interfaces
    │   │   ├── service/impl/   # Service implementations (business logic)
    │   │   ├── controller/     # REST controllers (API endpoints)
    │   │   └── exception/      # Custom exceptions + global exception handler
    │   └── resources/
    │       └── application.properties   # DB config, server port, logging
    └── test/java/com/ems/employeemanagement/   # (add JUnit tests here)
```

## Prerequisites

- Java 17+
- Maven 3.8+
- MySQL 8.x running locally (or accessible remotely)

## Setup & Run

**1. Clone/unzip the project**, then move into it:
```bash
cd employee-management-system
```

**2. Create the database** (Spring Boot will auto-create it if `createDatabaseIfNotExist=true` is in the URL, but you can also run it manually):
```bash
mysql -u root -p < database/schema.sql
```

**3. Configure DB credentials** in `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/employee_management_db?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=your_mysql_password
```

**4. Build the project:**
```bash
mvn clean install
```

**5. Run the application:**
```bash
mvn spring-boot:run
```
Or run the packaged jar:
```bash
java -jar target/employee-management-system.jar
```

The server starts on **http://localhost:8080**.

## Deploying to a server (VPS / cloud instance)

1. Build the jar locally: `mvn clean package` → produces `target/employee-management-system.jar`.
2. Copy the jar to your server: `scp target/employee-management-system.jar user@your-server:/opt/ems/`
3. Install Java 17 and MySQL on the server (or point to a managed MySQL instance).
4. Run: `java -jar /opt/ems/employee-management-system.jar --spring.datasource.url=... --spring.datasource.username=... --spring.datasource.password=...`
5. For production, run it as a systemd service or behind Nginx as a reverse proxy on port 80/443.

## API Endpoints

### Departments — `/api/departments`
| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/departments` | Create department |
| GET | `/api/departments` | List all departments |
| GET | `/api/departments/{id}` | Get department by id |
| PUT | `/api/departments/{id}` | Update department |
| DELETE | `/api/departments/{id}` | Delete department |

### Employees — `/api/employees`
| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/employees?departmentId={id}` | Create employee |
| GET | `/api/employees` | List all employees |
| GET | `/api/employees/{id}` | Get employee by id |
| GET | `/api/employees/department/{departmentId}` | Employees in a department |
| GET | `/api/employees/search?name={name}` | Search employees by name |
| PUT | `/api/employees/{id}?departmentId={id}` | Update employee |
| DELETE | `/api/employees/{id}` | Delete employee |

### Attendance — `/api/attendance`
| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/attendance/employee/{employeeId}` | Mark attendance |
| GET | `/api/attendance/employee/{employeeId}` | Attendance history for employee |
| GET | `/api/attendance/date/{yyyy-MM-dd}` | Attendance for a specific date |
| PUT | `/api/attendance/{id}` | Update attendance record |
| DELETE | `/api/attendance/{id}` | Delete attendance record |

## Testing with Postman

Import `postman/EmployeeManagementSystem.postman_collection.json` into Postman. It includes ready-made requests for every endpoint above, using a `{{baseUrl}}` variable set to `http://localhost:8080/api`.

## Tech Stack

- Java 17, Spring Boot 3.2.5
- Spring Web (REST APIs)
- Spring Data JPA + Hibernate (ORM)
- MySQL 8 (database)
- Lombok (boilerplate reduction)
- Bean Validation (`jakarta.validation`) for request validation
- Maven (build tool)
