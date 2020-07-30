//
//  ManageProfileViewController.h
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"

@interface ManageProfileViewController : ViewController
{
    NSMutableArray *arr;
}
- (IBAction)btnback:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *TFfname;
@property (weak, nonatomic) IBOutlet UITextField *TFlname;
@property (weak, nonatomic) IBOutlet UITextField *TFaddr;
@property (weak, nonatomic) IBOutlet UITextField *TFnum;
- (IBAction)btnLogout:(id)sender;

- (IBAction)mpDone:(id)sender;
- (IBAction)btnMyOrders:(id)sender;


@end
