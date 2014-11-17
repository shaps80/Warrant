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
#import "SPXFormValidator.h"
#import "SPXRegexDataValidator.h"
#import "UITextField+SPXDataValidatorAdditions.h"

static NSString * const PasswordRegex = @"^(?=.*\\d)(?=.*[A-Za-z]).{6,32}$";


SPEC_BEGIN(SPXFormValidatorSpec)

describe(@"SPXFormValidator", ^{
  
  SPXRegexDataValidator *emailValidator = [SPXRegexDataValidator emailValidator];
  SPXRegexDataValidator *passwordValidator = [SPXRegexDataValidator validatorWithExpression:PasswordRegex];
  
  UITextField *emailField = [UITextField new];
  UITextField *passwordField = [UITextField new];
  
  emailField.text = @"shaps80@me.com";
  passwordField.text = @"password123";
  
  [emailField applyValidator:emailValidator];
  [passwordField applyValidator:passwordValidator];

  it(@"should pass if all validators are valid", ^{
    BOOL isValid = [SPXFormValidator validateFields:@[ emailField, passwordField ]];
    [[theValue(isValid) should] equal:theValue(YES)];
  });
  
  it(@"should fail if at least one validator is invalid", ^{
    passwordField.text = @"password";
    BOOL isValid = [SPXFormValidator validateFields:@[ emailField, passwordField ]];
    [[theValue(isValid) should] equal:theValue(NO)];
  });
  
});

SPEC_END
