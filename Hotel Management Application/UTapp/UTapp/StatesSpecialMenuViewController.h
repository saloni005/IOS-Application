//
//  StatesSpecialMenuViewController.h
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface StatesSpecialMenuViewController : ViewController<UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate,UISearchControllerDelegate>
{
    NSMutableArray *arrSmenu;
    NSMutableArray *filteredContentList;
    BOOL isSearching;
    UIStepper *stepper;
    NSMutableArray *arr;
    NSInteger OID;
    AppDelegate *app1;
    
}
- (IBAction)btnBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *smName;
@property (weak, nonatomic) IBOutlet UIButton *smImg;
@property (weak, nonatomic) IBOutlet UIButton *smQty;
@property (weak, nonatomic) IBOutlet UIButton *smPrice;

@property (weak, nonatomic) IBOutlet UITableView *tableContent;
@property (weak, nonatomic) IBOutlet UISearchBar *sbar;
@property (weak, nonatomic) IBOutlet UISearchBar *SearchData;
@property (weak, nonatomic) IBOutlet UITableView *mytableview;

@end
