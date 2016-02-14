//
//  UITextField+SPXDataValidatorAdditions.m
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "UITextField+SPXDataValidatorAdditions.h"
#import "SPXDefines.h"
#import <objc/runtime.h>


@interface UITextField (Private)
@property (nonatomic, strong) id <SPXDataValidator> dataValidator;
@end

@implementation UITextField (SPXDataValidatorAdditions)

- (void)setDependentFields:(NSArray *)dependentFields
{
  @synchronized(self) {
    for (id <SPXDataField> field in dependentFields) {
      SPXAssertTrueOrReturn([field conformsToProtocol:@protocol(SPXDataField)]);
    }
    
    objc_setAssociatedObject(self, @selector(dependentFields), dependentFields, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
}

- (NSArray *)dependentFields
{
  return objc_getAssociatedObject(self, @selector(dependentFields));
}

- (void)setDataValidator:(id<SPXDataValidator>)dataValidator
{
  @synchronized(self) {
    objc_setAssociatedObject(self, @selector(dataValidator), dataValidator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
}

- (id<SPXDataValidator>)dataValidator
{
  return objc_getAssociatedObject(self, @selector(dataValidator));
}

- (BOOL)validateWithError:(out NSError *__autoreleasing *)error
{
  if (!self.dataValidator) {
    return YES;
  }
  
  return [self.dataValidator validateValue:self.text error:error];
}

@end
