//
//  FormValidation.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "ValidatorFactory.h"

#import "SPXDataValidator.h"
#import "SPXDataField.h"

#import "SPXRegexDataValidator.h"
#import "SPXNonEmptyDataValidator.h"
#import "UITextField+SPXDataValidatorAdditions.h"

static NSString * const PasswordRegex = @"^(?=.*\\d)(?=.*[A-Za-z]).{6,32}$";

@implementation ValidatorFactory

+ (SPXCompoundDataValidator *)emailValidator
{
  SPXNonEmptyDataValidator *emptyValidator = [SPXNonEmptyDataValidator new];
  SPXRegexDataValidator *emailValidator = [SPXEmailDataValidator new];
  
  NSOrderedSet *validators = [NSOrderedSet orderedSetWithObjects:emptyValidator, emailValidator, nil];
  return [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];
}

+ (SPXCompoundDataValidator *)passwordValidator
{
  SPXNonEmptyDataValidator *emptyValidator = [SPXNonEmptyDataValidator new];
  SPXRegexDataValidator *passwordValidator = [SPXRegexDataValidator validatorWithExpression:PasswordRegex];
  
  NSOrderedSet *validators = [NSOrderedSet orderedSetWithObjects:emptyValidator, passwordValidator, nil];
  return [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];
}

@end
