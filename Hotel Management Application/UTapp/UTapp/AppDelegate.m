//
//  AppDelegate.m
//  UTapp
//
//  Created by MAC on 4/9/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize strdbpath,arrdata,strEmail,arrImg,OrderID;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self CopyAnedPasteDB];
    OrderID=@"0";
    return YES;
}
-(void)CopyAnedPasteDB
{
    
    NSArray *arrdoc=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str=[arrdoc objectAtIndex:0];
    self.strdbpath=[str stringByAppendingPathComponent:@"UT.db"];
    if (![[NSFileManager defaultManager]fileExistsAtPath:self.strdbpath]) {
        NSString *localdb=[[NSString alloc]initWithString:[[NSBundle mainBundle]pathForResource:@"UT" ofType:@"db"]];
        [[NSFileManager defaultManager]copyItemAtPath:localdb toPath:strdbpath error:nil];
    }
    NSLog(@"%@",strdbpath);
}
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
