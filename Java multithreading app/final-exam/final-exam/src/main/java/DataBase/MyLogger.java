package DataBase;

import java.io.File;
import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class MyLogger {
    private static volatile MyLogger instance = null;
    public Logger logger;
    FileHandler fh;

    private MyLogger(String file_name) throws IOException {
        File f = new File(file_name);
        if (!f.exists()) {
            try {
                f.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        fh = new FileHandler(file_name, true);
        logger = Logger.getLogger("My_Logger");
        logger.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);
    }

    //Thread-Safe Singleton
    public static MyLogger getInstance() {
        synchronized (MyLogger.class) {
            if (instance == null) {
                try {
                    instance = new MyLogger("History.txt");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return instance;
    }
}
