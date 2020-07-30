//
//  LogInViewController.h
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"


@interface LogInViewController : ViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *TFUname;
@property (weak, nonatomic) IBOutlet UITextField *TFpass;


- (IBAction)btnForgetPass:(id)sender;
- (IBAction)btnRegisterNow:(id)sender;
- (IBAction)btnlogin:(id)sender;

@end
