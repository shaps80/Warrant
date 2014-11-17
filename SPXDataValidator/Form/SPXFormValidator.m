//
//  SPXFormValidator.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SPXFormValidator.h"

@implementation SPXFormValidator

+ (BOOL)validateFields:(NSArray *)fields
{
  for (id <SPXDataField> field in fields) {
    if (![field validateWithError:nil]) {
      return NO;
    }
  }
  
  return YES;
}

+ (BOOL)validateField:(id <SPXDataField>)field
{
  NSError *error = nil;
  
  if (![field validateWithError:&error]) {
    if (error) {
      NSLog(@"%@", error);
      return NO;
    }
  }
  
  return YES;
}

@end
