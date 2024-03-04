// Name: Carter Hanson
// Due Date: 2-7-24
// Description: Java implementation of part a of assignment 1. This program checks the following from the input file:

// a. Is the value a multiple of 7, 11, or 13?
// b. Is the sum of the digit’s odds or even?
// c. Is the value a prime number?
// d. Is the number a palindrome?


// ! Write a function that will merge the contents of two sorted (ascending order) arrays of
// ! the type FLOAT values, use an efficient bubble sort to sort two arrays first, and then use
// ! the merge function. (Your program should not sort the whole array after appending one
// ! array to another array.) The function should not assume that both its input parameter
// ! arrays are the same length but can assume that one array does not contain two copies of
// ! the same value. The resulting array should also contain no duplicate values.
import java.util.Arrays;
import java.util.Scanner;

class HansonJAVA 
{
    public static void main(String[] args) 
    {
        char choice = menu();

        if (choice == 'a' || choice == 'A') 
        {
            partA();
        } 
        else if (choice == 'b' || choice == 'B') 
        {
            partB();
        }
    }

    // menu for choice of program
    public static char menu() 
    {
        Scanner scanner = new Scanner(System.in);
        char choice;

        do 
        {
            System.out.print("Would you like part a (a or A) or b (b or B): ");
            choice = scanner.next().charAt(0);

            if 
            (choice != 'a' && choice != 'A' && choice != 'B' && choice != 'b') 
            {
                System.out.println("\nError: please make a correct choice!");
            }
        } while (choice != 'a' && choice != 'A' && choice != 'B' && choice != 'b');

        return choice;
    }

    // part a implementation
    public static void partA() 
    {
        int num;
        
        int[] ary = {3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121};

        for (int i = 0; i < ary.length; i++) 
        {
            num = ary[i];
            
            System.out.println("Number: " + num);
            
            isDivisible(num);
            
            oddOrEven(num);
            
            prime(num);
            
            palindrome(num);
            
            System.out.println();
        }
    }

    // part b implementation
    public static void partB() 
    {
        float[] ary1 = {32.0f, 38.1f, 843.1f, 284.9f, 8.13f};
        
        float[] ary2 = {492.1f, 83.2939f, 284.9f, 8.13f};
        
        int size1 = ary1.length;
        
        int size2 = ary2.length;
        
        float[] midAry = new float[size1 + size2];

        bubbleSort(ary1);
        
        bubbleSort(ary2);

        int size3 = mergeArrays(ary1, size1, ary2, size2, midAry);

        for (int i = 0; i < size3; i++) 
        {
            System.out.print(midAry[i] + " ");
        }

        System.out.println();
    }

    // checks to see what number is divisible by if at all
    public static void isDivisible(int num) 
    {
        if (num % 7 == 0) 
        {
            System.out.println(num + " is a multiple of 7");
        }

        if (num % 11 == 0) 
        {
            System.out.println(num + " is a multiple of 11");
        }

        if (num % 13 == 0) 
        {
            System.out.println(num + " is a multiple of 13");
        }

        if (num % 7 != 0 && num % 11 != 0 && num % 13 != 0) 
        {
            System.out.println(num + " is not a multiple of 7, 11, or 13");
        }
    }

    // checks if num is odd or even
    public static void oddOrEven(int num) 
    {
        int digitSum = 0;

        while (num > 0) 
        {
            digitSum += num % 10;
            num /= 10;
        }

        if (digitSum % 2 == 0) 
        {
            System.out.println("Sum of the digits is even.");
        } 
        else 
        {
            System.out.println("Sum of the digits is odd.");
        }
    }

    // checks to see if number is prime
    public static void prime(int num) 
    {
        boolean primeTracker = true;

        if (num < 2) 
        {
            primeTracker = false;
        }

        for (int i = 2; i * i <= num; i++) 
        {
            if (num % i == 0) 
            {
                primeTracker = false;
            }
        }

        if (primeTracker) 
        {
            System.out.println(num + " is prime.");
        } 
        else 
        {
            System.out.println(num + " is not prime.");
        }
    }

    // checks to see if num is a palindrome
    public static void palindrome(int num) 
    {
        boolean palindromeTracker = true;
        String numberStr = Integer.toString(num);
        int length = numberStr.length();

        for (int i = 0; i < length / 2; i++) 
        {
            if (numberStr.charAt(i) != numberStr.charAt(length - i - 1)) 
            {
                palindromeTracker = false;
            }
        }

        if (palindromeTracker) 
        {
            System.out.println(num + " is a palindrome.");
        } 
        else 
        {
            System.out.println(num + " is not a palindrome.");
        }
    }

    // bubble sorts array
    public static void bubbleSort(float[] ary) 
    {
        for (int i = 0; i < ary.length - 1; i++) 
        {
            for (int j = 0; j < ary.length - i - 1; j++) 
            {
                if (ary[j] > ary[j + 1]) 
                {
                    float temp = ary[j];
                    ary[j] = ary[j + 1];
                    ary[j + 1] = temp;
                }
            }
        }
    }

    // merges two arrays
    public static int mergeArrays(float[] ary1, int size1, float[] ary2, int size2, float[] midAry) 
    {
        int ary1i = 0, ary2i = 0, midi = 0;

        while (ary1i < size1 && ary2i < size2) 
        {
            if (ary1[ary1i] < ary2[ary2i])
            {
                midAry[midi] = ary1[ary1i];
                ary1i++;
            } 
            else if (ary1[ary1i] > ary2[ary2i]) 
            {
                midAry[midi] = ary2[ary2i];
                ary2i++;
            }
            else 
            { 
                midAry[midi] = ary1[ary1i];
                ary1i++;
                ary2i++;
            }

            midi++;
        }

        while (ary1i < size1) 
        {
            midAry[midi] = ary1[ary1i];
            ary1i++;
            midi++;
        }

        while (ary2i < size2) 
        {
            midAry[midi] = ary2[ary2i];
            ary2i++;
            midi++;
        }

        return midi;
    }
}
