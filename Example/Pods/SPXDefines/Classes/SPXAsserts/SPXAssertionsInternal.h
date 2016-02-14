/*
 Copyright (c) 2014 Shaps Mohsenin. All rights reserved.
 
 This code is based on a collaboration by Krzysztof Zabłocki and Sam Dods.
 Krzysztof Zabłocki: https://github.com/krzysztofzablocki
 Sam Dods: https://github.com/samdods
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY Shaps Mohsenin `AS IS' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANSPXILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL Shaps Mohsenin OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#ifndef _SPX_ASSERTION_INTERNALS_H
#define _SPX_ASSERTION_INTERNALS_H



#import <Foundation/Foundation.h>



/**
 *  Error status codes
 */
typedef NS_ENUM(NSInteger, _SPXAssertionsInternalError) {
  /**
   *  Internal error code
   */
  _SPXAssertionsInternalErrorCode = 44324344,
};



/**
 *  Constructs an NSError object
 *
 *  @param message            The message for this error
 *  @param code               The status code for this error
 *  @param aUserInfo          Any user info as an NSDictionary for this error
 *  @param methodOrFunction   The method or function that caused this error
 *
 *  @return An instance of NSError
 */
extern NSError *_SPXAssertionsErrorMake(NSString *message, Class klass, NSString *methodOrFunction);


#pragma mark The following are for internal use only and should not be modified!


// The following generic macros are intended for internal-use only, for external use, see documented macros above.
#define NSObjcAssert NSAssert
#define _SPXInvalidConditionString(condition) (@"Invalid condition not satisfying: " #condition)
#define _SPXGenericAssertCondition(ctype, condition) NS ## ctype ## Assert((condition), _SPXInvalidConditionString((condition)))
#define _SPXGenericErrorMake(condition, class, func) _SPXAssertionsErrorMake(_SPXInvalidConditionString(condition), class, func)
#define _SPXGenericAssertTrueOrPerformAction(ctype, condition, action) ({ _SPX ## ctype ## AssertCondition(condition); \
if (!(condition)) { _SPX ## ctype ## ErrorMake(condition); action; } })
#define _SPXGenericAssertTrueOrReturnError(ctype, condition) {{ _SPX ## ctype ## AssertCondition(condition); \
if (!(condition)) { return _SPX ## ctype ## ErrorMake(condition); } })


// Intended for internal-use only.
#define _SPXObjcAssertCondition(condition) _SPXGenericAssertCondition(Objc, condition)
// Intended for internal-use only.
#define _SPXObjcErrorMake(condition) _SPXGenericErrorMake((condition), self.class, NSStringFromSelector(_cmd))

// Intended for internal-use only.
#define _SPXCAssertCondition(condition) _SPXGenericAssertCondition(C, condition)
// Intended for internal-use only.
#define _SPXCErrorMake(condition) _SPXGenericErrorMake((condition), nil, [NSString stringWithUTF8String:__PRETTY_FUNCTION__])



#endif



