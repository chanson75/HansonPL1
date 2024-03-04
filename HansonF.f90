! //Name: Carter Hanson
! //Due Date: 2-7-24
! //Description: FORTRAN implementation of part a of Assign 1. This program checks the following from the input file:

! // a. Is the value a multiple of 7, 11, or 13?
! // b. Is the sum of the digit’s odds or even?
! // c. Is the value a prime number?
! // d. Is the number a palindrome?

! // ! Write a function that will merge the contents of two sorted (ascending order) arrays of
! // ! the type FLOAT values, use an efficient bubble sort to sort two arrays first, and then use
! // ! the merge function. (Your program should not sort the whole array after appending one
! // ! array to another array.) The function should not assume that both its input parameter
! // ! arrays are the same length but can assume that one array does not contain two copies of
! // ! the same value. The resulting array should also contain no duplicate values.

program HansonF
    implicit none

    character :: choice
    
    integer :: i, size1, size2, max_size
    
    integer, parameter :: num(14) = [3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121]
    
    real, dimension(5) :: array1
    
    real, dimension(4) :: array2
    
    real, dimension(9) :: mergedArray

    print *, "Would you like part a (a or A) or b (b or B):"
    
    read(*, *) choice

    !Program A
    if (choice == 'a' .OR. choice == 'A') then
        do i = 1, 14
        
            print *, "---",  num(i)
        
            call isDivisble(num(i))
        
            call oddOrEven(num(i))
        
            call prime(num(i))
        
            call palindrome(num(i))
        
        end do
    
    !Program B
    else if (choice == 'b' .OR. choice == 'B') then
        size1 = 5
     
        size2 = 4
     
        max_size = 9

        array1 = [32.0, 38.1, 843.1, 284.9, 8.13]
     
        array2 = [492.1, 83.2939, 284.9, 8.13]

        call bubbleSort(array1, size1)
     
        call bubbleSort(array2, size2)

        call mergeArrays(array1, size1, array2, size2, mergedArray, max_size)
     
        call printMerged(mergedArray, max_size)
    
    else 
        print*, "Error: please make a correct choice!"
    
    end if

contains
    !checks to see what number is divisble by if at all
    subroutine isDivisble(num)
        integer, intent(in) :: num
       
        if (mod(num, 7) == 0) then
            print *, num, " is a multiple of 7."
       
        end if
       
        if (mod(num, 11) == 0) then
            print *, num, " is a multiple of 11."
       
        end if
       
        if (mod(num, 13) == 0) then
            print *, num, " is a multiple of 13."
       
        end if
       
        if(mod(num, 7) /= 0 .and. mod(num,11) /= 0 .and. mod(num,13) /=0) then
            print *, num, " is not a multiple of 7, 11, or 13."
       
        end if
    
    end subroutine isDivisble

    !checks if num is odd or even
    subroutine oddOrEven(num)
        integer, intent(in) :: num
    
        integer :: changedNum, sum, digit
    
        changedNum = num
    
        sum = 0
    
        do while (changedNum > 0)
            digit = mod(changedNum, 10)
    
            sum = sum + digit
    
            changedNum = changedNum / 10
    
        end do

        if (mod(sum, 2) == 0) then
            print *, "        The sum of the digits is even."
    
        else
            print *, "        The sum of the digits is odd."
    
        end if
    
    end subroutine oddOrEven

    !checks to see if number is prime
    subroutine prime(num)
        integer, intent(in) :: num
    
        logical :: isPrime
    
        integer :: i
    
        isPrime = .true.
    
        if (num <= 1) then
            print *, num, " is not prime."
    
            isPrime = .false.
    
        end if
    
        if (isPrime) then
            do i = 2, int(sqrt(real(num)))
                if (mod(num, i) == 0) then
                    print *, num, " is not prime."
    
                    isPrime = .false.
    
                    exit
                end if
            end do
        end if

        if (isPrime) then
            print *, num, " is prime."
    
        end if
    
    end subroutine prime


    !checks to see if num is a palindrome
    subroutine palindrome(num)
        integer, intent(in) :: num
    
        integer :: originalNum, reversedNum, digit, tempNum
    
        originalNum = num
    
        reversedNum = 0
    
        tempNum = num

        do while (tempNum > 0)
            digit = mod(tempNum, 10)
    
            reversedNum = reversedNum * 10 + digit
    
            tempNum = tempNum / 10
    
        end do

        if (originalNum == reversedNum) then
            print *, originalNum, " is a palindrome."
    
        else
            print *, originalNum, " is not a palindrome."
    
        end if
    
    end subroutine palindrome


    !bubble sorts array
    subroutine bubbleSort(arr, size)
        real, intent(inout) :: arr(:)
    
        integer, intent(in) :: size
    
        integer :: i, j
    
        real :: temp
    
        do i = 1, size - 1
            do j = 1, size - i
                if (arr(j) > arr(j + 1)) then
                    temp = arr(j)
    
                    arr(j) = arr(j + 1)
    
                    arr(j + 1) = temp
                end if
            end do
        end do
    end subroutine bubbleSort

    !merges two arrays
    subroutine mergeArrays(arr1, size1, arr2, size2, mergedArr, mergedSize)
        real, intent(in) :: arr1(:), arr2(:)
    
        real, intent(out) :: mergedArr(:)
    
        integer, intent(in) :: size1, size2
    
        integer :: arr1index, arr2index, mergedindex
    
        integer :: mergedSize
    
        mergedSize = 0
    
        arr1index = 1
    
        arr2index = 1
    
        mergedindex = 1

        do while (arr1index <= size1 .and. arr2index <= size2)
            if (arr1(arr1index) < arr2(arr2index)) then
                mergedArr(mergedindex) = arr1(arr1index)
        
                arr1index = arr1index + 1
        
            else if (arr1(arr1index) > arr2(arr2index)) then
                mergedArr(mergedindex) = arr2(arr2index)
        
                arr2index = arr2index + 1
            else
                mergedArr(mergedindex) = arr1(arr1index)
        
                arr1index = arr1index + 1
        
                arr2index = arr2index + 1
        
            end if
        
            mergedindex = mergedindex + 1
        end do

        do while (arr1index <= size1)
            mergedArr(mergedindex) = arr1(arr1index)
        
            arr1index = arr1index + 1
        
            mergedindex = mergedindex + 1
        
        end do

        do while (arr2index <= size2)
            mergedArr(mergedindex) = arr2(arr2index)
        
            arr2index = arr2index + 1
        
            mergedindex = mergedindex + 1
        
        end do

        mergedSize = mergedindex-1

    end subroutine mergeArrays

    !prints merged array
    subroutine printMerged(mergedArray, size)
        real, intent(in) :: mergedArray(:)
        
        integer, intent(in) :: size
        
        integer :: i
        
        do i = 1, size
            print '(F8.2)', mergedArray(i)
        
        end do
    
    end subroutine printMerged

end program HansonF