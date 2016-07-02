/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

/*
 * Java has no API for getting and setting environment variables, so this module
 * wraps the corresponding C-level functions for this functionality. An example
 * case where this would be useful is in an Android project, where there is a set
 * location for assets, and the underlying C/C++ library checks an environment
 * variable for their location. Assuming the module is called CEnv, if CEnv.java
 * and CEnvJNI.java are included in a JAR, these functions can be called upon
 * import inside a static { } as follows:
 *
 * CEnv.setEnv("MYPKG_ASSETS_DIR", "/data/assets/dir")
 */

#ifndef SWIGJAVA
#error java_env.i is only meant to be used with Java modules.
#endif

%{

#include <stdlib.h>

inline char* getEnv(
    const char* key
) {
    char* val = getenv(key);
    return val ? val : (char*)"";
}

inline void setEnv(
    const char* key,
    const char* val
) {
#if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
    _putenv_s(key, val);
#else
    setenv(key, val, 0);
#endif
}

inline void unsetEnv(
    const char* key
) {
#if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
    _putenv_s(key, "");
#else
    unsetenv(key);
#endif
}

%}

char* getEnv(const char* key);
void setEnv(const char* key, const char* val);
void unsetEnv(const char* key);
