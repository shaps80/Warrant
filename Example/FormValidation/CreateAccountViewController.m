//
//  CreateAccountViewController.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "ValidatorFactory.h"
#import "UITextField+SPXDataValidatorAdditions.h"
#import "SPXPasswordValidationField.h"
#import "SPXFormValidator.h"

@interface CreateAccountViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UITextField *confirmationField;
@property (nonatomic, strong) ValidatorFactory *formValidator;
@property (nonatomic, strong) SPXPasswordValidationField *passwordConfirmationField;

@end

@implementation CreateAccountViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self configureValidators];
}

- (void)configureValidators
{
  self.emailField.dataValidator = [ValidatorFactory emailValidator];
  self.passwordField.dataValidator = [ValidatorFactory passwordValidator];
  self.confirmationField.dataValidator = [ValidatorFactory passwordValidator];
  
  self.passwordConfirmationField = [SPXPasswordValidationField fieldForPasswordField:self.passwordField confirmationField:self.passwordField];
  self.passwordConfirmationField.dataValidator = [ValidatorFactory passwordValidator];
}

- (void)form:(ValidatorFactory *)form didChangeValidity:(BOOL)isValid
{
  self.navigationItem.rightBarButtonItem.enabled = isValid;
}




#pragma mark - TextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
  // reset the accessoryView
  [self cellForTextField:textField].accessoryView = nil;
}

- (IBAction)textFieldDidChange:(UITextField *)textField
{
  // update the state of the signInButton as the user types in any field
  self.navigationItem.rightBarButtonItem.enabled = [SPXFormValidator validateFields:@[ self.emailField, self.passwordConfirmationField ]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  // update the accessoryView based on the validity of the textField
  if (![SPXFormValidator validateField:textField]) {
    [self cellForTextField:textField].accessoryView = [self accessoryView];
  }
  
  [SPXFormValidator validateField:self.passwordConfirmationField];
}




#pragma mark - Helpers

/**
 *  The methods below are purely for convenience
 */

- (UIImageView *)accessoryView
{
  return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bad_value"]];
}

- (UITextField *)textFieldForCell:(UITableViewCell *)cell
{
  return cell.contentView.subviews.firstObject;
}

- (UITableViewCell *)cellForTextField:(UITextField *)textField
{
  return (UITableViewCell *)textField.superview.superview;
}

@end
