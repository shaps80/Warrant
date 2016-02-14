/*
 Copyright (c) 2014 Shaps Mohsenin. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY Shaps Mohsenin `AS IS' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL Shaps Mohsenin OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "SPXAssertionsInternal.h"

#ifndef _SPX_ASSERTION_INTERNALS_M
#define _SPX_ASSERTION_INTERNALS_M

#ifndef _SPX_LOGGING_DEFINES_H
#define SPXLog NSLog
#endif


NSError *_SPXAssertionsErrorMake(NSString *message, Class klass, NSString *methodOrFunction)
{
  NSString *identifier = nil;
  
  if (klass) {
    identifier = [NSBundle bundleForClass:klass].bundleIdentifier;
  }
  
  if (!identifier) {
    identifier = [NSBundle mainBundle].bundleIdentifier;
  }
  
  NSString *className = klass ? [NSString stringWithFormat:@"%@ | ", NSStringFromClass(klass)] : @"";
  NSString *description = [NSString stringWithFormat:@"%@ | %@ | %@%@", [identifier stringByAppendingPathExtension:@"assertion"], message, className, methodOrFunction ?: @""];
  NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : description };
  
  NSError *error = [NSError errorWithDomain:[identifier stringByAppendingPathExtension:@"assertion"] code:_SPXAssertionsInternalErrorCode userInfo:userInfo];
  SPXLog(@"%@", error.localizedDescription);
  
  return error;
}


#endif

