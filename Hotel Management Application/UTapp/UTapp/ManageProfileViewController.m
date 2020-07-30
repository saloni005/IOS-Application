//
//  ManageProfileViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ManageProfileViewController.h"
#import "HomeMenuViewController.h"
#import "Dataoperations.h"
#import "AppDelegate.h"
#import "LogInViewController.h"
#import "OrderHistoryViewController.h"

@interface ManageProfileViewController ()

@end

@implementation ManageProfileViewController
@synthesize TFfname,TFlname,TFaddr,TFnum;

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *app1=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    Dataoperations *dd = [[Dataoperations alloc]init];
    arr=[[NSMutableArray alloc]init];
    
    NSString *str1= [[NSString alloc]initWithFormat:@"Select * from User_Details where uEmail='%@'" , app1.strEmail];
    
    arr=  [dd GetProfile:(str1) ];
    TFfname.text=[arr objectAtIndex:0];
    TFlname.text=[arr objectAtIndex:1];
    TFaddr.text=[arr objectAtIndex:2];
    TFnum.text=[arr objectAtIndex:3];
    
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


- (IBAction)btnback:(id)sender
{
    HomeMenuViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"hmenu"];
    [self.navigationController pushViewController:back animated:YES];
}

- (IBAction)btnLogout:(id)sender
{
    LogInViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"loginvc"];
    [self.navigationController pushViewController:back animated:YES];

}

- (IBAction)mpDone:(id)sender
{
 
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    Dataoperations *Data=[[Dataoperations alloc]init];
    NSString *st=[[NSString alloc]initWithFormat:@"Update   User_Details set uFname='%@', uLname='%@', uAddress='%@', uNumber='%@' where uEmail='%@'",TFfname.text,TFlname.text,TFaddr.text,TFnum.text,app.strEmail];
    NSString *s=[[NSString alloc]init];
    st=[Data GetLogin:st];
    NSLog(@"%@",s);
   /* if ([st isEqualToString:@""])
    {
        
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message for foodie!" message:@"Login Fail -> Check your EmailID and password!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];
    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Welcome to Urban Tadka" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];
    }*/
    
    if([[TFfname text] isEqualToString:@""] || [[TFlname text] isEqualToString:@""] || [[TFaddr text] isEqualToString:@""])
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message for foodie" message:@"oOps..Your something seems missing! (contact num *optional)" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];
 
    }
    else if (TFfname.text.length==0)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message for foodie" message:@"oOps..Your name is missing!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];
   
    }
    else if (TFlname.text.length==0)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message for foodie" message:@"oOps..Your surname is missing!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];

    }
    else if (TFaddr.text.length==0)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message for foodie" message:@"oOps..Your address is missing!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];

    }
    else if (TFnum.text.length!=0)
    {
        if(TFnum.text.length<=9 || TFnum.text.length>=13){
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message for foodie" message:@"Something is wrong with your contact numbers!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            [alrt show];}
        else
        {UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message for foodie" message:@"yeAh..Your profile updated successfully!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
            [alrt show];
}

    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message for foodie" message:@"yeAh..Your profile updated successfully!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];

    }
}

- (IBAction)btnMyOrders:(id)sender
{
    OrderHistoryViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"orderHistory"];
    [self.navigationController pushViewController:back animated:YES];

}


@end
