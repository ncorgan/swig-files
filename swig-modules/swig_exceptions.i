/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

/*
 * This file adds the following macros for all languages:
 *
 * SWIG_CATCH_EXCEPTIONS - Catches std::exception and it subclasses, as well as
 *                         unknown errors. Should be used when you are not catching
 *                         any custom exceptions.
 *
 * The following macros should be used when you add a custom exception.
 *
 * SWIG_TRY              - Starts a SWIG try/catch statement.
 *
 * SWIG_CUSTOM_EXCEPTION - Adds a catch statement for a custom exception. Must be a
 *                         subclass of std::exception.
 *
 * SWIG_CATCH            - Catches all standard C++ exceptions, as well as unknown
 *                         errors.
 *
 * The following code snippet shows how to use these together.
 *
 * SWIG_TRY
 * SWIG_CUSTOM_EXCEPTION(my_first_exception)
 * SWIG_CUSTOM_EXCEPTION(my_other_exception)
 * SWIG_CATCH
 */

#if SWIGCSHARP

%include <std_string.i>

%{
    #include <stdexcept>
%}

%define _SWIG_CSHARP_EXCEPTION(cpp, csharp)
    catch(const cpp &e) {
        SWIG_CSharpSetPendingException(
            csharp, e.what()
        );
        return $null;
    }
%enddef

%define _SWIG_CSHARP_ARGS_EXCEPTION(cpp, csharp)
    catch(const cpp &e) {
        SWIG_CSharpSetPendingExceptionArgument(
            csharp, e.what(), ""
        );
        return $null;
    }
%enddef

%define SWIG_CUSTOM_EXCEPTION(name)
    _SWIG_CSHARP_EXCEPTION(name, SWIG_CSharpApplicationException)
%enddef

%define SWIG_CATCH
        _SWIG_CSHARP_EXCEPTION(std::bad_exception, SWIG_CSharpApplicationException)
        _SWIG_CSHARP_ARGS_EXCEPTION(std::invalid_argument, SWIG_CSharpArgumentException)
        _SWIG_CSHARP_EXCEPTION(std::domain_error, SWIG_CSharpApplicationException)
        _SWIG_CSHARP_EXCEPTION(std::length_error, SWIG_CSharpIndexOutOfRangeException)
        _SWIG_CSHARP_ARGS_EXCEPTION(std::out_of_range, SWIG_CSharpArgumentOutOfRangeException)
        _SWIG_CSHARP_EXCEPTION(std::logic_error, SWIG_CSharpApplicationException)
        _SWIG_CSHARP_EXCEPTION(std::range_error, SWIG_CSharpIndexOutOfRangeException)
        _SWIG_CSHARP_EXCEPTION(std::overflow_error, SWIG_CSharpOverflowException)
        _SWIG_CSHARP_EXCEPTION(std::underflow_error, SWIG_CSharpOverflowException)
        _SWIG_CSHARP_EXCEPTION(std::runtime_error, SWIG_CSharpApplicationException)
        _SWIG_CSHARP_EXCEPTION(std::exception, SWIG_CSharpApplicationException)
        catch (...) {
            SWIG_CSharpSetPendingException(
                SWIG_CSharpApplicationException,
                "Unknown error."
            );
            return $null;
        }
    }
%enddef

#elif SWIGJAVA

%include <std_string.i>

%{
    #include <stdexcept>
%}

%define _SWIG_JAVA_EXCEPTION(cpp, java)
    catch(const cpp &e) {
        SWIG_JavaThrowException(
            jenv, java, e.what()
        );
        return $null;
    }
%enddef

%define SWIG_CUSTOM_EXCEPTION(name)
    _SWIG_JAVA_EXCEPTION(name, SWIG_JavaRuntimeException)
%enddef

%define SWIG_CATCH
        _SWIG_JAVA_EXCEPTION(std::bad_exception, SWIG_JavaRuntimeException)
        _SWIG_JAVA_EXCEPTION(std::invalid_argument, SWIG_JavaIllegalArgumentException)
        _SWIG_JAVA_EXCEPTION(std::domain_error, SWIG_JavaRuntimeException)
        _SWIG_JAVA_EXCEPTION(std::length_error, SWIG_JavaIndexOutOfBoundsException)
        _SWIG_JAVA_EXCEPTION(std::out_of_range, SWIG_JavaIndexOutOfBoundsException)
        _SWIG_JAVA_EXCEPTION(std::logic_error, SWIG_JavaRuntimeException)
        _SWIG_JAVA_EXCEPTION(std::range_error, SWIG_JavaIndexOutOfBoundsException)
        _SWIG_JAVA_EXCEPTION(std::overflow_error, SWIG_JavaArithmeticException)
        _SWIG_JAVA_EXCEPTION(std::underflow_error, SWIG_JavaArithmeticException)
        _SWIG_JAVA_EXCEPTION(std::runtime_error, SWIG_JavaRuntimeException)
        _SWIG_JAVA_EXCEPTION(std::exception, SWIG_JavaRuntimeException)
        catch (...) {
            SWIG_JavaThrowException(
                jenv, SWIG_JavaRuntimeException,
                "Unknown error."
            );
            return $null;
        }
    }
%enddef

#else

%include <typemaps/exception.swg>

%define SWIG_CUSTOM_EXCEPTION(name)
    catch (const name &e) {
        SWIG_exception_fail(
            SWIG_RuntimeError,
            e.what()
        );
    }
%enddef

%define SWIG_CATCH
        SWIG_CATCH_STDEXCEPT
        catch (...) {
            SWIG_exception_fail(
                SWIG_UnknownError,
                "Unknown error"
            );
        }
    }
%enddef

#endif

%define SWIG_TRY
    %exception {
        try { $action }
%enddef

%define SWIG_CATCH_EXCEPTIONS
    SWIG_TRY
    SWIG_CATCH
%enddef
