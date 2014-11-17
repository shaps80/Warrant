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
#import "SPXCompoundDataValidator.h"
#import "SPXNonEmptyDataValidator.h"
#import "SPXEmailDataValidator.h"


SPEC_BEGIN(SPXCompoundDataValidatorSpec)

describe(@"SPXCompoundDataValidator", ^{
  
  NSString *validEmail = @"shapsuk@me.com";
  NSString *invalidEmail = @"shapsukme.com";
  
  SPXEmailDataValidator *emailValidator = [SPXEmailDataValidator new];
  SPXNonEmptyDataValidator *nonEmptyValidator = [SPXNonEmptyDataValidator new];
  
  NSOrderedSet *validators = [NSOrderedSet orderedSetWithObjects:emailValidator, nonEmptyValidator, nil];
  SPXCompoundDataValidator *validator = [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];

  it(@"should pass when all validator pass", ^{
    BOOL isValid = [validator validateValue:validEmail error:nil];
    [[theValue(isValid) should] equal:theValue(YES)];
  });
  
  validator = [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAny];
  
  it(@"should pass when 1 validator passes", ^{
    BOOL isValid = [validator validateValue:invalidEmail error:nil];
    [[theValue(isValid) should] equal:theValue(YES)];
  });
  
  
  validator = [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];
  
  it(@"should fail if 1 validator fails", ^{
    BOOL isValid = [validator validateValue:invalidEmail error:nil];
    [[theValue(isValid) should] equal:theValue(NO)];
  });
  
});

SPEC_END
