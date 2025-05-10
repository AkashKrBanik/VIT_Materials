public class MaximumEquilibriumSum {
    public static void main(String[] args) {
        int[] arr = {3, 1, 2, 4, 5, 1, 1, 2};
        System.out.println("Maximum Equilibrium Sum is: "+maxEquilibriumSum(arr));
    }

    public static int maxEquilibriumSum(int[] arr) {
        int n = arr.length;
        int sum = 0;
        for(int i = 0; i < n; i++) {
            sum += arr[i];
        }
        int leftSum = 0;
        int rightSum = sum;
        for(int i = 0; i < n; i++) {
            rightSum -= arr[i];
            if(leftSum == rightSum) {
                return i;
            }
            leftSum += arr[i];
        }
        return -1;
    }
}