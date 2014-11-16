//
//  SPXPasswordValidator.h
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPXDataValidator.h"


/**
 *  The password validator allows you to validate password data
 */
@interface SPXPasswordDataValidator : NSObject <SPXDataValidator>


/**
 *  Initializes a new instance of an email validator using the specified regular expression
 *
 *  @param regex The regular expression to evaluate when validating the password value
 *
 *  @return A new password validator instance
 */
+ (instancetype)validatorWithRegularExpression:(NSString *)regex;


@end
