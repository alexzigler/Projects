package Simulator;

import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

class DijkstraTest {
    @Test
    void dijkstraTest1(){
        int[][] matrix={{0,7,0,0,1},
                        {7,0,5,2,0},
                        {0,5,0,11,0},
                        {0,2,11,0,4},
                        {1,0,0,4,0}
                       };
        ArrayList<ArrayList<Integer>> paths;
        paths=Dijkstra.dijkstra(matrix,2);
        assert paths != null;
        for (ArrayList<Integer> path : paths) {
            for (Integer integer : path) {
                System.out.print(integer + " ");
            }
            System.out.println("");
        }
    }
    @Test
    void dijkstraTest2(){
        int[][] matrix={{0,5,10,0,0},
                        {5,0,0,4,7},
                        {10,0,0,1,0},
                        {0,4,1,0,1},
                        {0,7,0,1,0}
                       };
        ArrayList<ArrayList<Integer>> paths;
        paths=Dijkstra.dijkstra(matrix,2);
        assert paths != null;
        for (ArrayList<Integer> path : paths) {
            for (Integer integer : path) {
                System.out.print(integer + " ");
            }
            System.out.println("");
        }
    }
    @Test
    void dijkstraTest3(){
        int[][] matrix = {
                {0, 0, 16, 12, 14, 15, 2, 0, 0, 0,},
                {0, 0, 10, 15, 0, 0, 13, 0, 15, 6,},
                {16, 10, 0, 0, 13, 6, 0, 0, 11, 17,},
                {12, 15, 0, 0, 0, 9, 0, 8, 0, 0,},
                {14, 0, 13, 0, 0, 0, 0, 0, 5, 16,},
                {15, 0, 6, 9, 0, 0, 0, 19, 0, 0,},
                {2, 13, 0, 0, 0, 0, 0, 0, 0, 0,},
                {0, 0, 0, 8, 0, 19, 0, 0, 0, 11,},
                {0, 15, 11, 0, 5, 0, 0, 0, 0, 10,},
                {0, 6, 17, 0, 16, 0, 0, 11, 10, 0,}
        };
        ArrayList<ArrayList<Integer>> paths;
        paths=Dijkstra.dijkstra(matrix,2);
        assert paths != null;
        for (ArrayList<Integer> path : paths) {
            for (Integer integer : path) {
                System.out.print(integer + " ");
            }
            System.out.println("");
        }
    }
    @Test
    void dijkstraTest4(){
        int[][] matrix = {
                {0, 0, 16, 12, 14, 15, 2, 0, 0, 0,},
                {-1, 0, 10, 15, 0, 0, 13, 0, 15, 6,},
                {16, 10, 0, 0, 13, 6, 0, 0, 11, 17,},
                {12, 15, 0, 0, 0, 9, 0, 8, 0, 0,},
                {14, 0, 13, 0, 0, 0, 0, 0, 5, 16,},
                {15, 0, 6, 9, 0, 0, 0, 19, 0, 0,},
                {2, 13, 0, 0, 0, 0, 0, 0, 0, 0,},
                {0, 0, 0, 8, 0, 19, 0, 0, 0, 11,},
                {0, 15, 11, 0, 5, 0, 0, 0, 0, 10,},
                {0, 6, 17, 0, 16, 0, 0, 11, 10, 0,}
        };
        ArrayList<ArrayList<Integer>> paths;
        paths=Dijkstra.dijkstra(matrix,2);
        assert paths != null;
        for (ArrayList<Integer> path : paths) {
            for (Integer integer : path) {
                System.out.print(integer + " ");
            }
            System.out.println("");
        }
    }

    @Test
    void dijkstraTestDistances(){
        int[][] matrix={{0,7,0,0,1},
                {7,0,5,2,0},
                {0,5,0,11,0},
                {0,2,11,0,4},
                {1,0,0,4,0}
        };
        ArrayList<ArrayList<Integer>> paths;
        paths=Dijkstra.dijkstra(matrix,2);
        assert paths != null;
        for (ArrayList<Integer> path : paths) {
            for (Integer integer : path) {
                System.out.print(integer + " ");
            }
            System.out.println("");
        }
        System.out.println("Distances----------------");
        for(int y :Dijkstra.getDistances()){
            System.out.println(y);
        }
    }


}