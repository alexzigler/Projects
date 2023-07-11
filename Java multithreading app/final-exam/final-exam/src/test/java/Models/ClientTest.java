package Models;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ClientTest {

    @Test
    void review() {
        Client client =new Client("George","Danila",
                new Place("Strada Victoriei nr 11"),new Place("Strada Unirii nr 17"));
        Driver d=new Driver("Mihai","Pop");
        client.review(d,4);
        System.out.println(d.getCurrentReview());

    }
}