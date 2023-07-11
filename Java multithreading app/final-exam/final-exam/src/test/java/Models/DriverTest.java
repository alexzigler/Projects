package Models;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class DriverTest {

    @Test
    void updateCurrentReview() {
        Driver driver = new Driver("Larry", "Fisherman");
        driver.updateCurrentReview(4);
        assertEquals(4, driver.getCurrentReview());

        driver.updateCurrentReview(5);
        assertEquals(4.5, driver.getCurrentReview());

        driver.updateCurrentReview(10);
        assertEquals(4.66, driver.getCurrentReview(),0.01);

    }
}