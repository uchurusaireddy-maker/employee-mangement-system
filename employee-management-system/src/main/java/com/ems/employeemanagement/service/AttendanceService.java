package com.ems.employeemanagement.service;

import com.ems.employeemanagement.model.Attendance;

import java.time.LocalDate;
import java.util.List;

public interface AttendanceService {
    Attendance markAttendance(Long employeeId, Attendance attendance);
    List<Attendance> getAttendanceByEmployee(Long employeeId);
    List<Attendance> getAttendanceByDate(LocalDate date);
    Attendance updateAttendance(Long id, Attendance attendance);
    void deleteAttendance(Long id);
}
