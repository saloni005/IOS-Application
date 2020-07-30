//
//  ReviewViewController.h
//  UTapp
//
//  Created by MAC on 4/11/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownBank.h"
#import "HomeMenuViewController.h"

@interface ReviewViewController : UIViewController<NSXMLParserDelegate,UITextFieldDelegate,NSURLConnectionDelegate>

{
    NSMutableData *maildata;
    NSXMLParser *xmlParser;
    NSURLConnection *currentConnection;
    NSString *elementnm;
    DropDownBank *drplist;
    NSArray *arrlist;

}
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
- (IBAction)btnselect:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnlist;
@property (weak, nonatomic) IBOutlet UILabel *lbltext;
- (IBAction)eBack:(id)sender;
- (IBAction)btnSubmit:(id)sender;

- (IBAction)btnred:(UIButton *)sender;
- (IBAction)btn2:(UIButton *)sender;
- (IBAction)btn3:(UIButton *)sender;
- (IBAction)btn4:(UIButton *)sender;
- (IBAction)btn5:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtemail;
@property (weak, nonatomic) IBOutlet UITextField *txtsubject;
@property (weak, nonatomic) IBOutlet UITextView *txtdescription;
@property (weak, nonatomic) IBOutlet UITextField *txtprice;
@property (weak, nonatomic) IBOutlet UITextField *txtquality;
@property (weak, nonatomic) IBOutlet UITextField *txtservice;


@end
