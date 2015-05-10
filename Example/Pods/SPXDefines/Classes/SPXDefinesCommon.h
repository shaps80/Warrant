/*
   Copyright (c) 2015 Snippex. All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY Snippex `AS IS' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL Snippex OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef _SPX_DEFINES_COMMON_H
#define _SPX_DEFINES_COMMON_H

#import <objc/runtime.h>


#define _SPX_OBJC_STRINGIFY(x) @#x
#define _SPX_STRINGIFY(x) #x

#define _SPXCompileTimeCheck(condition_, action_) (((void)(NO && ((void)condition_, NO)), action_))


/**
 *  This function determines if the specified object is a meta class or an actual instance
 *
 *  @param objOrClass The object or class to test
 *
 *  @return YES if the object is a meta class, NO otherwise
 */
static inline BOOL isMetaClass(id objOrClass)
{
  Class theClass = object_getClass(objOrClass);
  return class_isMetaClass(theClass);
}


#define SPX_DEPRECATED(msg) __attribute__((deprecated(msg)))


#endif
