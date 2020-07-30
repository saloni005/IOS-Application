//
//  StatesMenuDetailViewController.m
//  UTapp
//
//  Created by MAC on 5/5/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "StatesMenuDetailViewController.h"
#import "Dataoperations.h"
#import "StatesMenuDetailTableViewCell.h"
#import "StatesMenuDetailViewController.h"
#import "StatesSpecialMenuViewController.h"
#import "AppDelegate.h"

@interface StatesMenuDetailViewController ()

@end

@implementation StatesMenuDetailViewController
@synthesize dicTiffin;
- (void)viewDidLoad {
    app1=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    self.lblName.text=[dicTiffin objectForKey:@"smName"];
    self.lblPrice.text =[dicTiffin objectForKey:@"smPrice"];
    self.imgTiffin.image=[UIImage imageNamed:[dicTiffin objectForKey:@"smImg"]];
    self.lblQTY.text=@"";
    /*
     NSString *str=[[NSString alloc]initWithFormat:@"select smName,smImg,smQty,smPrice from SMenu where fkMid=1"];
     arrSmenu=[[NSMutableArray alloc]init];
     Dataoperations *dt=[[Dataoperations alloc]init];
     arrSmenu=[dt selectMile:str];
     int i=(int)arrSmenu.count;
     if (i!=0) {
     
     
     
     NSLog(@"%@",[arrSmenu description]);
     
     }
     else
     {
     UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Not Found" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
     [alrt show];
     
     }
     */
}

-(void)buttondecPressed
{
    
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAddToCart:(id)sender
{
    arr=[[NSMutableArray alloc]init];
    
    //oid,uEmail,fkSmid,qty,total
    
    NSString *FID = [dicTiffin objectForKey:@"pkSMid"];
    NSLog(@"%@",FID);
    
    
    Dataoperations *data=[[Dataoperations alloc]init];
    
    
    
    NSDateFormatter *df  = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *d = [[NSDate alloc]init];
    
    NSString *dtstring =[NSString stringWithFormat:@"%@",[df stringFromDate:d]];
    
    
    NSString *str=[[NSString alloc]initWithFormat:@"insert into food_order ('Oid','fkSMid','fkCid','qty','orderdate') values('%ld','%@','%@','%@','%@')",(long)OID,app1.strEmail,FID,self.lblQTY.text,dtstring];
    
    
    BOOL result=[data DMLOperation:str];
    if (result==true)
    {
    }
    else
    {
        UIAlertView *objalrt = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Failed To Insert The Record" delegate:self cancelButtonTitle:@"cancel"otherButtonTitles:@"ok", nil];
        [objalrt show];
    }
    
}


- (IBAction)stpValueChanged:(UIStepper *)sender
{
    NSString *str = [NSString stringWithFormat:@"%ld",(long)sender.value];
    self.lblQTY.text=str;
}

- (IBAction)bck:(id)sender
{
    StatesSpecialMenuViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"statesMenu"];
    [self.navigationController pushViewController:back animated:YES];

}

@end
