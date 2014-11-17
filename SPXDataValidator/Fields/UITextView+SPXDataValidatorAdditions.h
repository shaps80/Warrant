//
//  UITextView+SPXDataValidatorAdditions.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPXDataValidator.h"


/**
 *  This category on UITextView adds support for using SPXDataValidator's to validate input
 */
@interface UITextView (SPXDataValidatorAdditions)


/**
 *  Applies the specified validator to this view. To apply multiple validators, see the SPXCompoundDataValidator class.
 *
 *  @param validator The validator to apply to this view.
 */
- (void)applyValidator:(id <SPXDataValidator>)validator;


/**
 *  Validates the current value of this view
 *
 *  @param error A pointer to an NSError object (optional)
 *
 *  @return Returns the result from [self.validator validateValue:self.text error:&error]. If no validator has been applied, this method will always return YES
 */
- (BOOL)validateWithError:(out NSError * __autoreleasing *)error;


@end

