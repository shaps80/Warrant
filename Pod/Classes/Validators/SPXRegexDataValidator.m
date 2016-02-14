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

- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super init];
  if (!self) return nil;
  return self;
}

- (instancetype)init
{
  self = [super init];
  if (!self) return nil;
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  // nothing to do
}

+ (instancetype)validatorWithExpression:(NSString *)expression
{
  SPXRegexDataValidator *validator = [SPXRegexDataValidator new];
  validator.validationRegex = expression;
  return validator;
}

- (void)setRegexPattern:(NSString *)regexPattern
{
  self.validationRegex = regexPattern;
}

- (NSString *)regexPattern
{
  return self.validationRegex;
}

- (NSString *)invalidErrorString
{
  return _invalidErrorString ?: @"Invalid value";
}

- (NSError *)validationError
{
  NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : self.invalidErrorString };
  return [NSError errorWithDomain:@"uk.co.snippex.validation" code:-1 userInfo:userInfo];
}

- (BOOL)validateValue:(id)value error:(out NSError *__autoreleasing *)error
{
  if (!self.validationRegex) return YES;
  
  if (![value respondsToSelector:@selector(length)]) {
    return NO;
  }

  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:self.validationRegex options:NSRegularExpressionCaseInsensitive error:error];
  
  if (!regex && *error) {
    return NO;
  }
  
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

- (NSString *)description
{
  return [self dictionaryWithValuesForKeys:@[ @"validationRegex" ]].description;
}

@end

@implementation SPXEmailDataValidator

- (instancetype)init
{
  self = [super init];
  if (!self) return nil;
  super.invalidErrorString = @"Invalid email address";
  super.regexPattern = SPXEmailValidatorRegularExpression;
  return self;
}

@end
