package Simulator;

import Models.Client;
import Models.Driver;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MoveForClientTest {

    @Test
    void run() {
        Sim sim=new Sim();
        Driver driver = (Driver) sim.getSrl().getEmployees().get(1);
        driver.setStatus(true);
        driver.setLocation(sim.getCity().getPlaces().get(2));
        driver.setAvailable(true);
        sim.getCity().getPlaces().get(2).setDriver(driver);
        sim.getCabs().put(driver,sim.getSrl().getCars().get(1));

        Client client = new Client("Gheorghe","Pop",sim.getCity().getPlaces().get(4),sim.getCity().getPlaces().get(6));
        new MoveForClient(sim,client).start();
    }
}