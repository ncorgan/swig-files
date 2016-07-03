/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

#ifndef INCLUDED_TEST_FCNS_HPP
#define INCLUDED_TEST_FCNS_HPP

#if defined(_MSC_VER)
#    define SWIGTEST_EXPORT __declspec(dllexport)
#    define SWIGTEST_INLINE __forceinline
#elif defined(__GNUG__) && __GNUG__ >= 4
#    define SWIGTEST_EXPORT __attribute__((visibility("default")))
#    define SWIGTEST_INLINE inline __attribute__((always_inline))
#else
#    define SWIGTEST_EXPORT
#    define SWIGTEST_INLINE inline
#endif

#ifdef SWIG_WRAP_BOOST_EXCEPTIONS
#include <boost/exception/all.hpp>
#endif

#include <stdexcept>

/*
 * Exceptions
 */

SWIGTEST_EXPORT void throw_bad_exception();

SWIGTEST_INLINE void throw_invalid_argument() {
    throw std::invalid_argument("std::invalid_argument");
}

SWIGTEST_INLINE void throw_domain_error() {
    throw std::domain_error("std::domain_error");
}

SWIGTEST_INLINE void throw_length_error() {
    throw std::length_error("std::length_error");
}

SWIGTEST_INLINE void throw_out_of_range() {
    throw std::out_of_range("std::out_of_range");
}

SWIGTEST_INLINE void throw_logic_error() {
    throw std::logic_error("std::logic_error");
}

SWIGTEST_INLINE void throw_range_error() {
    throw std::range_error("std::range_error");
}

SWIGTEST_INLINE void throw_overflow_error() {
    throw std::overflow_error("std::overflow_error");
}

SWIGTEST_INLINE void throw_underflow_error() {
    throw std::underflow_error("std::underflow_error");
}

SWIGTEST_INLINE void throw_runtime_error() {
    throw std::runtime_error("std::runtime_error");
}

SWIGTEST_EXPORT void throw_std_exception();

SWIGTEST_INLINE void throw_boost_exception() {
#ifdef SWIG_WRAP_BOOST_EXCEPTIONS
    BOOST_THROW_EXCEPTION(std::runtime_error("boost::exception"));
#endif
}

SWIGTEST_INLINE void throw_unknown() {
    throw 5;
}

#endif
