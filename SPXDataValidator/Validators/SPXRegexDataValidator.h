//
//  SPXRegexDataValidator.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPXDataValidator.h"


/**
 *  This validator is useful for validating any type of regular expression against the value
 */
@interface SPXRegexDataValidator : NSObject <SPXDataValidator>


/**
 *  Initializes a default validator with the specified expression
 *
 *  @param expression The expression to use when evaluating the value
 *
 *  @return A new regular expression validator instance
 */
+ (instancetype)validatorWithExpression:(NSString *)expression;

/**
 *  Provides a convenience initializer for validating email addresses
 *
 *  @return A new regular expression validation, with its expression preconfigured to evaluate email addresses
 */
+ (instancetype)emailValidator;


@end
