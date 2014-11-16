//
//  UITextField+SPXDataValidatorAdditions.m
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "UITextField+SPXDataValidatorAdditions.h"
#import <objc/runtime.h>

static void * SPXDataValidatorKey = &SPXDataValidatorKey;


@interface UITextField (Private)
@property (nonatomic, strong) id <SPXDataValidator> validator;
@end

@implementation UITextField (SPXDataValidatorAdditions)

- (void)setValidator:(id<SPXDataValidator>)validator
{
  objc_setAssociatedObject(self, &SPXDataValidatorKey, validator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<SPXDataValidator>)validator
{
  return objc_getAssociatedObject(self, &SPXDataValidatorKey);
}

- (void)applyValidator:(id<SPXDataValidator>)validator
{
  @synchronized(validator) {
    self.validator = validator;
  }
}

- (BOOL)validateWithError:(out NSError *__autoreleasing *)error
{
  if (!self.validator) {
    return YES;
  }
  
  return [self.validator validateValue:self.text error:error];
}

@end
