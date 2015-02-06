//
//  UITextView+SPXDataValidatorAdditions.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPXDataField.h"
#import "SPXDataValidator.h"


/**
 *  This category on UITextView adds support for using SPXDataValidator's to validate input
 */
@interface UITextView (SPXDataValidatorAdditions) <SPXDataField>


/**
 *  Returns the data validator applied to this field
 */
@property (nonatomic, strong) IBOutlet id <SPXDataValidator> dataValidator;


@end

