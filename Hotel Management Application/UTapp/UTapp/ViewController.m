//
//  ViewController.m
//  UTapp
//
//  Created by MAC on 4/9/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"

#import "LogInViewController.h"
//#import "Dataoperations.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)textFieldShouldReturn: (UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btncreateMeal:(id)sender
{
    LogInViewController *login =[self.storyboard instantiateViewControllerWithIdentifier:@"loginvc"];
    [self.navigationController pushViewController:login animated:YES];
}
@end
