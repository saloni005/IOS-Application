//
//  Dataoperations.h
//  UTapp
//
//  Created by MAC on 4/14/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "AppDelegate.h"

@interface Dataoperations : NSObject
{
    AppDelegate *appdel;
    sqlite3 *database;
}

@property(retain,nonatomic)NSString *dbname;
-(NSString *)CheckEmail:(NSString *)Query;

-(BOOL)DMLOperation:(NSString *)query;
-(NSString *)GetLogin:(NSString *)query;
-(NSMutableArray *)GetProfile:(NSString *)query;
-(NSMutableArray *)selectMile:(NSString *)query;
-(NSMutableArray *)SearchMile:(NSString *)query;
-(NSInteger)GetLastOrderID:(NSString *)query;
-(NSMutableArray *)Order:(NSString *)query;
-(NSMutableArray *)GetCartValue:(NSString *)query;

@end
