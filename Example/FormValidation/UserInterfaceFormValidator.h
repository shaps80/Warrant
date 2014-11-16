//
//  FormValidation.h
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  This clas isn't necessarily a good approach, but demonstrates flexibility and reuse
 */
@interface UserInterfaceFormValidator : NSObject

/**
 *  Initializes a new form validator instance. This is not ideal, its provided for demonstration purposes only!
 *
 *  @param textFields An array of textFields belonging to this form
 *  @param item       The barButtonItem to be enabled when all fields are valid
 *
 *  @return A new form validator instance
 */
+ (instancetype)validatorForTextFields:(NSArray *)textFields barButtonItem:(UIBarButtonItem *)item;

@end
