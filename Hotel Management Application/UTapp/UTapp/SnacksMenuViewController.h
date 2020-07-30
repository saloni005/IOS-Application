//
//  SnacksMenuViewController.h
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. l rights reserved.



#import "ViewController.h"
#import "AppDelegate.h"
@interface SnacksMenuViewController : ViewController<UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate,UISearchControllerDelegate>
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
//search valu

@property (weak, nonatomic) IBOutlet UITableView *tableContent;
@property (weak, nonatomic) IBOutlet UISearchBar *searchSnack;

@property (weak, nonatomic) IBOutlet UITableView *mytableview;
@property (weak, nonatomic) IBOutlet UISearchBar *sbar;
@property (weak, nonatomic) IBOutlet UISearchBar *SearchData;


//search valu puru
- (IBAction)btnback:(id)sender;
- (IBAction)btnCart:(id)sender;








@end
