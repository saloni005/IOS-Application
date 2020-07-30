//
//  ThankYouOrderingViewController.m
//  UTapp
//
//  Created by MAC on 5/3/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ThankYouOrderingViewController.h"
#import "HomeMenuViewController.h"
#import "ReviewViewController.h"
#import "MainMenuViewController.h"

@interface ThankYouOrderingViewController ()

@end

@implementation ThankYouOrderingViewController

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

- (IBAction)btnHome:(id)sender
{
    HomeMenuViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"hmenu"];
    [self.navigationController pushViewController:back animated:YES];

}

- (IBAction)btnMenu:(id)sender
{
    MainMenuViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"mainmenu"];
    [self.navigationController pushViewController:main animated:YES];

}

- (IBAction)btnReview:(id)sender
{
    ReviewViewController *myreview=[self.storyboard instantiateViewControllerWithIdentifier:@"review"];
    [self.navigationController pushViewController:myreview animated:YES];

}
@end
