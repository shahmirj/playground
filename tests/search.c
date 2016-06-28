//
// Created by Shahmir Javaid on 27/06/2016.
//

#include <stdlib.h>
#include <stdio.h>

/**
 * Comparison function for
 */
int compare (const void * a, const void * b)
{
    int * numberA = (int *)a;
    int * numberB = (int *)b;
    return *numberA - *numberB;
}

/**
 * Generate random numbers and sort them ready for our algorithm
 */
void generateRandomNumbers(int * array, size_t size) {

    for (int i = 0; i < size; i++) {
        // Generate a number between 1 and 1000
        array[i] = rand() % 1000;
    }

    qsort(array, size, sizeof(int), compare);
}

/**
 * Simple search
 */
int search(const int query, int * array, size_t size) {
    for (size_t i = 0; i < size; i++) {
        if (array[i] == query) {
            return (int)i;
        }
    }

    return -1;
}

/**
 * Binary search
 */
int binarySearch(const int query, int * array, size_t size) {

    // *****************************
    // Implement this
    // *****************************

    return -1;
}

int main() {

    size_t ARRAY_SIZE = 50;
    int * array = malloc(ARRAY_SIZE);

    generateRandomNumbers(array, ARRAY_SIZE);

    int foundAt = search(91, array, ARRAY_SIZE);
    //int foundAt = binarySearch(91, array, ARRAY_SIZE);

    printf("Found at %d", foundAt);

    free(array);

    return 0;
}