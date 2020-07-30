//
//  MyAnnotation.m
//  MapViewSample
//
//  Created by mac on 19/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
@synthesize title;
@synthesize coordinate;

- (id)initWithTitle:(NSString*)strTitle andCoordinate:(CLLocationCoordinate2D)coord {
    if (self = [super init]) {
        self.title = strTitle;//[strTitle copy];
        self.coordinate = coord;
    }
    return self;
}
@end
