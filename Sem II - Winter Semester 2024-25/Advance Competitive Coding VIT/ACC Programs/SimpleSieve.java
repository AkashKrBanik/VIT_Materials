import java.util.Scanner;

public class SimpleSieve {

    public static void simpleSieve(int limit) {
        boolean[] prime = new boolean[limit + 1];
        for (int i = 0; i <= limit; i++) {
            prime[i] = true;
        }
        for (int p = 2; p * p <= limit; p++) {
            if (prime[p]) {
                for (int i = p * p; i <= limit; i += p) {
                    prime[i] = false;
                }
            }
        }
        for (int p = 2; p <= limit; p++) {
            if (prime[p]) {
                System.out.print(p + " ");
            }
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the limit (n): ");
        int n = sc.nextInt();
        System.out.println("Primes up to " + n + ":");
        simpleSieve(n);
    }

}   