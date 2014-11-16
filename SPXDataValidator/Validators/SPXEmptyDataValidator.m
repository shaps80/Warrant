//
//  SPXNilValidator.m
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SPXEmptyDataValidator.h"

@implementation SPXEmptyDataValidator

- (BOOL)validateValue:(id)value error:(out NSError *__autoreleasing *)error
{
  if ([value respondsToSelector:@selector(length)]) {
    return (BOOL)[value length];
  }
  
  return value;
}

@end
