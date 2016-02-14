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
#import "SPXNonEmptyDataValidator.h"


SPEC_BEGIN(SPXNonEmptyDataValidatorSpec)

describe(@"SPXNonEmptyDataValidatorSpec", ^{
  
  SPXNonEmptyDataValidator *validator = [SPXNonEmptyDataValidator new];
  
  context(@"NSString", ^{
    NSString *value = @"value";
    
    it(@"should pass with non-empty value", ^{
      BOOL isValid = [validator validateValue:value error:nil];
      [[theValue(isValid) should] equal:theValue(YES)];
    });
    
    value = @"";
    
    it(@"should fail with empty value", ^{
      BOOL isValid = [validator validateValue:value error:nil];
      [[theValue(isValid) should] equal:theValue(NO)];
    });
  });
  
  context(@"NSAttributedString", ^{
    NSAttributedString *value = [[NSAttributedString alloc] initWithString:@"value"];
    
    it(@"should pass with non-empty value", ^{
      BOOL isValid = [validator validateValue:value error:nil];
      [[theValue(isValid) should] equal:theValue(YES)];
    });
    
    value = [[NSAttributedString alloc] initWithString:@""];
    
    it(@"should fail with empty value", ^{
      BOOL isValid = [validator validateValue:value error:nil];
      [[theValue(isValid) should] equal:theValue(NO)];
    });
  });
  
  context(@"Random Object", ^{
    id value = nil;
    
    it(@"should fail with nil object", ^{
      BOOL isValid = [validator validateValue:value error:nil];
      [[theValue(isValid) should] equal:theValue(NO)];
    });
    
    value = [NSObject new];
    
    it(@"should pass with non-nil object", ^{
      BOOL isValid = [validator validateValue:value error:nil];
      [[theValue(isValid) should] equal:theValue(YES)];
    });
  });
  
});

SPEC_END
