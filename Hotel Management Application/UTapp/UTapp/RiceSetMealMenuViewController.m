//
//  RiceSetMealMenuViewController.m
//  UTapp
//
//  Created by MAC on 4/23/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "RiceSetMealMenuViewController.h"
#import "SetMealMenuViewController.h"
#import "Dataoperations.h"
#import "MainMenuViewController.h"
#import "RiceTableViewCell.h"
#import "MyBasketViewController.h"


@interface RiceSetMealMenuViewController ()

@end

@implementation RiceSetMealMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    app1=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSString *str=[[NSString alloc]initWithFormat:@"select smName,smImg,smQty,smPrice,pkSMid from SMenu where fkMid=333"];
    arrSmenu=[[NSMutableArray alloc]init];
    Dataoperations *dt=[[Dataoperations alloc]init];
    arrSmenu=[dt selectMile:str];
    int i=(int)arrSmenu.count;
    if (i!=0) {
        
        
        
        NSLog(@"%@",[arrSmenu description]);
        
        NSString *str1= @"select Oid from order by Oid desc";
        NSLog(@"%@",app1.OrderID);
        
        
        if([app1.OrderID isEqual:@"0"])
        {
            NSString *str1=@"select Oid from food_order order by Oid desc";
            OID=[dt GetLastOrderID:str1];
            app1.OrderID=[app1.OrderID stringByAppendingFormat:@"%ld",(long)OID];
            NSLog(@"%@",app1.OrderID);
        }
    }
    else
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Not Found" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alrt show];
        
    }
    
}

/*- (void)searchTableList {
 NSString *searchString = self.SearchData.text;
 
 NSString *str=[[NSString alloc]initWithFormat:@"select smName from SMenu where smName='%@'",searchString];
 //NSLog(@"%@",searchString);
 
 Dataoperations *dd = [Dataoperations new];
 [arrSmenu removeAllObjects];
 arrSmenu = [dd SearchMile:str];
 NSLog(@"%@",arrSmenu);
 
 for (NSString *tempStr in filteredContentList) {
 NSComparisonResult result = [tempStr compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchString length])];
 if (result == NSOrderedSame) {
 [filteredContentList addObject:tempStr];
 }
 }
 }*/

