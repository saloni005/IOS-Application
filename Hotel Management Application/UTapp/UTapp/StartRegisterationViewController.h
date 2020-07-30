//
//  StartRegisterationViewController.h
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"
#import "DetailsRegisterationViewController.h"

@interface StartRegisterationViewController : ViewController<NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UITextField *TFEnterEmail;
@property (weak, nonatomic) IBOutlet UITextField *TFPin;
@property(strong,nonatomic)DetailsRegisterationViewController *dt;
- (IBAction)btnSRnxt:(id)sender;
- (IBAction)fBack:(id)sender;
- (IBAction)btnsend:(id)sender;

@end
