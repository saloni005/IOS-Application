//
//  MainMenuViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "MainMenuViewController.h"
#import "HomeMenuViewController.h"
#import "SnacksMenuViewController.h"
#import "SetMealMenuViewController.h"
#import "StartRegisterationViewController.h"
#import "SweetsMenuViewController.h"
#import "StatesSpecialMenuViewController.h"
#import "TiffinMenuViewController.h"
#import "ExtraFoodItemsViewController.h"
#import "ComboViewController.h"


@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

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

- (IBAction)aaBack:(id)sender
{
    HomeMenuViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"hmenu"];
    [self.navigationController pushViewController:back animated:YES];
   
}

- (IBAction)btnSnacks:(id)sender
{
    SnacksMenuViewController *obj1=[self.storyboard instantiateViewControllerWithIdentifier:@"snacks"];
    [self.navigationController pushViewController:obj1 animated:YES];
    
}

- (IBAction)btnSetMeal:(id)sender
{
    SetMealMenuViewController *sm=[self.storyboard instantiateViewControllerWithIdentifier:@"setmeal"];
    [self.navigationController pushViewController:sm animated:YES];
    
}

- (IBAction)btnStatesDaSwad:(id)sender
{
    StatesSpecialMenuViewController *ssm=[self.storyboard instantiateViewControllerWithIdentifier:@"statesMenu"];
    [self.navigationController pushViewController:ssm animated:YES];
    
}

- (IBAction)btnSweets:(id)sender
{
    SweetsMenuViewController *sweet=[self.storyboard instantiateViewControllerWithIdentifier:@"sweetss"];
    [self.navigationController pushViewController:sweet animated:YES];
    
}

- (IBAction)btnTiffin:(id)sender
{
    TiffinMenuViewController *tt=[self.storyboard instantiateViewControllerWithIdentifier:@"tiffin"];
    [self.navigationController pushViewController:tt animated:YES];
    
}

- (IBAction)btnExtra:(id)sender
{
    ComboViewController *tt=[self.storyboard instantiateViewControllerWithIdentifier:@"combo"];
    [self.navigationController pushViewController:tt animated:YES];
    
}
@end
