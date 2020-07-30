//
//  StartRegisterationViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "StartRegisterationViewController.h"
#import "DetailsRegisterationViewController.h"
#import "LogInViewController.h"
#import "Dataoperations.h"
#import "AppDelegate.h"

@interface StartRegisterationViewController ()

@end

@implementation StartRegisterationViewController
//@synthesize mailid;
@synthesize dt;



@synthesize TFEnterEmail,TFPin;
- (void)viewDidLoad {
    [super viewDidLoad];
    //dt.str1=TFEnterEmail.text;
    
 //   mailid=TFEnterEmail.text;
 //   NSLog(@"%@",mailid);
   // dt.str1 = TFEnterEmail.text;
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

- (IBAction)btnSRnxt:(id)sender {
   
    DetailsRegisterationViewController *obj5 = [self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    obj5.str1=self.TFEnterEmail.text;
    
    [self.navigationController pushViewController:obj5 animated:YES];

    Dataoperations *data=[[Dataoperations alloc]init];
    NSString *str=[[NSString alloc]initWithFormat:@"insert into User_Details(uEmail,vcode) values('%@','%@')",TFEnterEmail.text,TFPin.text];
    dt.str1=TFEnterEmail.text;
    BOOL result=[data DMLOperation:str];
    if (result==true)
    {
        
        }
    else
    {
        UIAlertView *objalrt = [[UIAlertView alloc] initWithTitle:@"Registeration" message:@"Failed To Insert The Record" delegate:self cancelButtonTitle:@"cancel"otherButtonTitles:@"ok", nil];
        [objalrt show];
    }
    
    
    //start validation
    
    
    //NSInteger countErr1=0;
    
   /* if ([self validateEmail:TFEnterEmail.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test!" message:@"Please Enter valid email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        // countErr1=1;
        
    }
    
    
    
    AppDelegate *ap=[[UIApplication sharedApplication]delegate];
    ap.arrdata=[[NSMutableArray alloc]init];
    [ap.arrdata addObject:TFEnterEmail.text];
    [ap.arrdata addObject:TFPin.text];
    
    DetailsRegisterationViewController *detail =[self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    [self.navigationController pushViewController:detail animated:YES];
    
    
    
}
- (BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}*/
    
    
}

- (IBAction)fBack:(id)sender
{
    
    LogInViewController *ll=[self.storyboard instantiateViewControllerWithIdentifier:@"loginvc"];
    [self.navigationController pushViewController:ll animated:YES];
}

- (IBAction)btnsend:(id)sender
{
    
    
    
    NSString *str=[[NSString alloc]initWithFormat:@"http://eurbantadka15.somee.com/api/values/PostSendPass?to=%@&sub=%@",TFEnterEmail.text];
    NSURL *Url=[[NSURL alloc]initWithString:str];
    NSURLRequest *req=[[NSURLRequest alloc]initWithURL:Url];
    NSLog(@"%@",Url);
    NSURLConnection *con=[[NSURLConnection alloc]initWithRequest:req delegate:self];
    
    
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    NSLog(@"%@",[response description]);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *st=[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
    NSString *s = [NSString stringWithFormat:@"\"Mail Send Sucessfully\""];
    
    NSLog(@"%@",s);
    NSLog(@"%@",st);
    
    if ([st isEqualToString:s]==YES)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"PIN Status" message:@"Your PIN send successfully!!!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alrt show];
    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Sending Status" message:@"Pin sending faild!!!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alrt show];
    }

}

@end
