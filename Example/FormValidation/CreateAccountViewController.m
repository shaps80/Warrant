//
//  CreateAccountViewController.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "FormValidator.h"
#import "UITextField+SPXDataValidatorAdditions.h"
#import "PasswordConfirmationField.h"

@interface CreateAccountViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UITextField *confirmationField;
@property (nonatomic, strong) FormValidator *formValidator;
@property (nonatomic, strong) PasswordConfirmationField *passwordConfirmationField;

@end

@implementation CreateAccountViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self configureValidators];
}

- (void)configureValidators
{
  [self.emailField applyValidator:[FormValidator emailValidator]];
  [self.passwordField applyValidator:[FormValidator passwordValidator]];
  [self.confirmationField applyValidator:[FormValidator passwordValidator]];
  
  self.passwordConfirmationField = [PasswordConfirmationField new];
  self.passwordConfirmationField.passwordField = self.passwordField;
  self.passwordConfirmationField.confirmationField = self.confirmationField;
  
  [self.passwordConfirmationField applyValidator:[FormValidator passwordValidator]];
}

- (void)form:(FormValidator *)form didChangeValidity:(BOOL)isValid
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
  self.navigationItem.rightBarButtonItem.enabled = [FormValidator validateFields:@[ self.emailField, self.passwordConfirmationField ]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  // update the accessoryView based on the validity of the textField
  if (![FormValidator validateField:textField]) {
    [self cellForTextField:textField].accessoryView = [self accessoryView];
  }
  
  [FormValidator validateField:self.passwordConfirmationField];
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
