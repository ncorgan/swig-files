/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

#include "test_class.hpp"

#include <cstdlib>
#include <ctime>
#include <stdexcept>

swigtest_class::swigtest_class() {
    randomize_int();
    randomize_string();
}

void swigtest_class::set_string(
    const std::string &a_string
) {
    if(a_string.size() > 100) {
        throw std::length_error("Invalid length.");
    }

    _string = a_string;
}

void swigtest_class::randomize_int() {
    std::srand(std::time(NULL));
    _int = int(rand());
}

void swigtest_class::randomize_string() {
    _string = "";

    std::srand(std::time(NULL));
    for(size_t i = 0; i < 10; ++i) {
        _string += (char(rand() % 95) + 32);
    }
}
