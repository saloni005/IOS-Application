//
//  IndianBreadSetMealMenuViewController.h
//  UTapp
//
//  Created by MAC on 4/23/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface IndianBreadSetMealMenuViewController : ViewController<UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate,UISearchControllerDelegate>
{
    //NSMutableArray *contentList;
    NSMutableArray *arrSmenu;
    NSMutableArray *filteredContentList;
    BOOL isSearching;
    UIStepper *stepper;
    NSMutableArray *arr;
    NSInteger OID;
    AppDelegate *app1;
    
}

- (IBAction)bckk:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *mytableview;
- (IBAction)btncart:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableContent;
@property (weak, nonatomic) IBOutlet UISearchBar *searchSnack;

@property (weak, nonatomic) IBOutlet UISearchBar *SearchData;
@property (weak, nonatomic) IBOutlet UISearchBar *sbar;

@end
