//Name: Carter Hanson
//Due Date: 2-7-24
//Description: C++ implementation of assignment 1. This program checks the following from the input file:

// a. Is the value a multiple of 7, 11, or 13?
// b. Is the sum of the digit’s odds or even?
// c. Is the value a prime number?
// d. Is the number a palindrome?

// ! // ! Write a function that will merge the contents of two sorted (ascending order) arrays of
// ! // ! the type FLOAT values, use an efficient bubble sort to sort two arrays first, and then use
// ! // ! the merge function. (Your program should not sort the whole array after appending one
// ! // ! array to another array.) The function should not assume that both its input parameter
// ! // ! arrays are the same length but can assume that one array does not contain two copies of
// ! // ! the same value. The resulting array should also contain no duplicate values.

#include <iostream>
#include <string>

using namespace std;

void isDivisible (int num);
void oddOrEven (int num);
void prime (int num);
void palindrome (int num);
void bubbleSort (float ary [], int size);
int mergeArrays (float* ary1, int size1, float* ary2, int size2, float* midAry);
void partA ();
char menu();
void partB();

int main()
{
    char choice;

    choice = menu ();

    if (choice == 'a' || choice == 'A')
    {
        partA();
    }
    else if (choice == 'b' || choice == 'B')
    {
        partB();
    }
}

//menu for choice of program
char menu ()
{
    char choice;

    while (choice != 'a' && choice != 'A' && choice != 'B' && choice != 'b')
    {
        cout << "Would you like part a (a or A) or b (b or B): ";

        cin >> choice;

        if (choice != 'a' && choice != 'A' && choice != 'B' && choice != 'b')
        {
            cout << endl << "Error: please make a correct choice!" << endl;
        }
    }

    return choice;

}

//part a implementation
void partA ()
{
    int num = 0;

    int ary [] = {3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121};

    size_t position;

    string line;

    int size = sizeof(ary) / sizeof(ary[0]);

    for (int i = 0; i < size; i++)
    {
        cout << "Number: " << ary[i] << endl;

        isDivisible(ary[i]);

        oddOrEven(ary[i]);

        prime(ary[i]);

        palindrome(ary[i]);

        cout << endl;
    }
}

//part b implementation
void partB()
{
    float ary1[] = {32.0, 38.1, 843.1, 284.9, 8.13};
    
    float ary2[] = {492.1, 83.2939, 284.9, 8.13};

    int size1 = sizeof(ary1) / sizeof(ary1[0]);
    
    int size2 = sizeof(ary2) / sizeof(ary2[0]);

    float midAry[size1 + size2];

    bubbleSort(ary1, size1);
    
    bubbleSort(ary2, size2);

    int size3 = mergeArrays(ary1, size1, ary2, size2, midAry);

    for (int i = 0; i < size3; i++) 
    {
        cout << midAry[i] << " ";
    }

    cout << endl;
}

//checks to see what number is divisble by if at all
void isDivisible (int num)
{
    if (num % 7 == 0)
    {
        cout << num << " is a multiple of 7" << endl;
    }
    
    if (num % 11 == 0)
    {
        cout << num << " is a multiple of 11" << endl;
    }
    
    if (num % 13 == 0)
    {
        cout << num << " is a multiple of 13" << endl;
    }
    
    if (num % 7 == 0 || num % 11 == 0 || num % 13 == 0)
    {

    }
    else 
    {
        cout << num << " is not a multiple of 7, 11, or 13" << endl;

        return;
    }
}

//checks if num is odd or even
void oddOrEven (int num)
{
    int digitSum = 0;

    while (num > 0)
    {
        digitSum += num % 10;

        num /= 10;
    }

    if (digitSum % 2 == 0)
    {
        cout << "Sum of the digits is even." << endl;
    }
    else
    {
        cout << "Sun of the digits is odd." << endl;
    }
}

//checks to see if number is prime
void prime (int num)
{
    bool primeTracker = true;

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
        cout << num << " is prime." << endl;

        return;
    }
    else 
    {
        cout << num << " is not prime. " << endl;

        return;
    }
}

//checks to see if num is a palindrome
void palindrome (int num)
{
    bool palindromeTracker = true;

    string numberStr = to_string(num);

    int length = numberStr.length();

    for (int i = 0; i < length / 2; i++) 
    {
        if (numberStr[i] != numberStr[length - i - 1]) 
        {
            palindromeTracker = false;
        }
    }

    if (palindromeTracker)
    {
        cout << num << " is a palindrome. " << endl;

        return;
    }
    else
    {
        cout << num << " is not a palindrome. " << endl;

        return;
    }
}

//bubble sorts array
void bubbleSort (float ary [], int size)
{
    for (int i = 0; i < size - 1; i++)
    {
        for (int j = 0; j < size - i - 1; j++) 
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

//merges two arrays
int mergeArrays (float* ary1, int size1, float* ary2, int size2, float* midAry)
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
        else // ary1[ary1i] == ary2[ary2i]
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