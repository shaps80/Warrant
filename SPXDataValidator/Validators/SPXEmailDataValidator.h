//
//  SPXEmailValidator.h
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPXDataValidator.h"


/**
 *  The email validator is used validating email addresses
 *
 *  http://www.cocoawithlove.com/2009/06/verifying-that-string-is-email-address.html
 *  This regular expression used by this validator is adapted from a version at regular-expressions.info and is a complete verification of RFC 2822
 */
@interface SPXEmailDataValidator : NSObject <SPXDataValidator>

@end
