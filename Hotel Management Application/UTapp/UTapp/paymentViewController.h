//
//  paymentViewController.h
//  SilverSpoon
//
//  Created by tops on 4/1/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownBank.h"



@interface paymentViewController : UIViewController
{
    
    NSArray *arrdata1;
    DropDownBank *drpbank;
}
- (IBAction)btnbank:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblbank;
@property (weak, nonatomic) IBOutlet UITextField *scno;
@property (weak, nonatomic) IBOutlet UIButton *btnselectbank;
- (IBAction)btnCheckout:(id)sender;
- (IBAction)btnBack:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *accntno;


@end
