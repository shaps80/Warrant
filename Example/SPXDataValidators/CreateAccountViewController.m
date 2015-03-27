//
//  CreateAccountViewController.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 17/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "UITextField+SPXDataValidatorAdditions.h"
#import "SPXFormValidator.h"

@interface CreateAccountViewController ()
@property (nonatomic, strong) IBOutlet SPXFormValidator *formValidator;
@end

@implementation CreateAccountViewController

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
