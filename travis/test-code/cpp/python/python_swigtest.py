#!/usr/bin/env python
#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

import swigtest_python

import os
import sys
import traceback

PYTHON_MAJOR_VERSION = sys.version_info[0]

def boost_exception_test():
    swig_wrap_boost_exceptions = os.environ["SWIG_WRAP_BOOST_EXCEPTIONS"]

    if swig_wrap_boost_exceptions is None or swig_wrap_boost_exceptions == "":
        # There should be no exception
        try:
            swigtest_python.throw_boost_exception()
        except:
            print("failed (Boost exceptions not wrapped in this build).\n")
            return False
    else:
        # There should be an exception
        try:
            swigtest_python.throw_boost_exception()
        except:
            exc_type, exc_value, exc_traceback = sys.exc_info()
            if "boost::exception" not in str(exc_value):
                print("failed (exc_value = \"{0}\" and does not contain \"boost::exception\").\n".format(exc_value))
                return False

    return True

def bad_exception_test():
    try:
        swigtest_python.throw_bad_exception()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "SystemError" not in str(exc_type):
            print("failed. Threw {0} instead of SystemError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::bad_exception":
            print("failed (exc_value = \"{0}\" instead of \"std::bad_exception\").\n".format(exc_value))
            return False

    return True

def invalid_argument_test():
    try:
        swigtest_python.throw_invalid_argument()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "ValueError" not in str(exc_type):
            print("failed. Threw {0} instead of ValueError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::invalid_argument":
            print("failed (exc_value = \"{0}\" instead of \"std::invalid_argument\").\n".format(exc_value))
            return False

    return True

def domain_error_test():
    try:
        swigtest_python.throw_domain_error()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "ValueError" not in str(exc_type):
            print("failed. Threw {0} instead of ValueError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::domain_error":
            print("failed (exc_value = \"{0}\" instead of \"std::domain_error\").\n".format(exc_value))
            return False

    return True

def length_error_test():
    try:
        swigtest_python.throw_length_error()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "IndexError" not in str(exc_type):
            print("failed. Threw {0} instead of IndexError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::length_error":
            print("failed (exc_value = \"{0}\" instead of \"std::length_error\").\n".format(exc_value))
            return False

    return True

def out_of_range_test():
    try:
        swigtest_python.throw_out_of_range()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "IndexError" not in str(exc_type):
            print("failed. Threw {0} instead of IndexError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::out_of_range":
            print("failed (exc_value = \"{0}\" instead of \"std::out_of_range\").\n".format(exc_value))
            return False

    return True

def logic_error_test():
    try:
        swigtest_python.throw_logic_error()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "SystemError" not in str(exc_type):
            print("failed. Threw {0} instead of SystemError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::logic_error":
            print("failed (exc_value = \"{0}\" instead of \"std::logic_error\").\n".format(exc_value))
            return False

    return True

def range_error_test():
    try:
        swigtest_python.throw_range_error()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "RuntimeError" not in str(exc_type):
            print("failed. Threw {0} instead of RuntimeError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::range_error":
            print("failed (exc_value = \"{0}\" instead of \"std::range_error\").\n".format(exc_value))
            return False

    return True

def overflow_error_test():
    try:
        swigtest_python.throw_overflow_error()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "OverflowError" not in str(exc_type):
            print("failed. Threw {0} instead of OverflowError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::overflow_error":
            print("failed (exc_value = \"{0}\" instead of \"std::overflow_error\").\n".format(exc_value))
            return False

    return True

def underflow_error_test():
    try:
        swigtest_python.throw_underflow_error()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "RuntimeError" not in str(exc_type):
            print("failed. Threw {0} instead of RuntimeError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::underflow_error":
            print("failed (exc_value = \"{0}\" instead of \"std::underflow_error\").\n".format(exc_value))
            return False

    return True

def runtime_error_test():
    try:
        swigtest_python.throw_runtime_error()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "RuntimeError" not in str(exc_type):
            print("failed. Threw {0} instead of RuntimeError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::runtime_error":
            print("failed (exc_value = \"{0}\" instead of \"std::runtime_error\").\n".format(exc_value))
            return False

    return True

def io_error_test():
    try:
        swigtest_python.throw_io_error()
    except:
        errname = "IOError" if PYTHON_MAJOR_VERSION == 2 else "OSError"
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if errname not in str(exc_type):
            print("failed. Threw {0} instead of {1}.\n".format(exc_type, errname))
            return False
        elif str(exc_value) != "io_error":
            print("failed (exc_value = \"{0}\" instead of \"io_error\").\n".format(exc_value))
            return False

    return True

def value_error_test():
    try:
        swigtest_python.throw_value_error()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "ValueError" not in str(exc_type):
            print("failed. Threw {0} instead of ValueError.\n".format(exc_type))
            return False
        elif str(exc_value) != "value_error":
            print("failed (exc_value = \"{0}\" instead of \"value_error\").\n".format(exc_value))
            return False

    return True

def std_exception_test():
    try:
        swigtest_python.throw_std_exception()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "SystemError" not in str(exc_type):
            print("failed. Threw {0} instead of SystemError.\n".format(exc_type))
            return False
        elif str(exc_value) != "std::exception":
            print("failed (exc_value = \"{0}\" instead of \"std::exception\").\n".format(exc_value))
            return False

    return True

def unknown_error_test():
    try:
        swigtest_python.throw_unknown()
    except:
        exc_type, exc_value, exc_traceback = sys.exc_info()
        if "RuntimeError" not in str(exc_type):
            print("failed. Threw {0} instead of RuntimeError.\n".format(exc_type))
            return False
        elif str(exc_value) != "Unknown error":
            print("failed (exc_value = \"{0}\" instead of \"Unknown error\").\n".format(exc_value))
            return False

    return True

if __name__ == "__main__":

    successful = True
    for test in [boost_exception_test, bad_exception_test, invalid_argument_test, \
                 domain_error_test, length_error_test, out_of_range_test, \
                 logic_error_test, range_error_test, overflow_error_test, \
                 underflow_error_test, runtime_error_test, io_error_test, \
                 value_error_test, std_exception_test, unknown_error_test]:
        sys.stdout.write("Starting test %s..." % test.__name__)
        result = test()
        if result:
            print("success.\n")
        successful = successful and result

    sys.exit(0 if successful else 1)
