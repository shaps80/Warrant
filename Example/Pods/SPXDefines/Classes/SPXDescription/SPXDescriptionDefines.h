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


#ifndef _SPX_DESCRIPTION_DEFINES_H
#define _SPX_DESCRIPTION_DEFINES_H

#import "SPXDescriptionInternal.h"



/**
 *  Provides auto-completion and compile-time warnings for properties on an object.
 *  @param keyPath    The keyPath representing the property on this object
 */
#define SPXKeyPath(keyPath) _SPXKeyPathT(self, keyPath)


/**
 *  Provides auto-completion and compile-time warnings for properties on an object.
 *  @param target   The target this keyPath should exist on
 *  @param keyPath  The keyPath representing the property on this object
 */
#define SPXKeyPathT(target, keyPath) _SPXKeyPathT(target, keyPath)


/**
 *  Provides a better description for use in [object description] -- ideally used with the macro's above.
 *  @param va_list  A variadic list of keyPaths to provide a description for
 */
#define SPXDescription(...) _SPXDescriptionT(self, ##__VA_ARGS__)


/**
 *  Provides a better description for use in [object description] -- ideally used with the macro's above.
 *  @param target   The target to provide a description for. Useful when you need a description of a 3rd party object
 *  @param va_list  A variadic list of keyPaths to provide a description for
 */
#define SPXDescriptionT(target, ...) _SPXDescriptionT(target, ##__VA_ARGS__)



#endif

