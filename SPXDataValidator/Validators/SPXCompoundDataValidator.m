//
//  SPXCompoundValidator.m
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SPXCompoundDataValidator.h"

@interface SPXCompoundDataValidator ()

@property (nonatomic, strong) NSArray *validators;
@property (nonatomic, assign) SPXCompoundDataValidationType validationType;

@end

@implementation SPXCompoundDataValidator

+ (instancetype)validatorWithValidators:(NSOrderedSet *)validators validationType:(SPXCompoundDataValidationType)type
{
  SPXCompoundDataValidator *validator = [SPXCompoundDataValidator new];
  validator.validators = validators.array;
  validator.validationType = type;
  return validator;
}

- (BOOL)validateValue:(id)value error:(out NSError *__autoreleasing *)error
{
  BOOL isValid = (self.validationType == SPXCompoundDataValidatorValidateAll) ? YES : NO;
  
  for (id <SPXDataValidator> validator in self.validators) {
    if (self.validationType == SPXCompoundDataValidatorValidateAny && [validator validateValue:value error:error]) {
      return YES;
    }
    
    if (![validator validateValue:value error:error] && self.validationType == SPXCompoundDataValidatorValidateAll) {
      return NO;
    }
  }
  
  return isValid;
}

@end
