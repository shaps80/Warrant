//
//  SPXDataField.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPXDataValidator.h"


@protocol SPXDataField <NSObject>


/**
 *  Returns the data validator applied to this field
 */
@property (nonatomic, strong) IBOutlet id <SPXDataValidator> dataValidator;


/**
 *  Validates the current value of this view
 *
 *  @param error A pointer to an NSError object (optional)
 *
 *  @return Returns the result from [self.validator validateValue:self.text error:&error]. If no validator has been applied, this method will always return YES
 */
- (BOOL)validateWithError:(out NSError * __autoreleasing *)error;


@end
