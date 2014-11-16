//
//  MasterViewController.m
//  FormValidation
//
//  Created by Shaps Mohsenin on 16/11/2014.
//  Copyright (c) 2014 Snippex. All rights reserved.
//

#import "SignInViewController.h"

#import "SPXCompoundDataValidator.h"
#import "SPXEmailDataValidator.h"
#import "SPXPasswordDataValidator.h"
#import "SPXEmptyDataValidator.h"

#import "UITextField+SPXDataValidatorAdditions.h"
#import "UserInterfaceFormValidator.h"


static NSString * const PasswordRegex = @"^(?=.*\\d)(?=.*[A-Za-z]).{6,32}$";


@interface SignInViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) UserInterfaceFormValidator *formValidator;

@end


@implementation SignInViewController

#pragma mark - Configuration

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self configureFormValidator];
  [self configureValidators];
}

- (void)configureFormValidator
{
  self.formValidator = [UserInterfaceFormValidator validatorForTextFields:@[ self.emailField, self.passwordField ]
                                               barButtonItem:self.navigationItem.rightBarButtonItem];
}

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

@end

