//
//  SPXRegexDataValidator.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SPXRegexDataValidator.h"


static NSString * const SPXEmailValidatorRegularExpression =
@"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
@"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
@"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
@"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
@"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
@"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
@"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";



@interface SPXRegexDataValidator ()
@property (nonatomic, strong) NSError *validationError;
@property (nonatomic, strong) NSString *validationRegex;
@end

@implementation SPXRegexDataValidator

+ (instancetype)validatorWithExpression:(NSString *)expression
{
  SPXRegexDataValidator *validator = [SPXRegexDataValidator new];
  validator.validationRegex = expression;
  
  NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : @"Invalid value" };
  validator.validationError = [NSError errorWithDomain:@"uk.co.snippex.validation" code:-1 userInfo:userInfo];
  
  return validator;
}

+ (instancetype)emailValidator
{
  SPXRegexDataValidator *validator = [SPXRegexDataValidator new];
  validator.validationRegex = SPXEmailValidatorRegularExpression;
  
  NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : @"Invalid email address" };
  validator.validationError = [NSError errorWithDomain:@"uk.co.snippex.validation" code:-1 userInfo:userInfo];
  
  return validator;
}

- (BOOL)validateValue:(id)value error:(out NSError *__autoreleasing *)error
{
  if ([value respondsToSelector:@selector(length)]) {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:self.validationRegex options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *string = value;
    
    if ([value isKindOfClass:[NSAttributedString class]]) {
      string = [value string];
    }
    
    NSUInteger matchCount = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, [value length])];
    
    if (!matchCount && error) {
      *error = self.validationError;
    }
    
    return matchCount;
  }
  
  return NO;
}

- (NSString *)description
{
  return [self dictionaryWithValuesForKeys:@[ @"validationRegex" ]].description;
}

@end
