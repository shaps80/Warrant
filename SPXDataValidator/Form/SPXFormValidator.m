//
//  SPXFormValidator.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SPXFormValidator.h"

@interface SPXFormValidator ()
@property (nonatomic, strong) IBOutletCollection(NSObject /* id <SPXDataField> */) NSArray *fields;
@end

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

- (void)setFields:(NSArray *)fields
{
  for (id <SPXDataField> field in fields) {
    SPXAssertTrueOrReturn([field conformsToProtocol:@protocol(SPXDataField)]);
  }
  
  _fields = fields;
}

- (BOOL)isValid:(NSError *__autoreleasing *)error
{
  for (id <SPXDataField> field in self.fields) {
    if (![field validateWithError:error]) {
      return NO;
    }
  }
  
  return YES;
}

@end
