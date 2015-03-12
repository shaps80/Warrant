//
//  SPXFormValidator.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPXDataField.h"
#import "SPXDefines.h"


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
+ (BOOL)validateField:(id <SPXDataField>)field SPX_DEPRECATED("Use -validateWithError: on your id<SPXDataField> instance");


/**
 *  Validates all associated fields. (Defaults to YES when no fields exist)
 *
 *  @param error If validation fails, use this to get a reference to the first generated error
 *
 *  @return YES if all fields are valid, NO otherwise
 */
- (BOOL)isValid:(NSError * __autoreleasing *)error;


@end
