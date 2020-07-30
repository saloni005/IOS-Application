//
//  MyBasketViewController.h
//  UTapp
//
//  Created by MAC on 5/3/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface MyBasketViewController : ViewController<UIActionSheetDelegate, UIAlertViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrSmenu;
    UIStepper *stepper;
    NSMutableArray *arr;
    AppDelegate *app1;

}
- (IBAction)btnBck:(id)sender;
- (IBAction)btnOrder:(id)sender;
- (IBAction)btnOr:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *mytableview;


@end
