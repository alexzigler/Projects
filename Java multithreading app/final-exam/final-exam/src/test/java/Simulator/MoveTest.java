package Simulator;

import Models.Car;
import Models.Driver;
import Models.Place;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class MoveTest {

    @Test
    void move() {
        Sim sim = new Sim();


        Driver driver = (Driver) sim.getSrl().getEmployees().get(2);
        Car car = sim.getSrl().getCars().get(4);
        sim.getCabs().put(driver, car);
        driver.setLocation(sim.getCity().getPlaces().get(0));
        ArrayList<Place> route = new ArrayList<>();
        route.add(sim.getCity().getPlaces().get(0));
        route.add(sim.getCity().getPlaces().get(2));
        route.add(sim.getCity().getPlaces().get(9));
        route.add(sim.getCity().getPlaces().get(1));
        Move move = new Move(driver, route, sim);
        move.start();
    }
    @Test
    void moveSamePlace() {
        Sim sim = new Sim();


        Driver driver = (Driver) sim.getSrl().getEmployees().get(2);
        Car car = sim.getSrl().getCars().get(4);
        sim.getCabs().put(driver, car);
        driver.setLocation(sim.getCity().getPlaces().get(0));
        ArrayList<Place> route = new ArrayList<>();
        route.add(sim.getCity().getPlaces().get(0));
        Move move = new Move(driver, route, sim);
        move.start();
    }

}