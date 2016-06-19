/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

#ifndef INCLUDED_TEST_FCNS_HPP
#define INCLUDED_TEST_FCNS_HPP

#include <stdexcept>

/*
 * Exceptions
 */

void throw_bad_exception();

inline void throw_invalid_argument() {
    throw std::invalid_argument("std::invalid_argument");
}

inline void throw_domain_error() {
    throw std::domain_error("std::domain_error");
}

inline void throw_length_error() {
    throw std::length_error("std::length_error");
}

inline void throw_out_of_range() {
    throw std::out_of_range("std::out_of_range");
}

inline void throw_logic_error() {
    throw std::logic_error("std::logic_error");
}

inline void throw_range_error() {
    throw std::range_error("std::range_error");
}

inline void throw_overflow_error() {
    throw std::overflow_error("std::overflow_error");
}

inline void throw_underflow_error() {
    throw std::underflow_error("std::underflow_error");
}

inline void throw_runtime_error() {
    throw std::runtime_error("std::runtime_error");
}

void throw_std_exception();

inline void throw_unknown() {
    throw 5;
}

#endif
