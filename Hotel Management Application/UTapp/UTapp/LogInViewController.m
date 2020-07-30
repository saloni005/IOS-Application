//
//  LogInViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "LogInViewController.h"
#import "StartRegisterationViewController.h"
#import "HomeMenuViewController.h"
#import "Dataoperations.h"
#import "AppDelegate.h"
#import "ForgotPass3ViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController
@synthesize TFUname,TFpass;


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
- (IBAction)btnlogin:(id)sender
{
    
   Dataoperations *Data=[[Dataoperations alloc]init];
    NSString *str=[[NSString alloc]initWithFormat:@"select uEmail from User_Details where uEmail='%@' and uPass='%@'",TFUname.text,TFpass.text];
   NSString *st=[[NSString alloc]init];
    st=[Data GetLogin:str];
//dis st=@"saloni@nirmauni.ac.in";
   //dis NSLog(@"%@",st);
    if ([st isEqualToString:@""])
    {
        
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message for foodie!" message:@"Something seems to be wrong!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];
    }
    else
    {
        AppDelegate *ap=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        ap.strEmail=[[NSString alloc]initWithString:st];
        HomeMenuViewController *home=[self.storyboard instantiateViewControllerWithIdentifier:@"hmenu"];
        [self.navigationController pushViewController:home animated:YES];
        
    }
    
 
    
}
- (IBAction)btnForgetPass:(id)sender {
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Forgot Password?" message:@"Enter Your Registered email-id" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Next", nil];
    av.tag=1;
    av.alertViewStyle = UIAlertViewStylePlainTextInput;
    [av textFieldAtIndex:0].placeholder = @"enter your email-id";
    
    [av textFieldAtIndex:0].delegate = self;
    [av show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Dataoperations *dd = [Dataoperations new];
    
    
    if(alertView.tag==1)
    {
        NSString *test = [alertView textFieldAtIndex:0].text ;
        NSLog(@"%@",test);
        
        NSString *str=[[NSString alloc]initWithFormat:@"select uEmail from User_Details where uEmail='%@'",test];
        NSLog(@"%@",str);
        NSString *xyz;
        
        xyz =[dd CheckEmail:str];
        //  NSLog(@"XYZ = %@",xyz);
    
        if (buttonIndex==0) {
            LogInViewController *obj2 =[self.storyboard instantiateViewControllerWithIdentifier:@"loginvc"];
            [self.navigationController pushViewController:obj2 animated:YES];

            
        }
        
        if (buttonIndex==1)
        {
            NSLog(@"test = %@",test);
            NSLog(@"str = %@",str);
            
            if([test isEqualToString:xyz])
            {
                UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Forgot Password?" message:@"Enter your password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Update", nil];
                
                alt.tag=2;
                [alt setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
                UITextField *text1 = [alt textFieldAtIndex:0];
                text1.placeholder=@"New Password";
                text1.secureTextEntry=YES;
                
                
                UITextField *text2= [alt textFieldAtIndex:1];
                text2.placeholder=@"Retype Password";
                //text2.secureTextEntry=YES;
                //[[alt textFieldAtIndex:1] setSecureTextEntry:YES];
                
                [alt show];
                
                NSLog(@"str = %@",text2.text);
                
                //start
                Dataoperations *data=[[Dataoperations alloc]init];
                NSString *st=[[NSString alloc]initWithFormat:@"Update   User_Details set uPass='%@' where uEmail='%@'",text2.text,test];
                NSLog(@"str = %@",text2.text);
                
                BOOL result=[data DMLOperation:st];
                if (result==true)
                {
                    }
                else
                {
                   // UIAlertView *objalrt = [[UIAlertView alloc] initWithTitle:@"Login" message:@"Failed To Update The Password" delegate:self cancelButtonTitle:@"cancel"otherButtonTitles:@"ok", nil];
                    //[objalrt show];
                    UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Forgot Password?" message:@"Enter your password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Update", nil];
                    
                    alt.tag=2;
                    [alt setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
                    UITextField *text1 = [alt textFieldAtIndex:0];
                    text1.placeholder=@"New Password";
                    text1.secureTextEntry=YES;
                    
                    
                    UITextField *text2= [alt textFieldAtIndex:1];
                    text2.placeholder=@"Retype Password";
                    text2.secureTextEntry=YES;
                    //[[alt textFieldAtIndex:1] setSecureTextEntry:YES];
                    
                    [alt show];
                    
                }
                
                //stop
        
            }
            else{
                ForgotPass3ViewController *obj2 =[self.storyboard instantiateViewControllerWithIdentifier:@"forgotPass3"];
                [self.navigationController pushViewController:obj2 animated:YES];
                
            }
            
        }
    }
    if(alertView.tag==2)
    {
        //update
    }
}


- (IBAction)btnRegisterNow:(id)sender {
    StartRegisterationViewController *obj2 =[self.storyboard instantiateViewControllerWithIdentifier:@"start"];
    [self.navigationController pushViewController:obj2 animated:YES];
}
@end
