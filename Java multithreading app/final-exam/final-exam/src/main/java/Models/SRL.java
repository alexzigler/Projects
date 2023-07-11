package Models;

import java.util.ArrayList;

public class SRL {
    private  String name="Downtown Cab Co";
    private ArrayList<Car> cars;
    private ArrayList<Employee> employees;
    private Place location;
    private double budget;


    public SRL() {
    }

    public SRL(String name) {
        this.name = name;
    }

    public SRL(String name, ArrayList<Car> cars, ArrayList<Employee> employees, Place location, double budget) {
        this.name = name;
        this.cars = cars;
        this.employees = employees;
        this.location = location;
        this.budget = budget;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Car> getCars() {
        return cars;
    }

    public void setCars(ArrayList<Car> cars) {
        this.cars = cars;
    }

    public ArrayList<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(ArrayList<Employee> employees) {
        this.employees = employees;
    }

    public Place getLocation() {
        return location;
    }

    public void setLocation(Place location) {
        this.location = location;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    @Override
    public String toString() {
        return "SRL{" +
                "name='" + name + '\'' +
                //", cars=" + cars +
                //", employees=" + employees +
                //", location=" + location +
                ", budget=" + budget +
                '}';
    }
}
