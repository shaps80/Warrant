//
//  FormValidation.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "UserInterfaceFormValidator.h"
#import "SPXDataValidator.h"
#import "UITextField+SPXDataValidatorAdditions.h"


@interface UserInterfaceFormValidator () <UITextFieldDelegate>
@property (nonatomic, strong) NSArray *fields;
@property (nonatomic, strong) UIBarButtonItem *signInButton;
@end


@implementation UserInterfaceFormValidator

#pragma mark - Configuration

+ (instancetype)validatorForTextFields:(NSArray *)textFields barButtonItem:(UIBarButtonItem *)item
{
  UserInterfaceFormValidator *validator = [UserInterfaceFormValidator new];
  validator.fields = textFields;
  validator.signInButton = item;
  
  // This just iterates over the textFields and makes this class their delegate
  for (UITextField *field in validator.fields) {
    field.delegate = validator;
    [field addTarget:validator action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
  }
  
  // disable the signIn button by default
  item.enabled = NO;
  
  return validator;
}

#pragma mark - Validation

/**
 *  This is the brunt of the code, performing validation at the form level
 *  @return Returns YES if all validator's for all fields are valid
 */
- (BOOL)isFormReady
{
  for (UITextField *field in self.fields) {
    if (![field validateWithError:nil]) {
      return NO;
    }
  }
  
  return YES;
}

/**
 *  This performs validation at the field level. It decorates the view/cell depending on the validity of the data
 *  Ideally this approach would be a little different, perhaps a delegate back to the controller.
 *
 *  The responsibiliy of this class is confusing due to the name, but again this is purely for demonstration purposes ;)
 */
- (void)validateTextField:(UITextField *)textField
{
  NSError *error = nil;
  UITableViewCell *cell = [self cellForTextField:textField];
  
  if (![textField validateWithError:&error]) {
    if (error) {
      cell.accessoryView = [self accessoryView];
      NSLog(@"%@", error);
    }
  } else {
    cell.accessoryView = nil;
  }
}

#pragma mark - TextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
  // reset the accessoryView
  [self cellForTextField:textField].accessoryView = nil;
}

- (void)textFieldDidChange:(UITextField *)textField
{
  // update the state of the signInButton as the user types in any field
  self.signInButton.enabled = [self isFormReady];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
  // update the accessoryView based on the validity of the textField
  [self validateTextField:textField];
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
