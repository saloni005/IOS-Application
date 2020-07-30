//
//  MyBasketViewController.m
//  UTapp
//
//  Created by MAC on 5/3/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "MyBasketViewController.h"
#import "OrderViewController.h"
#import "ThankYouOrderingViewController.h"
#import "MainMenuViewController.h"
#import "BasketTableViewCell.h"
#import "Dataoperations.h"
#import "AppDelegate.h"
#import "paymentViewController.h"
@interface MyBasketViewController ()

@end

@implementation MyBasketViewController
@synthesize mytableview;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    arr=[[NSMutableArray alloc]init];
    NSDateFormatter *df  = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *d = [[NSDate alloc]init];
    
    NSString *dtstring =[NSString stringWithFormat:@"%@",[df stringFromDate:d]];
    
    
    NSString *str=[[NSString alloc]initWithFormat:@"select Oid,pkSMid,qty,smImg,smName,smPrice,(qty * smPrice) as total from food_order as fo inner join SMenu as sm on fo.fkCid = sm.pkSMid where fo.orderdate='%@' and fkSMid='12dit005@nirmauni.ac.in'",dtstring];
    
    NSLog(@"Today date is %@",str);
    
    
    arrSmenu=[[NSMutableArray alloc]init];
    Dataoperations *dt=[[Dataoperations alloc]init];
    arrSmenu=[dt GetCartValue:str];
    int i=(int)arrSmenu.count;
    if (i!=0) {
        NSLog(@"%@",[arrSmenu description]);
    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Basket is empty!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];
        
    }
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSmenu.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BasketTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell!=nil) {
        cell=[[BasketTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }UIImageView *imgVw=[[UIImageView alloc]initWithFrame:CGRectMake(125, 5, 40, 40)];
    
    imgVw.image=[UIImage imageNamed:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smImg"]];
    cell.imageView.image=[UIImage imageNamed:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smImg"]];
    
    
    
    UILabel  *name1= [[UILabel alloc]initWithFrame:CGRectMake(113, 5, 160, 40)];
    name1.font=[UIFont boldSystemFontOfSize:16];
    [name1 setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smName"]];
    name1.tag=7;
    [cell addSubview:name1];
    
    
    UILabel  *nameprise= [[UILabel alloc]initWithFrame:CGRectMake(113, 25, 40, 40)];
    nameprise.font=[UIFont boldSystemFontOfSize:12];
    NSString *strPrice = [NSString stringWithFormat:@"%@ x ",[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smPrice"]];
    nameprise.text=strPrice;
    
    [cell addSubview:nameprise];
    
    
    //UILabel  *total= [[UILabel alloc]initWithFrame:CGRectMake(128, 25, 40, 40)];
    //total.font=[UIFont boldSystemFontOfSize:12];
   // NSString *strtotal = [NSString stringWithFormat:@"%@ x ",[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"total"]];
    //nameprise.text=strtotal;
    
    //[cell addSubview:total];
    
    
    UILabel  *lblinc= [[UILabel alloc]initWithFrame:CGRectMake(145, 25, 40, 40)];
    lblinc.font=[UIFont boldSystemFontOfSize:12];
    [lblinc setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"qty"]];
    //NSString *strelbl = [NSString stringWithFormat:@"%@ = ",[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"qty"]];
    //nameprise.text=strelbl;
    
    [cell addSubview:lblinc];
    
    //lblinc.text=@"0";
    lblinc.tag=10;
    [cell addSubview:lblinc];
    
    /*
     UILabel  *total= [[UILabel alloc]initWithFrame:CGRectMake(170, 25, 40, 40)];
     nameprise.font=[UIFont boldSystemFontOfSize:12];
     //[nameprise setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smPrice"]];
     NSString *strtotal = [NSString stringWithFormat:@"%@ /-",[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"total"]];
     nameprise.text=strtotal;
     
     [cell addSubview:total];
     */
    UIButton  *btn= [[UIButton alloc]initWithFrame:CGRectMake(222, 40, 112, 40)];
    btn.font=[UIFont boldSystemFontOfSize:14];
    [btn setTitle:@"Remove" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag=indexPath.row;
    [cell addSubview:btn];
    
    
    return cell;
    
}

//SELECT ID FROM TBLNAME ORDER BY ID DESC

-(void)btnClick:(UIButton *)sender
{
    
    // Dataoperations *dd = [[Dataoperations alloc]init];
    
    //NSString *str1= @"select Oid from order by Oid desc";
    arr=[[NSMutableArray alloc]init];
    
    //oid,uEmail,fkSmid,qty,total
    
    NSString *FID = [[arrSmenu objectAtIndex:sender.tag]objectForKey:@"pkSMid"];
    
    NSLog(@"%@",FID);
    
    UITableViewCell *currentCell = [self.mytableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag inSection:0]];
    UILabel *lblQ= (UILabel *)[currentCell viewWithTag:10];
    
    
    Dataoperations *data=[[Dataoperations alloc]init];
    NSString *str=[[NSString alloc]initWithFormat:@"delete from food_order where fkCid=%@",FID];
    
    
    
    BOOL result=[data DMLOperation:str];
    if (result==true)
    {
        UIAlertView *objalert = [[UIAlertView alloc]initWithTitle:@"Status" message:@"Are you sure delete this item?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        objalert.tag=1;
        [objalert show];
        
        [self.mytableview reloadData];
        
        
    }
    else
    {
        UIAlertView *objalrt123 = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Failed To Remove Item" delegate:self cancelButtonTitle:@"cancel"otherButtonTitles:@"ok", nil];
        objalrt123.tag=2;
        [objalrt123 show];
    }
    [mytableview reloadData];
    
    
}
-(void)stepperTapped:(UIStepper *)sender
{
    
    NSMutableDictionary *newDic = [[NSMutableDictionary alloc]init];
    NSDictionary *oldDic = (NSDictionary *)[arrSmenu objectAtIndex:sender.tag];
    [newDic addEntriesFromDictionary:oldDic];
    
    NSString *strNo = [[NSString alloc]initWithFormat:@"%.0f",sender.value];
    
    [newDic setObject:strNo forKey:@"slQTY"];
    [arrSmenu replaceObjectAtIndex:sender.tag withObject:newDic];
    [self.mytableview reloadData];
    
    
    
}
-(void)buttondecPressed
{
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)btnBck:(id)sender
{
    MainMenuViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"mainmenu"];
    [self.navigationController pushViewController:back animated:YES];

}

- (IBAction)btnOrder:(id)sender
{
    /*UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Order" message:@"Plz select any one!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Case on del", @"Online Payment", nil];
    
    [alert show];*/
    
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"Order" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Cash on del" otherButtonTitles:@"Paypal Payment", nil];
    
    [action showInView:self.view];
    
}

- (IBAction)btnOr:(id)sender
{
    OrderViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"ordermenu"];
    [self.navigationController pushViewController:back animated:YES];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"MSG" message:@"Your bill is sent to mail!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        alert.tag=6;
    }
    if(buttonIndex==1)
    {
        paymentViewController *payment=[self.storyboard instantiateViewControllerWithIdentifier:@"paypal"];
        [self.navigationController pushViewController:payment animated:YES];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertView *alert;
    if (alert.tag==6) {
        
    
    if (buttonIndex==1)
    {
        ThankYouOrderingViewController *thank=[self.storyboard instantiateViewControllerWithIdentifier:@"thankyou"];
        [self.navigationController pushViewController:thank animated:YES];
    }
    }}
@end
