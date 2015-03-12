//
//  SPXCompoundValidator.h
//  Drizzle
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPXDataValidator.h"


/**
 *  Defines options for compound data validators
 */
typedef NS_ENUM(NSInteger, SPXCompoundDataValidationRule)
{
  /**
   *  Specifies that all validators must be valid in order for this compound validator to be valid
   */
  SPXCompoundDataValidationRuleAll,
  /**
   *  Specifies that at least one validator must be valid in order for this compound validator to be valid
   */
  SPXCompoundDataValidationRuleAny
};


/**
 *  A compound validator allows you to validate against multiple validators in order to determine validity
 */
@interface SPXCompoundDataValidator : NSObject <SPXDataValidator>


/**
 *  Returns a new instance with the specified validators
 *
 *  @param validators The validators belonging to this compound validator
 *  @param type       The validation type used to evaluate these validators
 *
 *  @return A new compound validator instance
 */
+ (instancetype)validatorWithValidators:(NSOrderedSet *)validators validationRule:(SPXCompoundDataValidationRule)rule;


@end
