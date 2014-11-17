//
//  MasterViewController.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SignInViewController.h"
#import "ValidatorFactory.h"
#import "UITextField+SPXDataValidatorAdditions.h"
#import "SPXFormValidator.h"

static NSString * const PasswordRegex = @"^(?=.*\\d)(?=.*[A-Za-z]).{6,32}$";

@interface SignInViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) ValidatorFactory *formValidator;

@end

@implementation SignInViewController

#pragma mark - Configuration

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self configureValidators];
}

- (void)configureValidators
{
  [self.emailField applyValidator:[ValidatorFactory emailValidator]];
  [self.passwordField applyValidator:[ValidatorFactory passwordValidator]];
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
  self.navigationItem.rightBarButtonItem.enabled = [SPXFormValidator validateFields:@[ self.emailField, self.passwordField ]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  // update the accessoryView based on the validity of the textField
  if (![SPXFormValidator validateField:textField]) {
    [self cellForTextField:textField].accessoryView = [self accessoryView];
  }
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

