//
//  paymentViewController.m
//  
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "paymentViewController.h"
#import "ThankYouOrderingViewController.h"
#import "MyBasketViewController.h"
#import "AppDelegate.h"



@interface paymentViewController ()

@end

@implementation paymentViewController
@synthesize scno,accntno;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Payment";
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"paypalbk.jpg"]];
    arrdata1=[[NSArray alloc]initWithObjects:@"HDFC",@"AXIS", @"ICICI",@"CANERA",@"BOB",@"SGB", @"SBI", @"HSBC", @"ING", nil];
    drpbank = [[DropDownBank alloc] initWithArrayData:arrdata1 cellHeight:30 heightTableView:150 paddingTop:-5 paddingLeft:-5 paddingRight:-5 refView:self.btnselectbank animation:BLENDIN1 openAnimationDuration:0 closeAnimationDuration:0];
    drpbank.delegate=self;
    [self.view addSubview:drpbank.view];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnbank:(id)sender {
    [drpbank openAnimation];
}
-(void)dropDownCellSelected1:(NSInteger)returnIndex{
	
    
    NSLog(@"%@",[arrdata1 objectAtIndex:returnIndex]);
    
    self.lblbank.text =[arrdata1 objectAtIndex:returnIndex];
	
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)
    {
        ThankYouOrderingViewController *obj2 =[self.storyboard instantiateViewControllerWithIdentifier:@"thankyou"];
        [self.navigationController pushViewController:obj2 animated:YES];

    }
}
- (IBAction)btnCheckout:(id)sender
{
    
    if (accntno.text.length==0)
     {
     
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Account no missing!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
     [alert show];
     
     }
    
    else
    {
   UIAlertView *objalrt = [[UIAlertView alloc] initWithTitle:@"Payment" message:@"Amount successfully withdrawed!" delegate:self cancelButtonTitle:@"cancel"otherButtonTitles:@"ok", nil];
    [objalrt show];
        
    }
}

- (IBAction)btnBack:(id)sender
{
    MyBasketViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"basket"];
    [self.navigationController pushViewController:back animated:YES];

}
@end
