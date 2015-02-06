//
//  UITextField+SPXDataValidatorAdditions.h
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPXDataValidator.h"
#import "SPXDataField.h"

/**
 *  This category on UITextField adds support for using SPXDataValidator's to validate input
 */
@interface UITextField (SPXDataValidatorAdditions) <SPXDataField>


/**
 *  Returns the data validator applied to this field
 */
@property (nonatomic, readonly) IBOutlet id <SPXDataValidator> dataValidator;


@end
