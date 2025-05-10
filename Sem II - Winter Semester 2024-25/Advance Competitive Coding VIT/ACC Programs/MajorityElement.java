import java.util.Scanner;

class MajorityElement {
    public static void main(String[] args) {
        //int[] arr = {3, 3, 4, 2, 4, 4, 2, 4, 4};

        System.out.println("Enter the size of the array: ");
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        System.out.println("Enter the elements of the array: ");
        for(int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }
        
        majorityElement(arr, arr.length);
        sc.close();
    }


    public static void majorityElement(int[] arr, int n) {
        int maxCount = 0;
        int index = -1;
        for(int i = 0; i < n; i++) {
            int count = 0;
            for(int j = 0; j < n; j++) {
                if(arr[i] == arr[j]) {
                    count++;
                }
            }
            if(count > maxCount) {
                maxCount = count;
                index = i;
            }
        }
        if(maxCount > n/2)
            System.out.println("Majority Element is: "+arr[index]);
        else
            System.out.println("No Majority Element");
    }
}
 