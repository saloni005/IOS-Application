//
//  HomeMenuViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "HomeMenuViewController.h"
#import "ManageProfileViewController.h"
#import "MainMenuViewController.h"
#import "OrderViewController.h"
#import "ReviewViewController.h"
#import "SecondController.h"
#import "AboutUsViewController.h"

@interface HomeMenuViewController ()

@end

@implementation HomeMenuViewController

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


- (IBAction)btnprofile:(id)sender
{
    ManageProfileViewController *profile=[self.storyboard instantiateViewControllerWithIdentifier:@"mnprofile"];
    [self.navigationController pushViewController:profile animated:YES];
}

- (IBAction)btnmenu:(id)sender
{
    MainMenuViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"mainmenu"];
    [self.navigationController pushViewController:main animated:YES];
}

- (IBAction)btnorder:(id)sender
{
    OrderViewController *order=[self.storyboard instantiateViewControllerWithIdentifier:@"ordermenu"];
    [self.navigationController pushViewController:order animated:YES];
}

- (IBAction)btnreview:(id)sender
{
    ReviewViewController *myreview=[self.storyboard instantiateViewControllerWithIdentifier:@"review"];
    [self.navigationController pushViewController:myreview animated:YES];
}

- (IBAction)btnmaps:(id)sender
{
    SecondController *map=[self.storyboard instantiateViewControllerWithIdentifier:@"maps"];
    [self.navigationController pushViewController:map animated:YES];
}

- (IBAction)btnabout:(id)sender
{
    AboutUsViewController *about=[self.storyboard instantiateViewControllerWithIdentifier:@"aboutus"];
    [self.navigationController pushViewController:about animated:YES];
}
@end
