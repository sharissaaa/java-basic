import java.io.*;

public class MatrixTranspose {
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        // Input the dimensions of the matrix
        System.out.print("Enter the number of rows: ");
        int rows = Integer.parseInt(reader.readLine());

        System.out.print("Enter the number of columns: ");
        int cols = Integer.parseInt(reader.readLine());

        // Input the matrix elements
        int[][] matrix = new int[rows][cols];
        System.out.println("Enter the elements of the matrix:");
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                matrix[i][j] = Integer.parseInt(reader.readLine());
            }
        }

        // Transpose the matrix
        int[][] transpose = new int[cols][rows];
        for (int i = 0; i < cols; i++) {
            for (int j = 0; j < rows; j++) {
                transpose[i][j] = matrix[j][i];
            }
        }

        // Display the original matrix
        System.out.println("Original Matrix:");
        printMatrix(matrix);

        // Display the transpose of the matrix
        System.out.println("Transpose of the Matrix:");
        printMatrix(transpose);
    }

    // Method to print a matrix
    public static void printMatrix(int[][] matrix) {
        for (int[] row : matrix) {
            for (int element : row) {
                System.out.print(element + " ");
            }
            System.out.println();
        }
    }
}
