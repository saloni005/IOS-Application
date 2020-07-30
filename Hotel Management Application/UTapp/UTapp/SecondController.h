//
//  SecondController.h
//  HospitalMAPS
//
//  Created by mac on 5/7/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"

@interface SecondController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
{
     NSArray *Arrlocation;
}
- (IBAction)home:(id)sender;
- (IBAction)contect:(id)sender;

-(void)showannotation;
@property(nonatomic)NSInteger SelectedLocation;
@property (weak, nonatomic) IBOutlet MKMapView *mymap;

@end
