import java.util.Scanner;

public class MaximumSumofHourglassMatrix {
    public static void main(String[] args) {
        // int[][] arr = {
        //     {1, 1, 1, 0, 0, 0},
        //     {0, 1, 0, 0, 0, 0},
        //     {1, 1, 1, 0, 0, 0},
        //     {0, 0, 2, 4, 4, 0},
        //     {0, 0, 0, 2, 0, 0},
        //     {0, 0, 1, 2, 4, 0}
        // };

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of rows and columns(minimum 3): ");
        int rows = sc.nextInt();
        int cols = sc.nextInt();

        if (rows < 3 || cols < 3) {
            System.out.println("Matrix dimensions must be at least 3x3.");
            return;
        }

        int[][] arr = new int[rows][cols];
        System.out.println("Enter the elements of the matrix row by row:");
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                arr[i][j] = sc.nextInt();
            }
        }

        System.out.println("Maximum sum of hourglass matrix is: " + maxSumHourglass(arr));
    }

    public static int maxSumHourglass(int[][] arr) {
        int max_sum = Integer.MIN_VALUE;
        for (int i = 0; i < arr.length - 2; i++) {
            for (int j = 0; j < arr[0].length - 2; j++) {
                int sum = arr[i][j] + arr[i][j + 1] + arr[i][j + 2]
                        + arr[i + 1][j + 1]
                        + arr[i + 2][j] + arr[i + 2][j + 1] + arr[i + 2][j + 2];
                max_sum = Math.max(max_sum, sum);
            }
        }
        return max_sum;
    }
}