package Models;

import java.util.Objects;

public class Car {
    private static int nrOfIDs = 0;
    private int id;
    private final String model;
    private final double price;
    private boolean owned;

    public Car(String model, double price) {
        this.model = model;
        this.price = price;
        this.id = ++nrOfIDs;
    }

    public Car(String model, double price, boolean owned) {
        this.model = model;
        this.price = price;
        this.owned = owned;
        this.id = ++nrOfIDs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModel() {
        return model;
    }

    public double getPrice() {
        return price;
    }

    public boolean isOwned() {
        return owned;
    }

    public void setOwned(boolean owned) {
        this.owned = owned;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Car car = (Car) o;
        return id == car.id && Double.compare(car.price, price) == 0 && Objects.equals(model, car.model);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, model, price);
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", model='" + model + '\'' +
                ", price=" + price +
                ", owned=" + owned +
                '}';
    }
}
