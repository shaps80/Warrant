//
//  FormValidation.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPXDataField.h"
#import "SPXCompoundDataValidator.h"


/**
 *  This clas isn't necessarily a good approach, but demonstrates flexibility and reuse
 */
@interface FormValidator : NSObject


/**
 *  Validates an array of fields, an entire form
 */
+ (BOOL)validateFields:(NSArray *)fields;


/**
 *  Validates a single field
 */
+ (BOOL)validateField:(id <SPXDataField>)field;


/**
 *  Returns new instance of the specified validator.
 *  @note In your own code you might decide to cache these since they are completely stateless and should be entirely threadsafe.
 */
+ (SPXCompoundDataValidator *)emailValidator;
+ (SPXCompoundDataValidator *)passwordValidator;

@end
