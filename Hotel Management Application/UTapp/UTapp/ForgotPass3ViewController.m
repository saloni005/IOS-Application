//
//  ForgotPass3ViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ForgotPass3ViewController.h"
#import "LogInViewController.h"
#import "StartRegisterationViewController.h"

@interface ForgotPass3ViewController ()

@end

@implementation ForgotPass3ViewController

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

- (IBAction)btnnBackk:(id)sender
{
    LogInViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"loginvc"];
    [self.navigationController pushViewController:main animated:YES];

}

- (IBAction)btnRegisterNw:(id)sender
{
    StartRegisterationViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"start"];
    [self.navigationController pushViewController:main animated:YES];

}
@end
