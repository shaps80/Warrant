//
//  SPXDataValidator.h
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

@import Foundation;


/**
 *  Defines a protocol for validating data. Common usage would include form validation
 */
@protocol SPXDataValidator <NSObject>


/**
 *  Validates the specified value
 *
 *  @param value The value to evaluate
 *  @param error A pointer to an error (optional)
 *
 *  @return YES if the value is valid, NO otherwise
 */
- (BOOL)validateValue:(id)value error:(out NSError * __autoreleasing *)error;


@end

