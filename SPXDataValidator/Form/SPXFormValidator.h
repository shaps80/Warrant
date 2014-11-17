//
//  SPXFormValidator.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPXDataField.h"


/**
 *  Provides a convenient form validator that can perform per field or per form validations
 *
 *  @usage  Generally you'd call this from somewhere in your code (VCs, etc...) in order to update some state (i.e. sign in button)
 */
@interface SPXFormValidator : NSObject


/**
 *  Validates an array of fields, an entire form
 */
+ (BOOL)validateFields:(NSArray *)fields;


/**
 *  Validates a single field
 */
+ (BOOL)validateField:(id <SPXDataField>)field;


@end
