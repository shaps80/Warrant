//
//  SPXNilValidator.m
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SPXNonEmptyDataValidator.h"

@implementation SPXNonEmptyDataValidator

- (BOOL)validateValue:(id)value error:(out NSError *__autoreleasing *)error
{
  if ([value respondsToSelector:@selector(length)]) {
    if (![value length] && error) {
      NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : @"Empty value" };
      *error = [NSError errorWithDomain:@"uk.co.snippex.validation" code:-1 userInfo:userInfo];
    }
    return ([value length]);
  }
  
  return (value != nil);
}

@end
