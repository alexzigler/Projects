package Models;

import java.util.Objects;

public class Place {
    private static int nrOfIDs = 0;
    private String address;
    private Driver driver;
    private int id;

    public Place() {
    }

    public Place(String address) {
        this.address = address;
        this.id = ++nrOfIDs;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }

    public Driver getDriver() {
        return driver;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Place place = (Place) o;
        return id == place.id && Objects.equals(address, place.address);
    }

    @Override
    public int hashCode() {
        return Objects.hash(address, id);
    }

    @Override
    public String toString() {
        return "Place{" +
                "address='" + address + '\'' +
                ", id=" + id +
                '}';
    }
}
