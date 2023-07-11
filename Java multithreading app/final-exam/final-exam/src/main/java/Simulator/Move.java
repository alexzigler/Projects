package Simulator;


import Models.Driver;
import Models.Place;


import java.util.ArrayList;
import java.util.logging.Level;

import static Simulator.Sim.myLogger;


public class Move extends Thread {
    private final ArrayList<Place> route;
    private final Driver driver;
    private final Sim sim;

    public Move(Driver driver, ArrayList<Place> route, Sim sim) {
        this.driver = driver;
        this.route = route;
        this.sim = sim;
    }

    @Override
    public void run() {
        myLogger.logger.setLevel(Level.INFO);
        if(!driver.getLocation().equals(route.get(0))){
            System.out.println("Something went wrong");
        }
        else {
            if(route.size()!=1) {
                route.remove(0);//first node of the route is excluded because the driver should already be there
            }
            else {
                //System.out.println("Driver didn't move");
                myLogger.logger.info("Driver with id " +driver.getId()+ " and car " + sim.getCabs().get(driver).getId()
                        +" is still in "+driver.getLocation());
                return;
            }
        }
        for (Place place : route) {
            driver.getLocation().setDriver(null);
            myLogger.logger.info("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
                    " starts moving from " + driver.getLocation() + " towards " + place);

            //        System.out.println("Driver with id "+ driver.getId()+" and car "+sim.getCabs().get(driver).getId()+
            //          " starts moving from "+driver.getLocation()+" towards "+place );
            int time = sim.getCity().getMap()[driver.getLocation().getId() - 1][place.getId() - 1];
            time *= 1000;
            if (time < 0) {
                try {
                    throw new Exception("Something went wrong");
                } catch (Exception e) {
                }

            } else {
                try {
                    Thread.sleep(time);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
//        System.out.println("Driver with id "+ driver.getId()+" and car "+ sim.getCabs().get(driver).getId()+
//                " finished moving from "+driver.getLocation()+" towards "+place );


            myLogger.logger.info("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
                    " finished moving from " + driver.getLocation() + " towards " + place);

            driver.setLocation(place);
            place.setDriver(driver);
        }
        driver.setAvailable(true);
    }
}
