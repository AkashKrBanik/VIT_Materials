public class MaximumProductSubarray {
    public static void main(String[] args) {
        int[] arr = {1, -2, -3, 0, 7, -8, -2 };
        System.out.println("Maximum Product Subarray is: " + maxProduct(arr));
    }

    public static int maxProduct(int[] arr) {
        int n = arr.length;
        if (n == 0) return 0;

        int maxProduct = arr[0];
        int currentMax = arr[0];
        int currentMin = arr[0];

        for (int i = 1; i < n; i++) {
            if (arr[i] < 0) {
                // Swap currentMax and currentMin when encountering a negative number
                int temp = currentMax;
                currentMax = currentMin;
                currentMin = temp;
            }

            // Update currentMax and currentMin
            currentMax = Math.max(arr[i], currentMax * arr[i]);
            currentMin = Math.min(arr[i], currentMin * arr[i]);

            // Update the overall max product
            maxProduct = Math.max(maxProduct, currentMax);
        }

        return maxProduct;
    }
}