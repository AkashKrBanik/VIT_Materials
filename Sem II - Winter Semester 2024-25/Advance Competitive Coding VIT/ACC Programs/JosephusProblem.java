public class JosephusProblem {
    public static void main(String[] args) {
        int n = 5, k = 3; // n=total number of people, k=number of people to skip
        System.out.println("The chosen place is " + (josephus(n, k)+1));
    }

    public static int josephus(int n, int k) {
        if (n == 1)
            return 0;
        return (josephus(n - 1, k) + k) % n;
    }
}

