/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

#ifndef INCLUDED_TEST_FCNS_HPP
#define INCLUDED_TEST_FCNS_HPP

#include "swigtest_common.h"

#ifdef SWIG_WRAP_BOOST_EXCEPTIONS
#include <boost/exception/all.hpp>
#endif

#include <stdexcept>

/*
 * These two exceptions will be specifically caught.
 */

#ifndef SWIG

class io_error: public std::exception {
    public:
        explicit io_error(
            const char* msg
        ): _msg(msg) {}

        explicit io_error(
            const std::string &msg
        ): _msg(msg) {}

        virtual ~io_error() throw() {}

        virtual const char* what() const throw() {
            return _msg.c_str();
        }

    private:
        std::string _msg;
};

class value_error: public std::exception {
    public:
        explicit value_error(
            const char* msg
        ): _msg(msg) {}

        explicit value_error(
            const std::string &msg
        ): _msg(msg) {}

        virtual ~value_error() throw() {}

        virtual const char* what() const throw() {
            return _msg.c_str();
        }

    private:
        std::string _msg;
};

#endif

//! Throws a std::bad_exception.
/*!
 * This can't be inline, as it involves other functions that shouldn't be
 * exported.
 *
 * \throws std::bad_exception by design, and that's all
 */
SWIGTEST_EXPORT void throw_bad_exception();

//! Throws a std::invalid_argument.
/*!
 * \throws std::invalid_argument by design, and that's all
 */
SWIGTEST_INLINE void throw_invalid_argument() {
    throw std::invalid_argument("std::invalid_argument");
}

//! Throws a std::domain_error.
/*!
 * \throws std::domain_error by design, and that's all
 */
SWIGTEST_INLINE void throw_domain_error() {
    throw std::domain_error("std::domain_error");
}

//! Throws a std::length_error.
/*!
 * \throws std::length_error by design, and that's all
 */
SWIGTEST_INLINE void throw_length_error() {
    throw std::length_error("std::length_error");
}

//! Throws a std::out_of_range.
/*!
 * \throws std::out_of_range by design, and that's all
 */
SWIGTEST_INLINE void throw_out_of_range() {
    throw std::out_of_range("std::out_of_range");
}

//! Throws a std::logic_error.
/*!
 * \throws std::logic_error by design, and that's all
 */
SWIGTEST_INLINE void throw_logic_error() {
    throw std::logic_error("std::logic_error");
}

//! Throws a std::range_error.
/*!
 * \throws std::range_error by design, and that's all
 */
SWIGTEST_INLINE void throw_range_error() {
    throw std::range_error("std::range_error");
}

//! Throws a std::overflow_error.
/*!
 * \throws std::overflow_error by design, and that's all
 */
SWIGTEST_INLINE void throw_overflow_error() {
    throw std::overflow_error("std::overflow_error");
}

//! Throws a std::underflow_error.
/*!
 * \throws std::underflow_error by design, and that's all
 */
SWIGTEST_INLINE void throw_underflow_error() {
    throw std::underflow_error("std::underflow_error");
}

//! Throws a std::runtime_error.
/*!
 * \throws std::runtime_error by design, and that's all
 */
SWIGTEST_INLINE void throw_runtime_error() {
    throw std::runtime_error("std::runtime_error");
}

//! Throws a io_error.
/*!
 * \throws io_error by design, and that's all
 */
SWIGTEST_INLINE void throw_io_error() {
    throw io_error("io_error");
}

//! Throws a value_error.
/*!
 * \throws value_error by design, and that's all
 */
SWIGTEST_INLINE void throw_value_error() {
    throw value_error("value_error");
}

//! Throws a std::exception.
/*!
 * \throws std::exception by design, and that's all
 */
SWIGTEST_EXPORT void throw_std_exception();

//! Throws a boost::exception.
/*!
 * \throws boost::exception by design, and that's all
 */
SWIGTEST_INLINE void throw_boost_exception() {
#ifdef SWIG_WRAP_BOOST_EXCEPTIONS
    BOOST_THROW_EXCEPTION(std::runtime_error("boost::exception"));
#endif
}

//! Throws an int.
SWIGTEST_INLINE void throw_unknown() {
    throw 5;
}

#endif
