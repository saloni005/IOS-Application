//
//  SweetsMenuViewController.h
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface SweetsMenuViewController : ViewController<UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate,UISearchControllerDelegate>
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

@property (weak, nonatomic) IBOutlet UITableView *mytableview;

- (IBAction)bbbk:(id)sender;
- (IBAction)btncart:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *sbar;
@property (weak, nonatomic) IBOutlet UISearchBar *SearchData;

@property (weak, nonatomic) IBOutlet UITableView *tableContent;


@end
