/*
   Copyright (c) 2014 Snippex. All rights reserved.

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

#import <Kiwi/Kiwi.h>
#import "SPXRegexDataValidator.h"

static NSString * const PasswordRegex = @"^(?=.*\\d)(?=.*[A-Za-z]).{6,32}$";


SPEC_BEGIN(SPXPasswordDataValidatorSpec)

describe(@"Password Validation", ^{
  
  /**
   *  Password requires a minimum of 6 characters and at least one number and alpha character. No other characters are supported
   */
  
  SPXRegexDataValidator *validator = [SPXRegexDataValidator validatorWithExpression:PasswordRegex];
  NSString *password = @"password123";
  
  it(@"should pass with valid password", ^{
    BOOL isValid = [validator validateValue:password error:nil];
    [[theValue(isValid) should] equal:theValue(YES)];
  });
  
  password = @"1g";
  
  it(@"should fail when less than 6 characters", ^{
    BOOL isValid = [validator validateValue:password error:nil];
    [[theValue(isValid) should] equal:theValue(NO)];
  });
  
  password = @"123456";
  
  it(@"should fail when missing an alpha character", ^{
    BOOL isValid = [validator validateValue:password error:nil];
    [[theValue(isValid) should] equal:theValue(NO)];
  });
  
  password = @"asfgdjhas";
  
  it(@"should fail when missing a number", ^{
    BOOL isValid = [validator validateValue:password error:nil];
    [[theValue(isValid) should] equal:theValue(NO)];
  });
  
  password = @"asd!343";
  
  it(@"should pass when using an non-alphanumeric character", ^{
    BOOL isValid = [validator validateValue:password error:nil];
    [[theValue(isValid) should] equal:theValue(YES)];
  });

});

SPEC_END
