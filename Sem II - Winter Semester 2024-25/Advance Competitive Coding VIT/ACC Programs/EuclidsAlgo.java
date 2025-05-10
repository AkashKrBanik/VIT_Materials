// Euclidean's Algorithm - To find GCD of two numbers

import java.util.Scanner;

public class EuclidsAlgo {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the two numbers: ");
        int a = sc.nextInt();
        int b = sc.nextInt();
        System.out.println("GCD of "+a+" and "+b+" is: "+gcd(a, b));
        sc.close();
    }

    public static int gcd(int a, int b) {
        if(a == 0)
            return b;
        return gcd( b%a, a);
    }
}
