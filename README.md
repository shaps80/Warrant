# SPXDataValidators

[![CI Status](http://img.shields.io/travis/Shaps Mohsenin/SPXDataValidators.svg?style=flat)](https://travis-ci.org/Shaps Mohsenin/SPXDataValidators)
[![Version](https://img.shields.io/cocoapods/v/SPXDataValidators.svg?style=flat)](http://cocoadocs.org/docsets/SPXDataValidators)
[![License](https://img.shields.io/cocoapods/l/SPXDataValidators.svg?style=flat)](http://cocoadocs.org/docsets/SPXDataValidators)
[![Platform](https://img.shields.io/cocoapods/p/SPXDataValidators.svg?style=flat)](http://cocoadocs.org/docsets/SPXDataValidators)

## Usage

Download the example project to see it in action, or checkout the **[presentation](https://github.com/shaps80/SPXDataValidators/blob/master/Data%20Validation%20-%20Presentation.pdf?raw=true)**.

In its simplest form you can use a validator as such:

``` objectivec

SPXEmailDataValidator *validator = [SPXEmailDataValidator new];
self.signInButton.enabled = [validator validateValue:email error:nil]

```


To configure more complex validators for your UITextField's

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

Shaps, http://twitter.com/shaps

## License

SPXDataValidators is available under the MIT license. See the LICENSE file for more info.

