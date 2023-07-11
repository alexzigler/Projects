package Models;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class EmployeeTest {

    @Test
    void setStatus() {
        Employee employee = new Employee("Joe","Wills");
        System.out.println(employee);
        employee.setStatus(true);
        System.out.println(employee);
    }
}