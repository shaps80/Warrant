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


#ifndef _SPX_ASSERTION_DEFINES_H
#define _SPX_ASSERTION_DEFINES_H

#import "SPXAssertionsInternal.h"



#pragma mark - ObjC-based Functions



/**
 *  Asserts the specified condition on debug builds, returning an NSError on release builds
 *
 *  @param condition The condition to evaluate
 *
 *  @return An NSError
 */
#define SPXAssertTrueOrReturnError(condition) _SPXGenericAssertTrueOrReturnError(Objc, condition)


/**
 *  Asserts the specified condition on debug builds, performing the specified action on release builds
 *
 *  @param condition The condition to evaluate
 *  @param action    The code to execute for release builds
 *
 *  @return nil
 */
#define SPXAssertTrueOrPerformAction(condition, action) _SPXGenericAssertTrueOrPerformAction(Objc, condition, action)


/**
 *  Asserts the specified condition on debug builds, returning on release builds
 *
 *  @param condition The condition to evaluate
 */
#define SPXAssertTrueOrReturn(condition) _SPXGenericAssertTrueOrPerformAction(Objc, condition, return)


/**
 *  Asserts the specified condition on debug builds, returning NO on release builds
 *
 *  @param condition The condition to evaluate
 *
 *  @return NO
 */
#define SPXAssertTrueOrReturnNo(condition) _SPXGenericAssertTrueOrPerformAction(Objc, condition, return NO)


/**
 *  Asserts the specified condition on debug builds, returning nil on release builds
 *
 *  @param condition The condition to evaluate
 *
 *  @return nil
 */
#define SPXAssertTrueOrReturnNil(condition) _SPXGenericAssertTrueOrPerformAction(Objc, condition, return nil)



#pragma mark - C-based Functions



/**
 *  Asserts the specified condition on debug builds, returning an NSError on release builds
 *
 *  @param condition The condition to evaluate
 *
 *  @return An NSError
 */
#define SPXCAssertTrueOrReturnError(condition) _SPXGenericAssertTrueOrReturnError(C, condition)


/**
 *  Asserts the specified condition on debug builds, performing the specified action on release builds
 *
 *  @param condition The condition to evaluate
 *  @param action    The code to execute for release builds
 *
 *  @return nil
 */
#define SPXCAssertTrueOrPerformAction(condition, action) _SPXGenericAssertTrueOrPerformAction(C, condition, action)


/**
 *  Asserts the specified condition on debug builds, returning on release builds
 *
 *  @param condition The condition to evaluate
 */
#define SPXCAssertTrueOrReturn(condition) _SPXGenericAssertTrueOrPerformAction(C, condition, return)


/**
 *  Asserts the specified condition on debug builds, returning NO on release builds
 *
 *  @param condition The condition to evaluate
 *
 *  @return NO
 */
#define SPXCAssertTrueOrReturnNo(condition) _SPXGenericAssertTrueOrPerformAction(C, condition, return NO)


/**
 *  Asserts the specified condition on debug builds, returning nil on release builds
 *
 *  @param condition The condition to evaluate
 *
 *  @return nil
 */
#define SPXCAssertTrueOrReturnNil(condition) _SPXGenericAssertTrueOrPerformAction(C, condition, return nil)



#endif



