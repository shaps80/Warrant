//
//  FormValidation.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "FormValidator.h"

#import "SPXDataValidator.h"
#import "SPXDataField.h"
#import "UITextField+SPXDataValidatorAdditions.h"

static NSString * const PasswordRegex = @"^(?=.*\\d)(?=.*[A-Za-z]).{6,32}$";

@implementation FormValidator

#pragma mark - Validation

+ (BOOL)validateFields:(NSArray *)fields
{
  for (UITextField *field in fields) {
    if (![field validateWithError:nil]) {
      return NO;
    }
  }
  
  return YES;
}

+ (BOOL)validateField:(id<SPXDataField>)field
{
  NSError *error = nil;
  
  if (![field validateWithError:&error]) {
    if (error) {
      return NO;
    }
  }
  
  return YES;
}

#pragma mark - Factory methods

+ (SPXCompoundDataValidator *)emailValidator
{
  SPXNonEmptyDataValidator *emptyValidator = [SPXNonEmptyDataValidator new];
  SPXEmailDataValidator *emailValidator = [SPXEmailDataValidator new];
  
  NSOrderedSet *validators = [NSOrderedSet orderedSetWithObjects:emptyValidator, emailValidator, nil];
  return [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];
}

+ (SPXCompoundDataValidator *)passwordValidator
{
  SPXNonEmptyDataValidator *emptyValidator = [SPXNonEmptyDataValidator new];
  SPXPasswordDataValidator *passwordValidator = [SPXPasswordDataValidator validatorWithRegularExpression:PasswordRegex];
  
  NSOrderedSet *validators = [NSOrderedSet orderedSetWithObjects:emptyValidator, passwordValidator, nil];
  return [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];
}

@end
