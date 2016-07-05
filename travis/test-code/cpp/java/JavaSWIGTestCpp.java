/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

import SWIGTestJava.*;

public class JavaSWIGTestCpp {
    public static boolean EnvironmentTest() {
        System.out.print("Starting EnvironmentTest...");

        String value = swigtest_java.getEnv("ABCDEFG");
        if(!value.equals("")) {
            System.out.println("failed.\n");
            return false;
        }

        swigtest_java.setEnv("ABCDEFG", "HIJKLMN");
        value = swigtest_java.getEnv("ABCDEFG");
        if(!value.equals("HIJKLMN")) {
            System.out.println("failed.\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean BoostExceptionTest() {
        System.out.print("Starting BoostExceptionTest...");
        if(swigtest_java.getEnv("SWIG_WRAP_BOOST_EXCEPTIONS").equals("")) {
            try {
                swigtest_java.throw_boost_exception();
            } catch(Exception e) {
                System.out.println("failed (Boost exceptions not wrapped in this build.");
                System.out.println("Message: " + e.getMessage() + "\n");
                return false;
            }
        } else {
            try {
                swigtest_java.throw_boost_exception();
                System.out.println("failed (no exception thrown).\n");
                return false;
            } catch(RuntimeException e) {
                if(!e.getMessage().contains("boost::exception")) {
                    System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" and does not contain \"boost::exception\").\n");
                    return false;
                }
            } catch(Exception e) {
                System.out.println("failed (" + e.getClass() + " thrown instead of RuntimeException).");
                System.out.println("Message: " + e.getMessage() + "\n");
                return false;
            }
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean BadExceptionTest() {
        System.out.print("Starting BadExceptionTest...");

        try {
            swigtest_java.throw_bad_exception();
        } catch(RuntimeException e) {
            if(!e.getMessage().equals("std::bad_exception")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::bad_exception\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of RuntimeException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean InvalidArgumentTest() {
        System.out.print("Starting InvalidArgumentTest...");

        try {
            swigtest_java.throw_invalid_argument();
        } catch(IllegalArgumentException e) {
            if(!e.getMessage().equals("std::invalid_argument")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::invalid_argument\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of IllegalArgumentException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean DomainErrorTest() {
        System.out.print("Starting DomainErrorTest...");

        try {
            swigtest_java.throw_domain_error();
        } catch(RuntimeException e) {
            if(!e.getMessage().equals("std::domain_error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::domain_error\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of RuntimeException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean LengthErrorTest() {
        System.out.print("Starting LengthErrorTest...");

        try {
            swigtest_java.throw_length_error();
        } catch(IndexOutOfBoundsException e) {
            if(!e.getMessage().equals("std::length_error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::length_error\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of IndexOutOfBoundsException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean OutOfRangeTest() {
        System.out.print("Starting OutOfRangeTest...");

        try {
            swigtest_java.throw_out_of_range();
        } catch(IndexOutOfBoundsException e) {
            if(!e.getMessage().equals("std::out_of_range")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::out_of_range\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of IndexOutOfBoundsException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean LogicErrorTest() {
        System.out.print("Starting LogicErrorTest...");

        try {
            swigtest_java.throw_logic_error();
        } catch(RuntimeException e) {
            if(!e.getMessage().equals("std::logic_error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::logic_error\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of RuntimeException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean RangeErrorTest() {
        System.out.print("Starting RangeErrorTest...");

        try {
            swigtest_java.throw_range_error();
        } catch(RuntimeException e) {
            if(!e.getMessage().equals("std::range_error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::range_error\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of RuntimeException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean OverflowErrorTest() {
        System.out.print("Starting OverflowErrorTest...");

        try {
            swigtest_java.throw_overflow_error();
        } catch(IndexOutOfBoundsException e) {
            if(!e.getMessage().equals("std::overflow_error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::overflow_error\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of IndexOutOfBoundsException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean UnderflowErrorTest() {
        System.out.print("Starting UnderflowErrorTest...");

        try {
            swigtest_java.throw_underflow_error();
        } catch(RuntimeException e) {
            if(!e.getMessage().equals("std::underflow_error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::underflow_error\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of RuntimeException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean RuntimeErrorTest() {
        System.out.print("Starting RuntimeErrorTest...");

        try {
            swigtest_java.throw_runtime_error();
        } catch(RuntimeException e) {
            if(!e.getMessage().equals("std::runtime_error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::runtime_error\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of RuntimeException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    /*
     * java.io.IOException is a checked exception, so we have to catch it as an Exception
     * and check it there.
     */
    public static boolean IOErrorTest() {
        System.out.print("Starting IOErrorTest...");

        try {
            swigtest_java.throw_io_error();
        } catch(Exception e) {
            if(!e.getMessage().equals("io_error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"io_error\").\n");
                return false;
            }
            if(!e.getClass().toString().equals("class java.io.IOException")) {
                System.out.println("failed (" + e.getClass() + " thrown instead of \"class java.io.IOException\").");
                System.out.println("Message: " + e.getMessage() + "\n");
                return false;
            }
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean ValueErrorTest() {
        System.out.print("Starting ValueErrorTest...");

        try {
            swigtest_java.throw_value_error();
        } catch(RuntimeException e) {
            if(!e.getMessage().equals("value_error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"value_error\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of RuntimeException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean StdExceptionTest() {
        System.out.print("Starting StdExceptionTest...");

        try {
            swigtest_java.throw_std_exception();
        } catch(RuntimeException e) {
            if(!e.getMessage().equals("std::exception")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"std::exception\").\n");
                return false;
            }
        } catch(Exception e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of RuntimeException).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static boolean UnknownErrorTest() {
        System.out.print("Starting UnknownErrorTest...");

        try {
            swigtest_java.throw_unknown();
        } catch(java.lang.UnknownError e) {
            if(!e.getMessage().equals("Unknown error")) {
                System.out.println("failed (e.getMessage() = \"" + e.getMessage() + "\" instead of \"Unknown error\").\n");
                return false;
            }
        } catch(Error e) {
            System.out.println("failed (" + e.getClass() + " thrown instead of java.lang.UnknownError).");
            System.out.println("Message: " + e.getMessage() + "\n");
            return false;
        }

        System.out.println("success.\n");
        return true;
    }

    public static void main(String[] args) {
        boolean successful  = EnvironmentTest();
        successful         &= BoostExceptionTest();
        successful         &= BadExceptionTest();
        successful         &= InvalidArgumentTest();
        successful         &= DomainErrorTest();
        successful         &= LengthErrorTest();
        successful         &= OutOfRangeTest();
        successful         &= LogicErrorTest();
        successful         &= RangeErrorTest();
        successful         &= OverflowErrorTest();
        successful         &= UnderflowErrorTest();
        successful         &= RuntimeErrorTest();
        successful         &= IOErrorTest();
        successful         &= ValueErrorTest();
        successful         &= StdExceptionTest();
        successful         &= UnknownErrorTest();

        if(successful) {
            System.exit(0);
        } else {
            System.exit(1);
        }
    }
}
