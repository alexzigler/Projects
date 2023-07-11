package Simulator;

import DataBase.MyLogger;
import Models.*;

import java.io.*;
import java.util.*;


public class Sim {
    private final SRL srl = new SRL();
    private final City city = new City();
    private int nrOfPlaces = 20; // can be modified but new map matrix is needed
    final double charge = 10;
    final Random RANDOM = new Random();
    private final Map<Driver, Car> cabs = new HashMap<>();
    static final MyLogger myLogger = MyLogger.getInstance();

    public Sim() {
        initCity();
        initSRL();
    }

    public void initCity() {
        ArrayList<Place> places = new ArrayList<>();
        File file = new File("addresses.txt");
        String s;
        int i;
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            for (i = 0; i < nrOfPlaces; i++) {
                if ((s = br.readLine()) != null) {
                    places.add(new Place(s));
                } else {
                    nrOfPlaces = i;
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        city.setPlaces(places);
        city.setNumberOfPlaces(nrOfPlaces);
        /*int[][] map = {
                {0, 0, 16, 12, 14, 15, 2, 0, 0, 0},
                {0, 0, 10, 15, 0, 0, 13, 0, 15, 6},
                {16, 10, 0, 0, 13, 6, 0, 0, 11, 17},
                {12, 15, 0, 0, 0, 9, 0, 8, 0, 0},
                {14, 0, 13, 0, 0, 0, 0, 0, 5, 16},
                {15, 0, 6, 9, 0, 0, 0, 19, 0, 0},
                {2, 13, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 8, 0, 19, 0, 0, 0, 11},
                {0, 15, 11, 0, 5, 0, 0, 0, 0, 10},
                {0, 6, 17, 0, 16, 0, 0, 11, 10, 0}
        };*/
        int[][] map = {{0, 4, 13, 2, 9, 10, 10, 10, 7, 9, 6, 3, 4, 3, 18, 5, 11, 14, 10, 12,},
                {4, 0, 14, 16, 9, 5, 12, 20, 19, 11, 8, 12, 11, 2, 6, 18, 7, 20, 13, 2,},
                {13, 14, 0, 10, 16, 9, 19, 18, 9, 14, 1, 1, 19, 18, 5, 5, 6, 7, 8, 16,},
                {2, 16, 10, 0, 19, 2, 16, 15, 19, 19, 10, 9, 3, 7, 2, 2, 9, 7, 1, 15,},
                {9, 9, 16, 19, 0, 17, 17, 19, 13, 10, 17, 9, 4, 3, 6, 1, 3, 11, 17, 19,},
                {10, 5, 9, 2, 17, 0, 2, 12, 19, 9, 5, 20, 20, 7, 2, 15, 20, 17, 5, 9,},
                {10, 12, 19, 16, 17, 2, 0, 16, 19, 16, 11, 15, 10, 7, 2, 16, 9, 19, 14, 16,},
                {10, 20, 18, 15, 19, 12, 16, 0, 10, 15, 19, 4, 10, 8, 10, 14, 19, 15, 11, 16,},
                {7, 19, 9, 19, 13, 19, 19, 10, 0, 3, 4, 3, 13, 5, 11, 5, 17, 12, 16, 7,},
                {9, 11, 14, 19, 10, 9, 16, 15, 3, 0, 7, 2, 9, 1, 15, 1, 8, 20, 17, 6,},
                {6, 8, 1, 10, 17, 5, 11, 19, 4, 7, 0, 11, 14, 19, 20, 15, 6, 17, 6, 17,},
                {3, 12, 1, 9, 9, 20, 15, 4, 3, 2, 11, 0, 8, 3, 20, 17, 13, 20, 19, 1,},
                {4, 11, 19, 3, 4, 20, 10, 10, 13, 9, 14, 8, 0, 19, 11, 19, 8, 17, 19, 1,},
                {3, 2, 18, 7, 3, 7, 7, 8, 5, 1, 19, 3, 19, 0, 11, 4, 19, 19, 10, 1,},
                {18, 6, 5, 2, 6, 2, 2, 10, 11, 15, 20, 20, 11, 11, 0, 20, 1, 16, 5, 4,},
                {5, 18, 5, 2, 1, 15, 16, 14, 5, 1, 15, 17, 19, 4, 20, 0, 6, 5, 7, 15,},
                {11, 7, 6, 9, 3, 20, 9, 19, 17, 8, 6, 13, 8, 19, 1, 6, 0, 13, 7, 14,},
                {14, 20, 7, 7, 11, 17, 19, 15, 12, 20, 17, 20, 17, 19, 16, 5, 13, 0, 2, 2,},
                {10, 13, 8, 1, 17, 5, 14, 11, 16, 17, 6, 19, 19, 10, 5, 7, 7, 2, 0, 8,},
                {12, 2, 16, 15, 19, 9, 16, 16, 7, 6, 17, 1, 1, 1, 4, 15, 14, 2, 8, 0,}};
        city.setMap(map);
    }

    public void initSRL() {
        ArrayList<Car> cars = new ArrayList<>();
        ArrayList<Employee> employees = new ArrayList<>();
        File file1 = new File("cars.csv");
        File file2 = new File("employees.csv");
        try (BufferedReader br1 = new BufferedReader(new FileReader(file1));
             BufferedReader br2 = new BufferedReader(new FileReader(file2))
        ) {
            String s1, s2, s;
            br1.readLine();//ignore first line of csv
            while ((s1 = br1.readLine()) != null) {
                cars.add(new Car(s1.split(",")[1], Double.parseDouble(s1.split(",")[2])));
            }
            br2.readLine();//ignore first line of csv
            while ((s2 = br2.readLine()) != null) {
                try {
                    s = s2.split(",")[3];
                    employees.add(new Driver(s2.split(",")[1], s2.split(",")[2]));
                } catch (ArrayIndexOutOfBoundsException e) {
                    employees.add(new Employee(s2.split(",")[1], s2.split(",")[2]));
                }

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        srl.setCars(cars);
        srl.setEmployees(employees);
        srl.setLocation(city.getPlaces().get(RANDOM.nextInt(nrOfPlaces)));
    }

    public SRL getSrl() {
        return srl;
    }

    public City getCity() {
        return city;
    }

    public int getNrOfPlaces() {
        return nrOfPlaces;
    }

    public Map<Driver, Car> getCabs() {
        return cabs;
    }

    public ArrayList<Move> sendAllDriversInTheCity() {
        ArrayList<Move> moves = new ArrayList<>();
        int i = 0;
        for (Employee employee : srl.getEmployees()) {
            try {
                if (i != srl.getCars().size()) {
                    Driver driver = (Driver) employee;
                    driver.setStatus(true);
                    driver.setLocation(srl.getLocation());
                    cabs.put(driver, srl.getCars().get(i++));
                } else {
                    System.out.println("All cars being used");
                }
            } catch (ClassCastException e) {
            }
        }
        for (Driver driver : cabs.keySet()) {
            int r = RANDOM.nextInt(city.getNumberOfPlaces());
            ArrayList<Integer> rightPath = Dijkstra.dijkstra(city.getMap(), r).get(driver.getLocation().getId() - 1);
            ArrayList<Place> route = new ArrayList<>();
            for (int node : rightPath) {
                route.add(this.city.getPlaces().get(node));
            }
            moves.add(new Move(driver, route, this));
        }
        return moves;
    }

    public static void main(String[] args) {
        Sim sim = new Sim();
        /**sim start*/
        ArrayList<Move> moves = sim.sendAllDriversInTheCity();
        for (Move m : moves) {
            m.start();
        }
        for (Move m : moves) {
            try {
                m.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        while (true) {
            try {
                Thread.sleep(60000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("New Client popped");
            Client client = new Client("Jonathan", "Joestar",
                    sim.city.getPlaces().get(sim.RANDOM.nextInt(sim.nrOfPlaces)),
                    sim.city.getPlaces().get(sim.RANDOM.nextInt(sim.nrOfPlaces)));
            new MoveForClient(sim, client).start();
        }
        /**sim end*/
    }


}
