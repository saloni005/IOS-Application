//
//  StatesSpecialMenuViewController.m
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "StatesSpecialMenuViewController.h"
#import "MainMenuViewController.h"
#import "Dataoperations.h"
#import "StatesSpecialTableViewCell.h"
#import "StatesMenuDetailViewController.h"

@interface StatesSpecialMenuViewController ()

@end

@implementation StatesSpecialMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=[[NSString alloc]initWithFormat:@"select smName,smImg,smQty,smPrice,pkSMid from SMenu where fkMid=3;"];
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
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSmenu.count;
}


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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    StatesSpecialTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell!=nil) {
        cell=[[StatesSpecialTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    UIImageView *imgVw=[[UIImageView alloc]initWithFrame:CGRectMake(125, 5, 40, 40)];
    
    imgVw.image=[UIImage imageNamed:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smImg"]];
    cell.imageView.image=[UIImage imageNamed:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smImg"]];
    
    
    
    UILabel  *name1= [[UILabel alloc]initWithFrame:CGRectMake(116, 5, 200, 40)];
    name1.font=[UIFont boldSystemFontOfSize:18];
    [name1 setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smName"]];
    name1.tag=7;
    [cell addSubview:name1];
    
    
    UILabel  *nameprise= [[UILabel alloc]initWithFrame:CGRectMake(116, 35, 80, 40)];
    nameprise.font=[UIFont boldSystemFontOfSize:14];
    //[nameprise setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smPrice"]];
    NSString *strPrice = [NSString stringWithFormat:@"%@ /-",[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smPrice"]];
    nameprise.text=strPrice;
    
    [cell addSubview:nameprise];
    
    /*UILabel  *lblqty= [[UILabel alloc]initWithFrame:CGRectMake(116, 45, 60, 40)];
     lblqty.font=[UIFont boldSystemFontOfSize:12];
     [lblqty setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smQty"]];
     [cell addSubview:lblqty];*/
    
    
    /* UILabel  *lblinc= [[UILabel alloc]initWithFrame:CGRectMake(260, 25, 40, 40)];
     lblinc.font=[UIFont boldSystemFontOfSize:12];
     [lblinc setText:[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"slQTY"]];
     
     //lblinc.text=@"0";
     lblinc.tag=10;
     [cell addSubview:lblinc];
     
     
     
     stepper = [[UIStepper alloc] initWithFrame:(CGRect){{219, 60}, 20, 20}];
     [stepper addTarget:self action:@selector(stepperTapped:) forControlEvents:UIControlEventValueChanged];
     stepper.tag = indexPath.row;
     //stepper.stepValue = 1;
     //stepper.continuous = YES;
     stepper.minimumValue = 0;
     stepper.maximumValue = 10;
     
     [cell.contentView addSubview:stepper];
     //cell.backgroundColor=[UIColor redColor];
     */
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    StatesMenuDetailViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"stDetail"];
    
    obj.dicTiffin=[arrSmenu objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:obj animated:YES];
    
    // TiffinDetailViewController *obj1=[[TiffinDetailViewController alloc]init];
    
}

/*-(void)stepperTapped:(id)sender
 {
 UIStepper *St=(UIStepper *)sender;
 int fk=St.value;
 NSString *Stt =[[NSString alloc]initWithFormat:@"%i",fk];
 NSLog(@"%@",Stt);
 
 }*/
-(void)buttondecPressed
{
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnBack:(id)sender
{
    MainMenuViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"mainmenu"];
    [self.navigationController pushViewController:main animated:YES];

}
@end
