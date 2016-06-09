This repo contains useful SWIG and CMake macros I've written or used
over the years.

**SWIG files:**
 * swig_exceptions.i: language-independent macros for catching C++ exceptions
 * java/java_env.i: allow getting/setting environment variables from Java
 * java/java_init.i: import SWIG-generated native libraries when JAR is imported

**CMake files:**
 * SWIGJava.cmake: CMake macros for building Java SWIG modules
 * SWIGPython.cmake: CMake macro for building Python SWIG modules

README last updated: 2016/06/08
