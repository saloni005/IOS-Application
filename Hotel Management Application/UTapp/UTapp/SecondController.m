//
//  SecondController.m
//  HospitalMAPS
//
//  Created by mac on 5/7/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import "SecondController.h"
#import "HomeMenuViewController.h"

@interface SecondController ()

@end

@implementation SecondController
@synthesize mymap,SelectedLocation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


/*
 
 arrLocation=[[NSArray alloc]initWithObjects:@"Ahemedabad",@"Baroda",@"Bharuch",@"",@"Surat",@"Junagadh",@"Rajkot",@"Mumbai", nil];
 */


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    Arrlocation = [[NSArray alloc] initWithObjects:@"23.0333,72.6167",
                   @"24.0333,73.6167", @"22.0333,75.6167", nil];
    [mymap setDelegate:self];
    
    CLLocationManager *locManager =[[CLLocationManager alloc] init];
    [locManager setDelegate:self];
    [locManager startUpdatingLocation];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self showannotation];
}
- (IBAction)home:(id)sender
{
    HomeMenuViewController *home=[self.storyboard instantiateViewControllerWithIdentifier:@"hmenu"];
    [self.navigationController pushViewController:home animated:YES];
}

- (IBAction)contect:(id)sender
{
    UIAlertView *objalrt = [[UIAlertView alloc] initWithTitle:@"Contact Us" message:@"For any inquiry call on 079-27574439 \n (eurbantadka@gmail.com)" delegate:self cancelButtonTitle:@"cancel"otherButtonTitles:@"ok", nil];
    [objalrt show];
    
}

-(void)showannotation
{
    [self.mymap removeAnnotations:[self.mymap annotations]];
    int i = 1;
    for (NSString *strLoc in Arrlocation) {
        NSString *strLat = [[strLoc componentsSeparatedByString:@","] objectAtIndex:0];
        NSString *strLong = [[strLoc componentsSeparatedByString:@","] objectAtIndex:1];
        
        CLLocation *loc =[[CLLocation alloc] initWithLatitude:[strLat doubleValue] longitude:[strLong doubleValue]];
        MyAnnotation *annotation = [[MyAnnotation alloc] initWithTitle:[NSString stringWithFormat:@"UT Branch %i",i] andCoordinate:loc.coordinate];
        [self.mymap addAnnotation:annotation];
        i++;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