#pragma mark - Search Implementationhe

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    isSearching = YES;
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%@",searchBar.text);
    [arrSmenu removeAllObjects];
    NSString *Str=[[NSString alloc]initWithFormat:@"select smName,smImg,smQty,smPrice from SMenu where smName='%@'" ,searchBar.text];
    Dataoperations *dd = [Dataoperations new];
    arrSmenu = [dd SearchMile:Str];
    NSLog(@"%@",arrSmenu);
    [_mytableview reloadData];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSmenu.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RiceTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell!=nil) {
        cell=[[RiceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    /* cell.lblname.text=[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smName"];
     //cell.lblprise.text=[[arrSmenu objectAtIndex:indexPath.row]objectAtIndex:@"smPrice"];
     cell.lblqty.text=[[arrSmenu objectAtIndex:indexPath.row]objectForKey:@"smQty"];
     cell.imgview.image=[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smImg"];
     */
    
    //UIImageView *imgVw = (UIImageView *)[cell viewWithTag:200];
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
    
    NSString *strPrice = [NSString stringWithFormat:@"%@ /-",[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smPrice"]];
    nameprise.text=strPrice;
    
    [cell addSubview:nameprise];
    
    
    UILabel  *lblqty= [[UILabel alloc]initWithFrame:CGRectMake(113, 45, 60, 40)];
    lblqty.font=[UIFont boldSystemFontOfSize:12];
    [lblqty setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smQty"]];
    [cell addSubview:lblqty];
    
    
    UILabel  *lblinc= [[UILabel alloc]initWithFrame:CGRectMake(268, 32, 40, 40)];
    lblinc.font=[UIFont boldSystemFontOfSize:12];
    [lblinc setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"slQTY"]];
    
    //lblinc.text=@"0";
    lblinc.tag=10;
    [cell addSubview:lblinc];
    
    UIButton  *btn= [[UIButton alloc]initWithFrame:CGRectMake(220, 5, 110, 40)];
    btn.font=[UIFont boldSystemFontOfSize:12];
    [btn setTitle:@"Add to Basket" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag=indexPath.row;
    [cell addSubview:btn];
    
    
    
    
    stepper = [[UIStepper alloc] initWithFrame:(CGRect){{225, 60}, 20, 20}];
    [stepper addTarget:self action:@selector(stepperTapped:) forControlEvents:UIControlEventValueChanged];
    stepper.tag = indexPath.row;
    NSString *strSlQTY = [[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"slQTY"];
    
    stepper.value=[strSlQTY doubleValue];
    //stepper.stepValue = 1;
    //stepper.continuous = YES;
    stepper.minimumValue = 0;
    stepper.maximumValue = 10;
    
    [cell.contentView addSubview:stepper];
    //cell.backgroundColor=[UIColor redColor];
    //NSLog(@" Cell Binding Path %ld",(long)indexPath.row);
    return cell;
    
}

//SELECT ID FROM TBLNAME ORDER BY ID DESC

-(void)btnClick:(UIButton *)sender
{
    
    
    arr=[[NSMutableArray alloc]init];
    
    //oid,uEmail,fkSmid,qty,total
    
    NSString *FID = [[arrSmenu objectAtIndex:sender.tag]objectForKey:@"pkSMid"];
    NSLog(@"%@",FID);
    
    
    
    UITableViewCell *currentCell = [self.mytableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag inSection:0]];
    UILabel *lblQ= (UILabel *)[currentCell viewWithTag:10];
    
    
    Dataoperations *data=[[Dataoperations alloc]init];
    /*
     NSDate *crdate=[NSDate date];
     NSDateFormatter *df=[[NSDateFormatter alloc]init];
     [df setDateFormat:@"MMM dd, yyyy"];
     NSString *datestr=[df stringFromDate:crdate];
     NSLog(@"%@", datestr);
     */
    
    NSDateFormatter *df  = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *d = [[NSDate alloc]init];
    
    NSString *dtstring =[NSString stringWithFormat:@"%@",[df stringFromDate:d]];
    
    
    NSString *str=[[NSString alloc]initWithFormat:@"insert into food_order ('Oid','fkSMid','fkCid','qty','orderdate') values('%ld','%@','%@','%@','%@')",(long)OID,app1.strEmail,FID,lblQ.text,dtstring];
    
    //NSString *str=[[NSString alloc]initWithFormat:@"insert into food_order ('Oid','fkSMid','fkCid','qty','total') values('%ld','%@','%@','%@','%@')",(long)OID,app1.strEmail,FID,lblQ.text];
    
    
    
    
    BOOL result=[data DMLOperation:str];
    if (result==true)
    {
        // UIAlertView *objalert = [[UIAlertView alloc]initWithTitle:@"Cart" message:@" A Member Now" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
        //[objalert show];
    }
    else
    {
        UIAlertView *objalrt = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Failed To Insert The Record" delegate:self cancelButtonTitle:@"cancel"otherButtonTitles:@"ok", nil];
        [objalrt show];
    }
    
    
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
    
    
    //[newDic release];
    
    
    /* UITableViewCell *currentCell = [self.mytableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag inSection:0]];
     UILabel *lblQ= (UILabel *)[currentCell viewWithTag:10];
     
     
     [lblQ setText:@"100"];
     //NSLog(@"Value is %@",lblQ.text);
     //NSLog(@"Stepper Value is %f",sender.value);
     [self.mytableview reloadData];
     */
    /*
     UIStepper *St=(UIStepper *)sender;
     
     int fk=St.value;
     NSString *Stt =[[NSString alloc]initWithFormat:@"%i",fk];
     NSLog(@"%@",Stt);
     */
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
    SetMealMenuViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"setmeal"];
    [self.navigationController pushViewController:main animated:YES];

}
- (IBAction)btnCart:(id)sender
{
    MyBasketViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"basket"];
    [self.navigationController pushViewController:main animated:YES];

    
}
@end
