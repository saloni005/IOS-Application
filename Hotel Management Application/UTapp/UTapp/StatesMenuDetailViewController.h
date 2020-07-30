//
//  StatesMenuDetailViewController.h
//  UTapp
//
//  Created by MAC on 5/5/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface StatesMenuDetailViewController : ViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrSmenu;
    NSMutableDictionary *dictionary;
    UIStepper *stepper;
    NSMutableArray *arr;
    NSInteger OID;
    AppDelegate *app1;
}
@property (weak, nonatomic) IBOutlet UITableView *mytableview;
@property (strong,nonatomic)NSMutableDictionary *dicTiffin;
@property (weak, nonatomic) IBOutlet UIImageView *imgTiffin;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblQTY;
- (IBAction)stpValueChanged:(UIStepper *)sender;
- (IBAction)bck:(id)sender;
- (IBAction)btnAddToCart:(id)sender;


@end
