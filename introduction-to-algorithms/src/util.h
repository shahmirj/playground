
#ifndef UTIL_H_
#define UTIL_H_

#include <vector>
#include <array>
#include <iostream>

template <class T>
std::vector<T> arrayFromFile(std::string filename);

// Print the memory address of each value
template <class it>
void printArray(it begin, it end, std::string separator = ",");

#include "util.tpp"

#endif
