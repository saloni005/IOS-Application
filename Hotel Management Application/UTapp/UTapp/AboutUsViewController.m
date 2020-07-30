//
//  AboutUsViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "AboutUsViewController.h"
#import "HomeMenuViewController.h"
#import "VdoplayerController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

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

- (IBAction)cback:(id)sender {
    
    HomeMenuViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"hmenu"];
    [self.navigationController pushViewController:back animated:YES];
}

- (IBAction)playvdo:(id)sender
{
 //   VdoplayerController *ply=[self.storyboard instantiateViewControllerWithIdentifier:@"vdoplayer"];
    //aboutus
    AboutUsViewController *ply=[self.storyboard instantiateViewControllerWithIdentifier:@"aboutus"];
    
    NSURL *url=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"videiii" ofType:@"3gp"]];
    
    MPMoviePlayerViewController *mp=[[MPMoviePlayerViewController alloc]initWithContentURL:url];
    
    mp.moviePlayer.movieSourceType=MPMovieSourceTypeFile;
    [mp.moviePlayer play];
    [self presentMoviePlayerViewControllerAnimated:mp];
    [self.navigationController pushViewController:ply animated:YES];
    
    
}
@end
