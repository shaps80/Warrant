//
//  PasswordConfirmationField.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+SPXDataValidatorAdditions.h"
#import "SPXDataField.h"
#import "SPXDefines.h"

/**
 *  This custom field demonstrates password (as well as confirmation) validation through composition
 *  This class will first validate each field, and then additionally validate itself if both fields are valid
 */
SPX_DEPRECATED("Use -dependentFields on your id <SPXDataField> instance")
@interface SPXPasswordValidationField : NSObject <SPXDataField>


/**
 *  Initializes a new instance of this field
 *
 *  @param passwordField     The password field to be validated
 *  @param confirmationField The confirmation field to be validated
 *
 *  @return A new password validation field
 */
+ (instancetype)fieldForPasswordField:(id <SPXDataField>)passwordField confirmationField:(id <SPXDataField>)confirmationField;


/**
 *  If both fields are validated, the resulting text is returned. Otherwise nil.
 */
- (NSString *)text;


@end

