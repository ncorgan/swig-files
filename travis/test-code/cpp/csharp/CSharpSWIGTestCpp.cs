/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

public class CSharpSWIGTestCpp {
    public static bool BoostExceptionTest() {
        System.Console.Write("Starting BoostExceptionTest...");
        string swigWrapBoostExceptions = System.Environment.GetEnvironmentVariable("SWIG_WRAP_BOOST_EXCEPTIONS");
        if(swigWrapBoostExceptions == null || swigWrapBoostExceptions.Equals("")) {
            try {
                SWIGTestCSharp.throw_boost_exception();
            } catch(System.Exception e) {
                System.Console.WriteLine("failed (Boost exceptions not wrapped in this build).");
                System.Console.WriteLine("Message: " + e.Message + "\n");
                return false;
            }
        } else {
            try {
                SWIGTestCSharp.throw_boost_exception();
                System.Console.WriteLine("failed (no exception thrown).\n");
                return false;
            } catch(System.ApplicationException e) {
                if(!e.Message.Contains("boost::exception")) {
                    System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" and does not contain \"boost::exception\".\n");
                    return false;
                }
            } catch(System.Exception e) {
                System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ApplicationException).");
                System.Console.WriteLine("Message: " + e.Message + "\n");
                return false;
            }
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool BadExceptionTest() {
        System.Console.Write("Starting BadExceptionTest...");
        try {
            SWIGTestCSharp.throw_bad_exception();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ApplicationException e) {
            if(!e.Message.Equals("std::bad_exception")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::bad_exception\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ApplicationException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool InvalidArgumentTest() {
        System.Console.Write("Starting InvalidArgumentTest...");
        try {
            SWIGTestCSharp.throw_invalid_argument();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ArgumentException e) {
            if(!e.Message.Equals("std::invalid_argument")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::invalid_argument\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ArgumentException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool DomainErrorTest() {
        System.Console.Write("Starting DomainErrorTest...");
        try {
            SWIGTestCSharp.throw_domain_error();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ArgumentOutOfRangeException e) {
            if(!e.Message.Equals("std::domain_error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::domain_error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ArgumentOutOfRangeException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool LengthErrorTest() {
        System.Console.Write("Starting LengthErrorTest...");
        try {
            SWIGTestCSharp.throw_length_error();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.IndexOutOfRangeException e) {
            if(!e.Message.Equals("std::length_error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::length_error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.IndexOutOfRangeException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool OutOfRangeTest() {
        System.Console.Write("Starting OutOfRangeTest...");
        try {
            SWIGTestCSharp.throw_out_of_range();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.IndexOutOfRangeException e) {
            if(!e.Message.Equals("std::out_of_range")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::out_of_range\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.IndexOutOfRangeException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool LogicErrorTest() {
        System.Console.Write("Starting LogicErrorTest...");
        try {
            SWIGTestCSharp.throw_logic_error();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ApplicationException e) {
            if(!e.Message.Equals("std::logic_error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::logic_error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ApplicationException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool RangeErrorTest() {
        System.Console.Write("Starting RangeErrorTest...");
        try {
            SWIGTestCSharp.throw_range_error();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ApplicationException e) {
            if(!e.Message.Equals("std::range_error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::range_error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ApplicationException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool OverflowErrorTest() {
        System.Console.Write("Starting OverflowErrorTest...");
        try {
            SWIGTestCSharp.throw_overflow_error();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.OverflowException e) {
            if(!e.Message.Equals("std::overflow_error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::overflow_error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.OverflowException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool UnderflowErrorTest() {
        System.Console.Write("Starting UnderflowErrorTest...");
        try {
            SWIGTestCSharp.throw_underflow_error();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ApplicationException e) {
            if(!e.Message.Equals("std::underflow_error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::underflow_error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ApplicationException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool RuntimeErrorTest() {
        System.Console.Write("Starting RuntimeErrorTest...");
        try {
            SWIGTestCSharp.throw_runtime_error();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ApplicationException e) {
            if(!e.Message.Equals("std::runtime_error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::runtime_error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ApplicationException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool IOErrorTest() {
        System.Console.Write("Starting IOErrorTest...");
        try {
            SWIGTestCSharp.throw_io_error();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.IO.IOException e) {
            if(!e.Message.Equals("io_error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"io_error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.IO.IOException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool ValueErrorTest() {
        System.Console.Write("Starting ValueErrorTest...");
        try {
            SWIGTestCSharp.throw_value_error();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ArgumentOutOfRangeException e) {
            if(!e.Message.Equals("value_error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"value_error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ArgumentOutOfRangeException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool StdExceptionTest() {
        System.Console.Write("Starting StdExceptionTest...");
        try {
            SWIGTestCSharp.throw_std_exception();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ApplicationException e) {
            if(!e.Message.Equals("std::exception")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"std::exception\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ApplicationException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static bool UnknownErrorTest() {
        System.Console.Write("Starting UnknownErrorTest...");
        try {
            SWIGTestCSharp.throw_unknown();
            System.Console.WriteLine("failed (no exception thrown).\n");
            return false;
        } catch(System.ApplicationException e) {
            if(!e.Message.Equals("Unknown error")) {
                System.Console.WriteLine("failed (e.Message = \"" + e.Message +"\" instead of \"Unknown error\"\n");
                return false;
            }
        } catch(System.Exception e) {
            System.Console.WriteLine("failed (" + e.GetType() + " thrown instead of System.ApplicationException).");
            System.Console.WriteLine("Message: " + e.Message + "\n");
            return false;
        }

        System.Console.WriteLine("success.\n");
        return true;
    }

    public static int Main(string[] args) {
        bool successful  = BoostExceptionTest();
        successful      &= BadExceptionTest();
        successful      &= InvalidArgumentTest();
        successful      &= DomainErrorTest();
        successful      &= LengthErrorTest();
        successful      &= OutOfRangeTest();
        successful      &= LogicErrorTest();
        successful      &= RangeErrorTest();
        successful      &= OverflowErrorTest();
        successful      &= UnderflowErrorTest();
        successful      &= RuntimeErrorTest();
        successful      &= IOErrorTest();
        successful      &= ValueErrorTest();
        successful      &= StdExceptionTest();
        successful      &= UnknownErrorTest();

        return successful ? 0 : 1;
    }
}
