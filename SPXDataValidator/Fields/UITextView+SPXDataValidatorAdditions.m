//
//  UITextView+SPXDataValidatorAdditions.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "UITextView+SPXDataValidatorAdditions.h"
#import <objc/runtime.h>


@interface UITextView (Private)
@property (nonatomic, strong) id <SPXDataValidator> dataValidator;
@end

@implementation UITextView (SPXDataValidatorAdditions)

- (void)setDataValidator:(id<SPXDataValidator>)validator
{
  objc_setAssociatedObject(self, @selector(dataValidator), validator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<SPXDataValidator>)dataValidator
{
  return objc_getAssociatedObject(self, @selector(dataValidator));
}

- (void)applyValidator:(id<SPXDataValidator>)validator
{
  @synchronized(validator) {
    self.dataValidator = validator;
  }
}

- (BOOL)validateWithError:(out NSError *__autoreleasing *)error
{
  if (!self.dataValidator) {
    return YES;
  }
  
  return [self.dataValidator validateValue:self.text error:error];
}

@end
