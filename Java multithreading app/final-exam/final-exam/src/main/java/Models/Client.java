package Models;

import java.util.Objects;

public class Client {
    private final String firstName;
    private final String lastName;
    private  Place location;
    private  Place destination;

    public Client(String firstName, String lastName, Place location, Place destination) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.location = location;
        this.destination = destination;
    }

    public Place getLocation() {
        return location;
    }

    public Place getDestination() {
        return destination;
    }

    public void setLocation(Place location) {
        this.location = location;
    }

    public void setDestination(Place destination) {
        this.destination = destination;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Client client = (Client) o;
        return Objects.equals(firstName, client.firstName) && Objects.equals(lastName, client.lastName) && Objects.equals(location, client.location) && Objects.equals(destination, client.destination);
    }

    @Override
    public int hashCode() {
        return Objects.hash(firstName, lastName, location, destination);
    }

    @Override
    public String toString() {
        return "Client{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", location=" + location +
                ", destination=" + destination +
                '}';
    }
    public void review(Driver d, int review){
        d.updateCurrentReview(review);
    }
}
