//
//  MasterViewController.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SignInViewController.h"
#import "SPXFormValidator.h"
#import "UITextField+SPXDataValidatorAdditions.h"

@interface SignInViewController () <UITextFieldDelegate>
@property (nonatomic, strong) IBOutlet SPXFormValidator *formValidator;
@end

@implementation SignInViewController

#pragma mark - Configuration

- (IBAction)textFieldDidEndEditing:(UITextField *)textField
{
  NSError *error = nil;
  if (![textField validateWithError:&error]) {
    NSLog(@"%@", error);
  }
}

- (IBAction)textFieldDidChange:(UITextField *)textField
{
  self.navigationItem.rightBarButtonItem.enabled = [self.formValidator isValid:nil];
}

@end

