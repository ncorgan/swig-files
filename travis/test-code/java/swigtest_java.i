/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

%include <java/java_init.i>
JAVA_INIT("swigtest_java")

%include <swig_exceptions.i>
SWIG_CATCH_EXCEPTIONS

%{
    #include "test_fcns.hpp"
%}

%include <java/java_env.i>
%include "test_fcns.hpp"
