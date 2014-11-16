# SPXDataValidators

[![CI Status](http://img.shields.io/travis/Shaps Mohsenin/SPXDataValidators.svg?style=flat)](https://travis-ci.org/Shaps Mohsenin/SPXDataValidators)
[![Version](https://img.shields.io/cocoapods/v/SPXDataValidators.svg?style=flat)](http://cocoadocs.org/docsets/SPXDataValidators)
[![License](https://img.shields.io/cocoapods/l/SPXDataValidators.svg?style=flat)](http://cocoadocs.org/docsets/SPXDataValidators)
[![Platform](https://img.shields.io/cocoapods/p/SPXDataValidators.svg?style=flat)](http://cocoadocs.org/docsets/SPXDataValidators)

## Usage

Download the example project to see it in action, or checkout the presentation.

Basically though, your code might look something like this:

``` objectivec

- (void)configureValidators
{
  SPXEmptyDataValidator *emptyValidator = [SPXEmptyDataValidator new];
  SPXEmailDataValidator *emailValidator = [SPXEmailDataValidator new];

  NSOrderedSet *validators = [NSOrderedSet orderedSetWithObjects:emptyValidator, emailValidator, nil];
  SPXCompoundDataValidator *usernameValidators = [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];

  [self.emailField applyValidator:usernameValidators];

  SPXPasswordDataValidator *passValidator = [SPXPasswordDataValidator validatorWithRegularExpression:PasswordRegex];
  validators = [NSOrderedSet orderedSetWithObjects:emptyValidator, passValidator, nil];
  SPXCompoundDataValidator *passwordValidators = [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];

  [self.passwordField applyValidator:passwordValidators];
}

```

## Installation

SPXDataValidators is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "SPXDataValidators"

## Author

Shaps Mohsenin, shaps@theappbusiness.com

## License

SPXDataValidators is available under the MIT license. See the LICENSE file for more info.

