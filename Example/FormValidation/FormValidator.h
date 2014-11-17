//
//  FormValidation.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SPXCompoundDataValidator.h"
#import "SPXEmailDataValidator.h"
#import "SPXPasswordDataValidator.h"
#import "SPXNonEmptyDataValidator.h"

#import "SPXDataField.h"

@protocol FormValidatorDelegate;


/**
 *  This clas isn't necessarily a good approach, but demonstrates flexibility and reuse
 */
@interface FormValidator : NSObject

+ (BOOL)validateFields:(NSArray *)fields;
+ (BOOL)validateField:(id <SPXDataField>)field;


/**
 *  Returns new instance of the specified validator.
 *  @note In your own code you might decide to cache these since they are completely stateless and should be entirely threadsafe.
 */
+ (SPXCompoundDataValidator *)emailValidator;
+ (SPXCompoundDataValidator *)passwordValidator;

@end
