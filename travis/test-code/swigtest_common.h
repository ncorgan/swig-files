/*
 * Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
 *
 * Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
 * or copy at http://opensource.org/licenses/MIT)
 */

#ifndef INCLUDED_SWIGTEST_COMMON_H
#define INCLUDED_SWIGTEST_COMMON_H

#if defined(_MSC_VER)
#    define SWIGTEST_EXPORT __declspec(dllexport)
#    define SWIGTEST_INLINE __forceinline
#elif defined(__GNUG__) && __GNUG__ >= 4
#    define SWIGTEST_EXPORT __attribute__((visibility("default")))
#    define SWIGTEST_INLINE inline __attribute__((always_inline))
#else
#    define SWIGTEST_EXPORT
#    define SWIGTEST_INLINE inline
#endif

#endif
