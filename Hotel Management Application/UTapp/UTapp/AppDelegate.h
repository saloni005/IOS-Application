//
//  AppDelegate.h
//  UTapp
//
//  Created by MAC on 4/9/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(retain,nonatomic)NSString *OrderID;
@property(retain,nonatomic)NSMutableArray *arrImg;
@property(retain,nonatomic)NSMutableArray *arrdata;
@property (strong, nonatomic) UIWindow *window;
@property(retain,nonatomic)NSString *strdbpath;
-(void)CopyAnedPasteDB;
@property (retain,nonatomic)NSString *strEmail;
@property (retain,nonatomic)NSMutableArray *Details;

@end


