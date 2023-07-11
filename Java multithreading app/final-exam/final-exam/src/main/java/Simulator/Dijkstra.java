package Simulator;

import java.util.ArrayList;

public class Dijkstra {
    private static final int NO_PARENT = -1;
    private static final int INFINITY = Integer.MAX_VALUE;
    private static ArrayList<Integer> distances=new ArrayList<>();

    public static ArrayList<ArrayList<Integer>> dijkstra(int[][] matrix, int referenceNode) {
        distances.clear();
        ArrayList<ArrayList<Integer>> paths = new ArrayList<>();

        int nrOfNodes = matrix[0].length;

        int[] vectorD = new int[nrOfNodes];
        boolean[] vectorS = new boolean[nrOfNodes];
        int[] vectorT = new int[nrOfNodes];

        for (int i = 0; i < nrOfNodes; i++) {
            vectorS[i] = false;
            vectorD[i] = INFINITY;
        }
        vectorD[referenceNode] = 0;
        vectorT[referenceNode] = NO_PARENT;

        for (int i = 1; i < nrOfNodes; i++) {
            //search for minimum value in vector D that is not yet added to vector S (not yet set true as visited)
            // and its correspondent node
            int minValueFromD = INFINITY;
            int node = -1;
            for (int j = 0; j < nrOfNodes; j++) {
                if (!vectorS[j] && vectorD[j] < minValueFromD) {
                    minValueFromD = vectorD[j];
                    node = j;
                }

            }
            if (minValueFromD == INFINITY) {
                return null;
            }
            vectorS[node] = true; //set as visited

            for (int j = 0; j < nrOfNodes; j++) {
                if (matrix[node][j] > 0 && (matrix[node][j] + minValueFromD) < vectorD[j]) {
                    vectorT[j] = node;
                    vectorD[j] = minValueFromD + matrix[node][j];

                }
            }

        }
        //upload distances
        for (int i = 0; i < nrOfNodes; i++) {
            //if(i!=referenceNode) {
                Dijkstra.distances.add(vectorD[i]);
            //}
        }

        //generate solution
        for (int i = 0; i <nrOfNodes; i++) {
            ArrayList<Integer> path= new ArrayList<>();
            int iCopy=i;
            //if(i!=referenceNode) {
                while (iCopy != NO_PARENT) {
                    path.add(iCopy);
                    iCopy = vectorT[iCopy];
                }
                paths.add(path);
            //}
        }
        return paths;
    }

    public static ArrayList<Integer> getDistances() {
        return distances;
    }
}
