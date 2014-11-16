//
//  SPXPasswordValidator.m
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SPXPasswordDataValidator.h"

@interface SPXPasswordDataValidator ()
@property (nonatomic, strong) NSString *validationRegex;
@end

@implementation SPXPasswordDataValidator

+ (instancetype)validatorWithRegularExpression:(NSString *)regex
{
  SPXPasswordDataValidator *validator = [SPXPasswordDataValidator new];
  validator.validationRegex = regex;
  return validator;
}

- (BOOL)validateValue:(id)value error:(out NSError *__autoreleasing *)error
{
  if (!self.validationRegex.length) {
    return YES;
  }
  
  if ([value respondsToSelector:@selector(length)]) {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:self.validationRegex options:NSRegularExpressionCaseInsensitive error:error];
    NSString *string = value;
    
    if ([value isKindOfClass:[NSAttributedString class]]) {
      string = [value string];
    }
    
    NSUInteger matchCount = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, [value length])];
    
    if (!matchCount && error) {
      *error = [NSError errorWithDomain:@"uk.co.snippex.input" code:-1 userInfo:@{ NSLocalizedDescriptionKey : @"Invalid password" }];
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
