/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

%{
    #include "test_fcns.hpp"
%}

// Exceptions
%include <swig_exceptions.i>
SWIG_TRY
SWIG_CUSTOM_EXCEPTION(io_error,    SWIG_IOError)
SWIG_CUSTOM_EXCEPTION(value_error, SWIG_ValueError)
SWIG_CATCH

%include "swigtest_common.h"
%include "test_fcns.hpp"
