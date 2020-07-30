//
//  DetailsRegisterationViewController.h
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"

@interface DetailsRegisterationViewController : ViewController{}
@property (weak, nonatomic) IBOutlet UITextField *TFfname;
@property (weak, nonatomic) IBOutlet UITextField *TFlname;
@property (weak, nonatomic) IBOutlet UITextField *TFaddr;
@property (weak, nonatomic) IBOutlet UITextField *TFpass;
@property (weak, nonatomic) IBOutlet UITextField *TFcpass;
@property (weak,nonatomic) IBOutlet NSString *str1;

- (IBAction)btnDRnxt:(id)sender;
- (IBAction)btnBackk:(id)sender;

@end
