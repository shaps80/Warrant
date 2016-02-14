//
//  SPXRegexDataValidator.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPXDataValidator.h"

@class SPXEmailDataValidator;



/**
 *  This validator is useful for validating any type of regular expression against the value
 */
IB_DESIGNABLE
@interface SPXRegexDataValidator : NSObject <SPXDataValidator, NSCoding>


/**
 *  Gets or sets the regex pattern used for matching
 */
@property (nonatomic, strong) IBInspectable NSString *regexPattern;


/**
 *  Gets or sets the error string to be presented when this validator fails
 */
@property (nonatomic, strong) IBInspectable NSString *invalidErrorString;


/**
 *  Initializes a default validator with the specified expression
 *
 *  @param expression The expression to use when evaluating the value
 *
 *  @return A new regular expression validator instance
 */
+ (instancetype)validatorWithExpression:(NSString *)expression;


@end

@interface SPXEmailDataValidator : SPXRegexDataValidator
@end

