package DataBase;


import java.io.*;

public class DataBase {

    /** The following files have been generated using https://www.mockaroo.com
     * "addresses.txt" , "employees.csv" */

    public DataBase(String carPath, String employeesPath) throws IOException {
        File carFile = new File(carPath);
        File employeeFile = new File(employeesPath);
        if (!carFile.exists()) {
            carFile.createNewFile();
        }
        if (!employeeFile.exists()) {
            employeeFile.createNewFile();
        }
    }

    public void deleteLine(File file, int id) {
        File temp = new File("temporary.csv");
        try (BufferedReader br = new BufferedReader(new FileReader(file));
             FileWriter fw = new FileWriter(temp)
        ) {
            String s;
            fw.write(br.readLine());
            while ((s = br.readLine()) != null) {
                if (Integer.parseInt(s.substring(0, s.indexOf(','))) != id) {
                    fw.write('\n' + s);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        //after using this method, the original file should be deleted
        //and the temporary one should be renamed as the original
        //these operations don't seem to work if placed here
    }
    public void addLine(File file,String s){
        try(FileWriter fw = new FileWriter(file,true)){
            fw.write('\n'+s);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
