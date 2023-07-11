package Simulator;

import Models.Client;
import Models.Driver;
import Models.Place;

import java.util.ArrayList;

import static Simulator.Sim.myLogger;

public class MoveForClient extends Thread {
    private final Sim sim;
    private final Client client;
    private ArrayList<Place> route = new ArrayList<>();
    private int totalTime = 0;

    public MoveForClient(Sim sim, Client client) {
        this.sim = sim;
        this.client = client;
    }


    /*private Driver findClosestDriver() { //broke
        ArrayList<ArrayList<Integer>> routes = Dijkstra.dijkstra(sim.getCity().getMap(), client.getLocation().getId() - 1);
        ArrayList<Integer> distances = Dijkstra.getDistances();

        int i = 0, searching = Integer.MAX_VALUE;
        System.out.println(distances);
        for (int dist : distances) {
            if (sim.getCity().getPlaces().get(i).getDriver() != null) {
                if (sim.getCity().getPlaces().get(i).getDriver().isAvailable() &&
                        sim.getCity().getPlaces().get(i).getDriver().getStatus().equals("is working")) {
                    if (dist < searching) {
                        searching = dist;
                    }
                }

            }
            i++;
        }
        System.out.println(searching);
        if (searching != Integer.MAX_VALUE) {
            this.route = new ArrayList<>();
            ArrayList<Integer> array = routes.get(distances.indexOf(searching));
//            for(int p :array)
//                System.out.println(p);
            for (int node : array)
                this.route.add(sim.getCity().getPlaces().get(node));
        }

        return sim.getCity().getPlaces().get(distances.indexOf(searching)).getDriver();

    }*///broke

    private Driver findClosestDriver2() {
        Driver closestDriver = null;
        ArrayList<ArrayList<Integer>> paths = Dijkstra.dijkstra(sim.getCity().getMap(), client.getLocation().getId() - 1);
        ArrayList<Integer> distances = Dijkstra.getDistances();
        int minDistance = Integer.MAX_VALUE;
        int closestDriverNode = -1;
        for (Driver d : sim.getCabs().keySet()) {
            if (!d.isAvailable() || d.getStatus().equals("is not working")) {
                continue;
            }
            int driverNode = d.getLocation().getId() - 1;
//            System.out.println(paths.get(driverNode) + " " + distances.get(driverNode));
            //find the lowest distance
            if (distances.get(driverNode) < minDistance) { //add is working is available
                minDistance = distances.get(driverNode);
                closestDriverNode = d.getLocation().getId() - 1;
            }
        }
        if (!distances.contains(minDistance)) {
            return null;
        }
//        System.out.println("min distance is "+minDistance);
//        System.out.println("best driver is in node "+closestDriverNode);
//        System.out.println("best driver is here "+ distances.indexOf(minDistance));
//        System.out.println("best route is "+ paths.get(distances.indexOf(minDistance)));


        for (Driver d : sim.getCabs().keySet()) {
            if (d.getLocation().getId() - 1 == closestDriverNode) {
                closestDriver = d;
                break;
            }
        }

//        System.out.println("driver with id " + closestDriver.getId() + " is the closest driver");

        /*route.clear();
        for (int node : paths.get(distances.indexOf(minDistance))) {
            route.add(sim.getCity().getPlaces().get(node));
            System.out.println("node= "+node+"  place returned "+sim.getCity().getPlaces().get(node));
        }*/
//        System.out.println(route);

        this.route.clear();
        ArrayList<Integer> path = Dijkstra.dijkstra(sim.getCity().getMap(), client.getLocation().getId() - 1)
                .get(closestDriver.getLocation().getId() - 1);
        for (int node : path) {
            this.route.add(sim.getCity().getPlaces().get(node));
        }

        return closestDriver;
    }

