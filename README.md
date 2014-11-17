# Data Validators

[![CI Status](http://img.shields.io/travis/shaps80/SPXDataValidators.svg?style=flat)](https://travis-ci.org/Shaps Mohsenin/SPXDataValidators)
[![Version](https://img.shields.io/cocoapods/v/SPXDataValidators.svg?style=flat)](http://cocoadocs.org/docsets/SPXDataValidators)
[![License](https://img.shields.io/cocoapods/l/SPXDataValidators.svg?style=flat)](http://cocoadocs.org/docsets/SPXDataValidators)
[![Platform](https://img.shields.io/cocoapods/p/SPXDataValidators.svg?style=flat)](http://cocoadocs.org/docsets/SPXDataValidators)

## Introduction

Download the example project to see it in action, or checkout the **[presentation](https://github.com/shaps80/SPXDataValidators/blob/master/Data%20Validation%20-%20Presentation.pdf?raw=true)**.

I will be adding to the validators in the near future, I have a few more that are just not tested yet ;)

If you have ideas for really useful, reusable validators, pleaese create a pull request and I'll get them in ASAP. Please don't submit any validators without tests though... that makes GitHub'ers sad :(

## Usage

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

This is highly reusable and allows you to easily define all your validators in once place throughout your entire project if you want to.

Later, from some UI code you would then call:

``` objectivec

- (BOOL)isFormReady
{
  for (UITextField *field in self.fields) {
    if (![field validateWithError:nil]) {
      return NO;
    }
  }
  
  return YES;
}

```

Download and run the example project to see individual field validation in action ;)

## Installation

SPXDataValidators is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "SPXDataValidators"

## Author

Shaps, http://twitter.com/shaps

## License

SPXDataValidators is available under the MIT license. See the LICENSE file for more info.

