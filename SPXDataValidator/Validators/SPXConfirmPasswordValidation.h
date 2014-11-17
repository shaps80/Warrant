//
//  SPXConfirmPasswordValidation.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPXDataValidator.h"

@interface SPXConfirmPasswordValidation : NSObject <SPXDataValidator>

+ (instancetype)validatorWithRegularExpression:(NSString *)regex;

@end
