//
//  DetailsRegisterationViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "DetailsRegisterationViewController.h"
#import "HomeMenuViewController.h"
#import "StartRegisterationViewController.h"

#import "Dataoperations.h"
@interface DetailsRegisterationViewController ()

@end

@implementation DetailsRegisterationViewController
@synthesize TFfname,TFlname,TFaddr,TFcpass,TFpass,str1;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"email=%@",str1);
    
   // StartRegisterationViewController *sss= [StartRegisterationViewController new];
    
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
- (BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}
NSInteger countErr1=0;


- (IBAction)btnDRnxt:(id)sender {
    
    AppDelegate *ap=[[UIApplication sharedApplication]delegate];
    [ap.arrdata addObject:TFfname.text];
    [ap.arrdata addObject:TFlname.text];
    [ap.arrdata addObject:TFaddr.text];
    [ap.arrdata addObject:TFpass.text];
    NSLog(@"%@",[ap.arrdata description]);
    
    //START
    
    Dataoperations *data=[[Dataoperations alloc]init];
    NSLog(@"%@",[ap.arrdata description]);
    NSString *str=[[NSString alloc]initWithFormat:@"Update User_Details set uFname='%@', uLname='%@', uAddress='%@', uPass='%@' where uEmail='%@'",TFfname.text,TFlname.text,TFaddr.text,TFpass.text,str1];
    
    
    NSLog(@"%@",str);
    BOOL result=[data DMLOperation:str];
    if (result==true)
    {
        UIAlertView *objalert = [[UIAlertView alloc]initWithTitle:@"Registeration" message:@"You Are A Member Now" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
        [objalert show];
    }
    else
    {
        UIAlertView *objalrt = [[UIAlertView alloc] initWithTitle:@"Registeration" message:@"Failed To Insert The Record" delegate:self cancelButtonTitle:@"cancel"otherButtonTitles:@"ok", nil];
        [objalrt show];
    }

    //END
    //start
    if([TFfname.text isEqualToString:@""] || [TFlname.text isEqualToString:@""]||[TFaddr.text isEqualToString:@""]||[TFpass.text isEqualToString:@""]||[TFcpass.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Something seems to be empty!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        countErr1=1;
    }
    
    else if (TFfname.text.length==0)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please Enter First Name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if(TFlname.text.length==0)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please Enter Last Name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (TFaddr.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please Enter Address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (TFpass.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please Enter Password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (TFcpass.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please Re-Enter Password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (TFpass.text.length<8)
        
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@" Enter proper password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
        
    }
    else if (![TFpass.text isEqualToString:TFcpass.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Password Mis-Match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        countErr1=1;
    }
    
    else{
    
    
    HomeMenuViewController *obj6 = [self.storyboard instantiateViewControllerWithIdentifier:@"hmenu"];
        [self.navigationController pushViewController:obj6 animated:YES];}
}

- (IBAction)btnBackk:(id)sender
{
    StartRegisterationViewController *obj6 = [self.storyboard instantiateViewControllerWithIdentifier:@"start"];
    [self.navigationController pushViewController:obj6 animated:YES];
}
@end
