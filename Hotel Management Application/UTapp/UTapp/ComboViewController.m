//
//  ComboViewController.m
//  UTapp
//
//  Created by MAC on 5/5/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ComboViewController.h"
#import "Dataoperations.h"
#import "ComboDetailTableViewCell.h"
#import "MainMenuViewController.h"
#import "MyBasketViewController.h"
#import "ComboTableViewCell.h"
#import "ComboDetailViewController.h"
#import "MyBasketViewController.h"
#import "SetMealMenuViewController.h"

@interface ComboViewController ()

@end

@implementation ComboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=[[NSString alloc]initWithFormat:@"select smName,smImg,smQty,smPrice,pkSMid from SMenu where fkMid=34;"];
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
    
    ComboTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (cell!=nil) {
        cell=[[ComboTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
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
    NSString *strPrice = [NSString stringWithFormat:@"%@ /-",[[arrSmenu objectAtIndex:indexPath.row] objectForKey:@"smPrice"]];
    nameprise.text=strPrice;
    
    [cell addSubview:nameprise];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    ComboDetailViewController *obj=[self.storyboard instantiateViewControllerWithIdentifier:@"tiffDetail"];
    
    obj.dicTiffin=[arrSmenu objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:obj animated:YES];
    
    
}

-(void)buttondecPressed
{
    
    
    
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


- (IBAction)btnCart:(id)sender
{
    MyBasketViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"mainmenu"];
    [self.navigationController pushViewController:main animated:YES];

}

- (IBAction)btnHome:(id)sender
{
    MyBasketViewController *main=[self.storyboard instantiateViewControllerWithIdentifier:@"basket"];
    [self.navigationController pushViewController:main animated:YES];

}
@end
