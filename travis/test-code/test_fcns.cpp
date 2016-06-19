/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

#include "test_fcns.hpp"

/*
 * Exceptions
 */

class test_exception: public std::exception {
    public:
        explicit test_exception(
            const char* msg
        ): _msg(msg) {}

        explicit test_exception(
            const std::string &msg
        ): _msg(msg) {}

        virtual ~test_exception() throw() {}

        virtual const char* what() const throw() {
            return _msg.c_str();
        }

    private:
        std::string _msg;
};

static void _unexpected() {
    throw;
}

static void _throw_bad_exception() throw (int, std::exception) {
    throw 'x';
}

void throw_bad_exception() {
    std::set_unexpected(_unexpected);
    _throw_bad_exception();
}

void throw_std_exception() {
    throw test_exception("std::exception");
}
