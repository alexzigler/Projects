package Models;

public class Driver extends Employee {

    private Place location;
    private float currentReview;
    private int numberOfReviews;
    private boolean available;

    public Driver(String firstName, String lastName) {
        super(firstName, lastName);
    }

    public Driver(String firstName, String lastName, Place location) {
        super(firstName, lastName);
        this.numberOfReviews = 0;
        this.currentReview = 0;
        this.location = location;
    }

    public float getCurrentReview() {
        return currentReview;
    }

    public boolean isAvailable() {
        return this.available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public void updateCurrentReview(int clientReview) {
        clientReview = clientReview > 5 ? 5 : clientReview;
        this.currentReview = (this.currentReview * this.numberOfReviews + clientReview) / (++this.numberOfReviews);
    }

    public Place getLocation() {
        return location;
    }

    public void setLocation(Place location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "Driver{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", id=" + id +
                ", status='" + status + '\'' +
                ", location=" + location +
                ", currentReview=" + currentReview +
                ", numberOfReviews=" + numberOfReviews +
                ", available=" + available +
                '}';
    }
}
