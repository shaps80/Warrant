<img src="assets/logo.png" width="128">

# Warrant

[![CI Status](http://img.shields.io/travis/shaps80/Warrant.svg?style=flat)](https://travis-ci.org/shaps80/Warrant)
[![Version](https://img.shields.io/cocoapods/v/Warrant.svg?style=flat)](http://cocoadocs.org/docsets/Warrant)
[![License](https://img.shields.io/cocoapods/l/Warrant.svg?style=flat)](http://cocoadocs.org/docsets/Warrany)
[![Platform](https://img.shields.io/cocoapods/p/Warrant.svg?style=flat)](http://cocoadocs.org/docsets/Warrant)

## Updates

* Three new validators is now included:
	* `SPXEmailDataValidator`
	* `SPXBlockDataValidator`
	* `SPXRegexDataValidator`
* New `SPXFormValidator ` for validating multiple fields at once in your user interface
* Validators can now be added to your `UITextField` and `UITextView` instances from Interface Builder.
	- Validators can even be re-used in IB across multiple fields
* New runtime attributes (IBInspectable) for validators to make it easier assign common validations from IB

<img src="Screenshots/IB.png" width="720" height="160" />

>These validators work exceptionally well alongside another open-source project I released [SPXControls](https://github.com/shaps80/SPXControls)

## Validation done right!

Download the example project to see it in action, or checkout the **[presentation](https://github.com/shaps80/SPXDataValidators/blob/master/Data%20Validation%20-%20Presentation.pdf?raw=true)**.

>Please note the presentation is a little dated, so subtle changes may be found in actual code. When in doubt, check the code ;)

The approach I've taken makes heavy use of the following best practices:

* Single Responsibility Principle
* Separation of Concerns
* Composition
* Reusability
* Immutability

I created these validators because I didn't want to use a 3rd party solution that was usually bound to Forms and included additional form building infrastructure I didn't need. I wanted something I could drop-in to my projects more easily, covering more cases (not just UI) and clean up my view controllers.

I couldn't find a decent solution, so I built it myself. Its pretty simple, but very effective. Hope you like it, let me know on [Twitter](http://twitter.com/shaps) ;)

## Simple Usage

In its simplest form you can use a validator as such:

``` objc

SPXRegexDataValidator *validator = [SPXRegexDataValidator emailValidator];
self.signInButton.enabled = [validator validateValue:email error:nil]

```

If you're using `<SPXDataField>` instances -- e.g. `UITextField`, `UITextView`, etc...

```objc
self.signInButton.enabled = [SPXFormValidator validatorFields:@[ emailField, passwordField ]];
```

Often though you'll want to use UI components for validating user input. I've provided categories for UITextField and UITextView so that they conform to my protocol <SPXDataField> but you can extend your own classes (UI or not) easily enough, and then call something like the following:
  
``` objc

NSError *error = nil;
if (![self.emailField validateWithError:&error]) {
  // do something useful here
}

```

## Compound Validators

``` objc

- (void)configureValidators
{
  SPXEmptyDataValidator *emptyValidator = [SPXEmptyDataValidator new];
  SPXEmailDataValidator *emailValidator = [SPXEmailValidator new];

  NSOrderedSet *validators = [NSOrderedSet orderedSetWithObjects:emptyValidator, emailValidator, nil];
  SPXCompoundDataValidator *usernameValidators = [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];

  self.emailField.dataValidator = usernameValidators;

  SPXPasswordDataValidator *passValidator = [SPXRegexDataValidator validatorWithExpression:regex];
  validators = [NSOrderedSet orderedSetWithObjects:emptyValidator, passValidator, nil];
  SPXCompoundDataValidator *passwordValidators = [SPXCompoundDataValidator validatorWithValidators:validators validationType:SPXCompoundDataValidatorValidateAll];

  self.passwordField.dataValidator = passwordValidators;
}

```

## User Interface

For better reusability, try providing a factory class somewhere in your code for returning and possibly even caching them. This would reduce your view controller code to the following:

``` objc

self.emailField = [ValidatorFactory emailValidator];
self.passwordField.dataValidator = [ValidatorFactory passwordValidator];

```

This is highly reusable and allows you to easily define all your validators in once place throughout your entire project if you want to.

This approach makes it much easier to use `SPXFormValidator` to validate all of your fields:

``` objc

- (IBAction)textFieldDidChange:(UITextField *)textField
{
  // update the state of the signInButton as the user types in any field
  self.navigationItem.rightBarButtonItem.enabled = [SPXFormValidator validateFields:@[ self.emailField, self.passwordField ]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  // decorate the current textField based on the validator  
  cell.accessoryView = [SPXFormValidator validateField:textField] ? nil : [self accessoryView];
}

```

Download and run the example project to see individual field validation in action ;)

## Installation

SPXDataValidators is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "SPXDataValidators"

## Pull Requests

If you have ideas for really useful, reusable validators, please create a pull request and I'll get them in ASAP. Please don't submit any validators without **tests** though... that makes GitHub'ers sad :( 

When designing your validators remember these basic rules:

* Its recommended you perform **a single** type of validation only per validator
	* You can then use a compound validator for combining validators
* Ensure your validators are stateless and immutable
* Write unit tests!!!

## Author

Shaps Mohsenin, [@shaps](http://twitter.com/shaps)

## License

SPXDataValidators is available under the MIT license. See the LICENSE file for more info.

