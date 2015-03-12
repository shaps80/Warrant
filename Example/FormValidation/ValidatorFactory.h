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

#define __SPXDataValidators_1_0_0


/**
 *  A convenience factory for returning project-specific validators
 */
@interface ValidatorFactory : NSObject


/**
 *  Returns new instance of the specified validator.
 *  @note In your own code you might decide to cache these since they are completely stateless and should be entirely threadsafe.
 */
+ (SPXCompoundDataValidator *)emailValidator;
+ (SPXCompoundDataValidator *)passwordValidator;


@end
