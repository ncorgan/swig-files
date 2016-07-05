/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

#ifndef INCLUDED_TEST_CLASS_HPP
#define INCLUDED_TEST_CLASS_HPP

#include "swigtest_common.h"

#include <string>

//! A simple class used to test SWIG modules.
/*!
 * This class stores an int and string. These have standard getters and
 * setters, as well as functions to randomize each.
 */
class SWIGTEST_EXPORT swigtest_class {
    public:
        //! Default constructor.
        swigtest_class();

        //! Constructor that takes an int and string.
        swigtest_class(
            const int an_int,
            const std::string &a_string
        ): _int(an_int), _string(a_string) {};

        //! Return the stored int.
        SWIGTEST_INLINE int get_int() const {
            return _int;
        }

        //! Return the stored string.
        SWIGTEST_INLINE const std::string& get_string() const {
            return _string;
        }

        //! Set the stored int.
        SWIGTEST_INLINE void set_int(
            const int an_int
        ) {
            _int = an_int;
        }

        //! Set the stored string.
        /*!
         * \throws std::length_error if the string is longer than 100 characters.
         */
        void set_string(
            const std::string &a_string
        );

        //! Randomize the stored int.
        void randomize_int();

        //! Randomize the stored string.
        void randomize_string();

    private:
        int _int;
        std::string _string;
};

#endif
