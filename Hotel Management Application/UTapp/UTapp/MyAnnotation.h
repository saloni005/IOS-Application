//
//  MyAnnotation.h
//  MapViewSample
//
//  Created by mac on 19/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotation : NSObject <MKAnnotation> {
    NSString *title;
    CLLocationCoordinate2D coordinate;
}
@property (strong, nonatomic) NSString *title;
@property (nonatomic) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString*)strTitle andCoordinate:(CLLocationCoordinate2D)coord;

@end
