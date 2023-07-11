package Simulator;

import Models.Driver;
import Models.Employee;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class SimTest {

    @Test
    void initCityMap() {
        Sim sim = new Sim();
        for (int i = 0; i < sim.getNrOfPlaces(); i++) {
            for (int j = 0; j < sim.getNrOfPlaces(); j++) {
                System.out.print(sim.getCity().getMap()[i][j] + " ");
            }
            System.out.println("");
        }
    }

    @Test
    void initCityPlaces() {
        Sim sim = new Sim();
        for (int i = 0; i < sim.getNrOfPlaces(); i++) {
            System.out.println(sim.getCity().getPlaces().get(i));
        }
    }

    @Test
    void initSRLCars() {
        Sim sim = new Sim();
        for (int i = 0; i < sim.getSrl().getCars().size(); i++) {
            System.out.println(sim.getSrl().getCars().get(i));
        }
    }

    @Test
    void initSRLEmployees() {
        Sim sim = new Sim();
        for (Employee e : sim.getSrl().getEmployees()) {
            try {
                Driver d = (Driver) e;
                System.out.println(d);
            }
            catch (ClassCastException exception){
                System.out.println(e);
            }

        }
    }

    @Test
    void initSRLLocation() {
        Sim sim = new Sim();
        System.out.println(sim.getSrl().getLocation());
    }
}