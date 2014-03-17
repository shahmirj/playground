#include <sorts.h>

/**
 * Sort an array using insertion sort
 *
 * @param begin The start position to begin from
 * @param end The end position to begin from
 */
template <class it>
void insertSort(it begin, it end)
{
    
    // Keep going till we have read all the values
    for (it j = begin; j != end; j++)
    {
	// Store the current value of the incoming card in a variable
	// so we can compare it.
	typename std::iterator_traits<it>::value_type key = *j;

	// Set i to be the value on the left hand of the current card.
	// The left had will be current which is j, -1. 
	// For Non random access iterators we have to do the following
	it i;

	// Keep moving left and replacing values as long as we are not at the 
	// end and the current value inspected greater than the key we are 
	// comparing to.
	for (i = std::prev(j); i != begin && *i > key; i--)
	{
	    *(std::next(i)) = *i;
	}

	// Get the next value from i
	*(std::next(i)) = key;
    }
}