    @Override
    public void run() {

        Driver driver = this.findClosestDriver2();

        if (driver == null) {
            myLogger.logger.warning("No cabs available to pick up client");
        }
        System.out.println("Driver loc: " + driver.getLocation());
        System.out.println("Route1 is: " + route);
        boolean quickClientFlag = false;

        if (route.size() != 1) {
            route.remove(0);//first node of the route is excluded because the driver should already be there
        } else {
            myLogger.logger.info("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
                    " is in the same place as the client: " + driver.getLocation());
//                System.out.println("Driver " + driver + " is in the same place as the client" + driver.getLocation());
            quickClientFlag = true;
        }
        driver.setAvailable(false);
        if (!quickClientFlag) {
            for (Place place : route) {
                driver.getLocation().setDriver(null);
                myLogger.logger.info("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
                        " starts moving from " + driver.getLocation() + " towards " + place);

//                System.out.println("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
//                        " starts moving from " + driver.getLocation() + " towards " + place);
                int time = sim.getCity().getMap()[driver.getLocation().getId() - 1][place.getId() - 1];
                time *= 1000;
                if (time < 0) {
                    try {
                        throw new Exception("ERROR: Time cannot be negative");
                    } catch (Exception e) {
                    }

                } else {
                    try {
                        Thread.sleep(time);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
//                System.out.println("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
//                        " finished moving from " + driver.getLocation() + " towards " + place);

                myLogger.logger.info("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
                        " finished moving from " + driver.getLocation() + " towards " + place);

                driver.setLocation(place);
                place.setDriver(driver);
            }
//            System.out.println("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
//                    " has arrived at client " + client.toString());
            myLogger.logger.info("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
                    " has arrived at client " + client.toString());
        }

        /** setting the route for client's destination*/
        this.route.clear();
        ArrayList<Integer> path = Dijkstra.dijkstra(sim.getCity().getMap(), client.getDestination().getId() - 1)
                .get(driver.getLocation().getId() - 1);
        for (int node : path) {
            this.route.add(sim.getCity().getPlaces().get(node));
        }
        System.out.println("Driver loc: " + driver.getLocation());
        System.out.println("Route2: " + route);

        /** getting client to destination*/
        if (route.size() != 1) {
            route.remove(0);//first node of the route is excluded because the driver should already be there
        } else {
//                System.out.println("Client destination cannot be the same as client location. Driver is angry");
            myLogger.logger.info("Client destination cannot be the same as client location. Driver is angry");
            driver.setAvailable(true);
            return;
        }
        for (Place place : route) {
            driver.getLocation().setDriver(null);
            myLogger.logger.info("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
                    " starts moving from " + driver.getLocation() + " towards " + place);

//            System.out.println("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
//                    " starts moving from " + driver.getLocation() + " towards " + place);
            int time = sim.getCity().getMap()[driver.getLocation().getId() - 1][place.getId() - 1];
            totalTime += time;
            time *= 1000;
            if (time < 0) {
                try {
                    throw new Exception("ERROR: Time cannot be negative");
                } catch (Exception e) {
                }

            } else {
                try {
                    Thread.sleep(time);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
//            System.out.println("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
//                    " finished moving from " + driver.getLocation() + " towards " + place);


            myLogger.logger.info("Driver with id " + driver.getId() + " and car " + sim.getCabs().get(driver).getId() +
                    " finished moving from " + driver.getLocation() + " towards " + place);

            driver.setLocation(place);
            client.setLocation(place);
            place.setDriver(driver);
        }
//        System.out.println("Driver has dropped client at destination in " + totalTime + " minutes(seconds actually) since pick up");
        myLogger.logger.info("Driver has dropped client at destination in " + totalTime + " minutes(seconds actually) since pick up");
        if (client.getLocation().equals(client.getDestination())) {
            System.out.println("Client has successfully arrived at destination");
        } else System.out.println("Something went wrong");
        client.review(driver, sim.RANDOM.nextInt(5));
        sim.getSrl().setBudget(sim.getSrl().getBudget() + totalTime * sim.charge);
        driver.setAvailable(true);

    }
}
