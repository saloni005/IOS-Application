//
//  OrderHistoryViewController.m
//  UTapp
//
//  Created by MAC on 5/3/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "OrderHistoryViewController.h"
#import "OrderViewController.h"
#import "ManageProfileViewController.h"
#import "HistoryTableViewCell.h"
#import "Dataoperations.h"
#import "AppDelegate.h"

@interface OrderHistoryViewController ()

@end

@implementation OrderHistoryViewController
@synthesize mytableview;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  AppDelegate *app1=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    // Dataoperations *dd = [[Dataoperations alloc]init];
    arr=[[NSMutableArray alloc]init];
    //select smName,smPrice,smQty from food_order as fo inner join  SMenu as sm on fo.fkCid = sm.pkSMid;
    
    
    //NSString *str=[[NSString alloc]initWithFormat:@"select Oid,fkSMid,fkCid,qty from food_order where fkSMid='%@'",app1.strEmail];
    
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
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"No orders yet!" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"Order now", nil];
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
    
    HistoryTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell!=nil) {
        cell=[[HistoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    /* cell.lblname.text=[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smName"];
     //cell.lblprise.text=[[arrSmenu objectAtIndex:indexPath.row]objectAtIndex:@"smPrice"];
     cell.lblqty.text=[[arrSmenu objectAtIndex:indexPath.row]objectForKey:@"smQty"];
     cell.imgview.image=[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smImg"];
     */
    
    // UIImageView *imgVw = (UIImageView *)[cell viewWithTag:200];
    //imgVw.image=[UIImage imageNamed:@"bajji.jpg"];
    UIImageView *imgVw=[[UIImageView alloc]initWithFrame:CGRectMake(125, 5, 40, 40)];
    
    imgVw.image=[UIImage imageNamed:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smImg"]];
    cell.imageView.image=[UIImage imageNamed:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smImg"]];
    
    
    
    UILabel  *name1= [[UILabel alloc]initWithFrame:CGRectMake(113, 5, 160, 40)];
    name1.font=[UIFont boldSystemFontOfSize:16];
    [name1 setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smName"]];
    name1.tag=7;
    [cell addSubview:name1];
    
    
    UILabel  *nameprise= [[UILabel alloc]initWithFrame:CGRectMake(113, 25, 40, 40)];
    nameprise.font=[UIFont boldSystemFontOfSize:12];
    //[nameprise setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smPrice"]];
    NSString *strPrice = [NSString stringWithFormat:@"%@ x ",[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smPrice"]];
    nameprise.text=strPrice;
    
    [cell addSubview:nameprise];
    
    
    
    UILabel  *lblinc= [[UILabel alloc]initWithFrame:CGRectMake(145, 25, 40, 40)];
    lblinc.font=[UIFont boldSystemFontOfSize:12];
    [lblinc setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"qty"]];
    
    [cell addSubview:lblinc];
    
    lblinc.tag=10;
    [cell addSubview:lblinc];
    
    
    /*stepper = [[UIStepper alloc] initWithFrame:(CGRect){{225, 60}, 20, 20}];
     [stepper addTarget:self action:@selector(stepperTapped:) forControlEvents:UIControlEventValueChanged];
     stepper.tag = indexPath.row;
     NSString *strSlQTY = [[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"qty"];
     
     stepper.value=[strSlQTY doubleValue];
     //stepper.stepValue = 1;
     //stepper.continuous = YES;
     stepper.minimumValue = 0;
     stepper.maximumValue = 10;
     
     [cell.contentView addSubview:stepper];*/
    //cell.backgroundColor=[UIColor redColor];
    //NSLog(@" Cell Binding Path %ld",(long)indexPath.row);
    return cell;
    
}

//SELECT ID FROM TBLNAME ORDER BY ID DESC

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

- (IBAction)btnBack:(id)sender
{
    OrderViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"ordermenu"];
    [self.navigationController pushViewController:back animated:YES];

}

- (IBAction)btnProfile:(id)sender
{
    ManageProfileViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"mnprofile"];
    [self.navigationController pushViewController:back animated:YES];

}
@end
