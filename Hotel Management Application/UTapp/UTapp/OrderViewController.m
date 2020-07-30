//
//  OrderViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "OrderViewController.h"
#import "HomeMenuViewController.h"
#import "OrderHistoryViewController.h"
#import "MyBasketViewController.h"
#import "MainMenuViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)bback:(id)sender {
    
    HomeMenuViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"hmenu"];
    [self.navigationController pushViewController:back animated:YES];
}

- (IBAction)btnOrderNow:(id)sender {
    MyBasketViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"basket"];
    [self.navigationController pushViewController:back animated:YES];
}

- (IBAction)btnCreateNewOrder:(id)sender
{
    MainMenuViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"mainmenu"];
    [self.navigationController pushViewController:back animated:YES];
}

- (IBAction)btnOrDerHistory:(id)sender
{
    OrderHistoryViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"orderHistory"];
    [self.navigationController pushViewController:back animated:YES];
}
@end
