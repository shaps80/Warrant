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

@interface PasswordConfirmationField : NSObject <SPXDataField>

@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *confirmationField;

@end
