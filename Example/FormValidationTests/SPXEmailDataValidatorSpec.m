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


SPEC_BEGIN(SPXEmailDataValidatorSpec)

describe(@"SPXEmailDataValidator", ^{
  
  SPXRegexDataValidator *validator = [SPXEmailDataValidator new];
  NSString *email = @"shapsuk@me.com";
  
  it(@"should pass with valid email", ^{
    BOOL isValid = [validator validateValue:email error:nil];
    [[theValue(isValid) should] equal:theValue(YES)];
  });
  
  email = @"shapsuk@me_com";
  
  it(@"should fail with invalid email", ^{
    BOOL isValid = [validator validateValue:email error:nil];
    [[theValue(isValid) should] equal:theValue(NO)];
  });
  
  email = @"@me.com";
  
  it(@"should fail when missing local part", ^{
    BOOL isValid = [validator validateValue:email error:nil];
    [[theValue(isValid) should] equal:theValue(NO)];
  });
  
  email = @"shapsukme.com";
  
  it(@"should fail when missing symbol", ^{
    BOOL isValid = [validator validateValue:email error:nil];
    [[theValue(isValid) should] equal:theValue(NO)];
  });
  
  email = @"shapsuk%me.com";
  
  it(@"should fail when using invalid symbol", ^{
    BOOL isValid = [validator validateValue:email error:nil];
    [[theValue(isValid) should] equal:theValue(NO)];
  });
  
});

SPEC_END
