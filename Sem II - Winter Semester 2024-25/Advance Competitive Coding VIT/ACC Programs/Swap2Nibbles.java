import java.util.Scanner;

public class Swap2Nibbles {
    public static void main(String[] args) {

    Scanner sc = new Scanner(System.in);
    System.out.print("Enter a number: ");
    int num = sc.nextInt();
    int swapnum;
    swapnum = ((num & 0x0F) << 4 | (num & 0xF0) >> 4);
    System.out.println("\nBefore swapping the nibble: " + num);
    System.out.println("After swapping the nibble: " + swapnum);

    sc.close();
}

}
