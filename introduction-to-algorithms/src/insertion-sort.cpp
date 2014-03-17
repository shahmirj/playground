#include <util.h>
#include <string.h>
#include <sorts.h>
#include <list>

int main()
{
    std::vector<int> ar = { 500, 30, 20, 23, 6, 29, 45, 22, 19 };
    printArray(ar.begin(), ar.end(), ", ");
    insertSort(ar.begin(), ar.end());
    printArray(ar.begin(), ar.end(), ", ");

    /**
    int a[10] = { 234, 2, 34, 23, 12, 0, -20, -12, 29, -100 };
    printArray(a, a+10, ", ");
    insertSort(a, a+10);
    printArray(a, a+10, ", ");
    */

    return 0;
}
