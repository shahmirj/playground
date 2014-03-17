
/**
 * Load the data from file and represent it as an array of records
 *
 * @param filename The file to load from
 */
template <class T>
std::vector<T> arrayFromFile(std::string filename)
{
    std::vector<T> ar();
    return ar;
}

/**
 * Print the array given by the iterator
 *
 * @param begin The starting position to print from
 * @param end The end position to end
 * @param separator The separator to use to separate the values
 */ 
template <class it>
void printArray(it begin, it end, std::string separator)
{
    it current;
    for (current = begin; current != end; current++)
    {
        if (current != begin)
            std::cout << separator;

        std::cout << *current;
    }

    if (current != begin)
        std::cout << std::endl;
}
