/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

%include <swig_exceptions.i>
SWIG_CATCH_DEFAULT

%{
    #include "test_fcns.hpp"
%}

%include "test_fcns.hpp"
