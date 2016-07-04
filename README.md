![Travis-CI Build](https://travis-ci.org/ncorgan/swig-files.svg)

This repo contains SWIG macros and CMake scripts that make building SWIG-based
projects easier.

**SWIG files:**
 * swig_exceptions.i: language-independent macros for catching C++ exceptions
 * java/java_env.i: allow getting/setting environment variables from Java
 * java/java_init.i: import SWIG-generated native libraries when JAR is imported

**CMake files:**
 * FindCSharp.cmake: finds a suitable .NET or Mono compiler
 * FindDotNetFrameworkSdk.cmake: finds local .NET installations
 * FindMono.cmake: finds local Mono installations
 * UseCSharp.cmake: macros for building C# DLL's and executables
 * SWIGCSharp.cmake: macros for building C# SWIG modules
 * SWIGJava.cmake: macros for building Java SWIG modules
 * SWIGPython.cmake: macros for building Python SWIG modules

README last updated: 2016/07/03
