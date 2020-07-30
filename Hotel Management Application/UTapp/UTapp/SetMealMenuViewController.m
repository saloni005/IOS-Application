//
//  SetMealMenuViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "SetMealMenuViewController.h"
#import "MainMenuViewController.h"
#import "VegetableMenuViewController.h"
#import "IndianBreadSetMealMenuViewController.h"
#import "RiceSetMealMenuViewController.h"
#import "ExtraFoodItemsViewController.h"
#import "MyBasketViewController.h"

@interface SetMealMenuViewController ()

@end

@implementation SetMealMenuViewController

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

- (IBAction)btnBck:(id)sender
{
    MainMenuViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"mainmenu"];
    [self.navigationController pushViewController:main animated:YES];

}

- (IBAction)btn1:(id)sender
{
    VegetableMenuViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"roti"];
    [self.navigationController pushViewController:main animated:YES];

}

- (IBAction)btn2:(id)sender
{
    IndianBreadSetMealMenuViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"vegetable"];
    [self.navigationController pushViewController:main animated:YES];

    
}

- (IBAction)btn3:(id)sender
{
    RiceSetMealMenuViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"rice"];
    [self.navigationController pushViewController:main animated:YES];

}

- (IBAction)btn4:(id)sender
{
    ExtraFoodItemsViewController *ext=[self.storyboard instantiateViewControllerWithIdentifier:@"extraa"];
    [self.navigationController pushViewController:ext animated:YES];
    
}

- (IBAction)btnCart:(id)sender
{
    MyBasketViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"basket"];
    [self.navigationController pushViewController:main animated:YES];

}
@end
