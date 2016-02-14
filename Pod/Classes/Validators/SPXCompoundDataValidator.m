//
//  SPXCompoundValidator.m
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SPXCompoundDataValidator.h"
#import "SPXDefines.h"

@interface SPXCompoundDataValidator ()

@property (nonatomic, strong) IBOutletCollection(NSObject /* id <SPXDataValidator> */) NSArray *validators;
@property (nonatomic, assign) SPXCompoundDataValidationRule validationRule;
@property (nonatomic, assign) IBInspectable BOOL validateAll;

@end

@implementation SPXCompoundDataValidator

+ (instancetype)validatorWithValidators:(NSOrderedSet *)validators validationRule:(SPXCompoundDataValidationRule)rule
{
  SPXCompoundDataValidator *validator = [SPXCompoundDataValidator new];
  validator.validators = validators.array;
  validator.validationRule = rule;
  return validator;
}

- (void)setValidators:(NSArray *)validators
{
  for (id <SPXDataValidator> validator in validators) {
    SPXAssertTrueOrReturn([validator conformsToProtocol:@protocol(SPXDataValidator)]);
    SPXAssertTrueOrReturn([validator respondsToSelector:@selector(validateValue:error:)]);
  }
  
  _validators = validators;
}

- (BOOL)validateValue:(id)value error:(out NSError *__autoreleasing *)error
{
  BOOL isValid = (self.validationRule == SPXCompoundDataValidationRuleAll) ? YES : NO;
  
  for (id <SPXDataValidator> validator in self.validators) {
    if (self.validationRule == SPXCompoundDataValidationRuleAny && [validator validateValue:value error:error]) {
      return YES;
    }
    
    if (![validator validateValue:value error:error] && self.validationRule == SPXCompoundDataValidationRuleAll) {
      return NO;
    }
  }
  
  return isValid;
}

- (void)setValidateAll:(BOOL)validateAll
{
  self.validationRule = (SPXCompoundDataValidationRule)validateAll;
}

@end
