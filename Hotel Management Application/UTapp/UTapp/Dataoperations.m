//
//  Dataoperations.m
//  UTapp
//
//  Created by MAC on 4/14/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "Dataoperations.h"

@implementation Dataoperations
@synthesize dbname;


-(id)init
{
    if (self=[super init]) {
        appdel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        self.dbname=[[NSString alloc]initWithString:appdel.strdbpath];
    }
    return self;
}

-(NSString *)CheckEmail:(NSString *)Query
{
    NSString *status=@"";
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",Query);
        if (sqlite3_prepare_v2(database, [Query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            sqlite3_step(compilestmt);
            status=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 0)];
            
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    return status;
}


-(BOOL)DMLOperation:(NSString *)query
{
    BOOL status=false;
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",query);
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            sqlite3_step(compilestmt);
            status=true;
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    return status;
}
-(NSString *)GetLogin:(NSString *)query
{
    NSString *cuser=[[NSString alloc]init];
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",query);
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            while (sqlite3_step(compilestmt)==SQLITE_ROW) {
                cuser=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 0)];
            }
            
            
            
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    return cuser;
    
}


-(NSMutableArray *)SearchMile:(NSString *)query
{
    NSMutableArray *cuser=[[NSMutableArray alloc]init];
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",query);
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            while (sqlite3_step(compilestmt)==SQLITE_ROW)
                
            {
                NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
                NSString *smName=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 0)];
                NSString *smQty=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 2)];
                NSString *smPrice=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 3)];
                NSString *smImg=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 1)];
                NSString *slQTY = @"0";
                [dictionary setObject:smName forKey:@"smName"];
                [dictionary setObject:smQty forKey:@"smQty"];
                [dictionary setObject:smPrice forKey:@"smPrice"];
                [dictionary setObject:smImg forKey:@"smImg"];
                [dictionary setObject:slQTY forKey:@"slQTY"];
                [cuser addObject:dictionary];
                
            }
            
            
            
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    return cuser;
    
}
-(NSMutableArray *)Order:(NSString *)query
{
    NSMutableArray *cuser=[[NSMutableArray alloc]init];
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",query);
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            while (sqlite3_step(compilestmt)==SQLITE_ROW)
                
            {
                NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
                NSString *Oid=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 0)];
                NSString *fkSMid=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 1)];
                NSString *fkCid=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 2)];
                NSString *qty=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 3)];
                
               // NSString *slQTY = @"0";
                [dictionary setObject:Oid forKey:@"Oid"];
                [dictionary setObject:fkSMid forKey:@"fkSMid"];
                [dictionary setObject:fkCid forKey:@"fkCid"];
                [dictionary setObject:qty forKey:@"qty"];
                //[dictionary setObject:slQTY forKey:@"slQTY"];
                [cuser addObject:dictionary];
                
            }
            
            
            
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    return cuser;
    
}



-(NSInteger)GetLastOrderID:(NSString *)query
{
    NSMutableArray *cuser=[[NSMutableArray alloc]init];
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",query);
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            while (sqlite3_step(compilestmt)==SQLITE_ROW)
                
            {
                NSString *smid=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 0)];
                NSLog(@"%@",smid);
                [cuser addObject:smid];
                
            }
            
            
            
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    NSString *ss;
    if(cuser.count!=0)
    {
        ss= [cuser objectAtIndex:0];
    }
    if([ss isEqual:@""] && cuser.count==0)
    {
        return 1;
    }else
    {
        NSInteger i = [ss intValue];
        i=i+1;
        return i;
    }
    
    //return cuser;
    
}



-(NSMutableArray *)selectMile:(NSString *)query
{
    NSMutableArray *cuser=[[NSMutableArray alloc]init];
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",query);
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            while (sqlite3_step(compilestmt)==SQLITE_ROW)
                
            {
                NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
                NSString *smName=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 0)];
                NSString *smQty=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 2)];
                NSString *smPrice=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 3)];
                NSString *smImg=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 1)];
                NSString *smMid=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 4)];
                //NSString *orderdate=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 5)];
                //fkMid
                
                NSString *slQTY = @"0";
                [dictionary setObject:smName forKey:@"smName"];
                [dictionary setObject:smQty forKey:@"smQty"];
                [dictionary setObject:smPrice forKey:@"smPrice"];
                [dictionary setObject:smImg forKey:@"smImg"];
                [dictionary setObject:slQTY forKey:@"slQTY"];
                [dictionary setObject:smMid forKey:@"pkSMid"];
                //[dictionary setObject:orderdate forKey:@"orderdate"];
                [cuser addObject:dictionary];
                
            }
            
            
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    return cuser;
    
}


-(NSMutableArray *)GetCartValue:(NSString *)query
{
    NSMutableArray *cuser=[[NSMutableArray alloc]init];
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",query);
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            while (sqlite3_step(compilestmt)==SQLITE_ROW)
                
            {
                NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
                NSString *smName=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 4)];
                NSString *smPrice=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 5)];
                
                NSString *qty=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 2)];
                
                NSString *smImg=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 3)];
                NSString *Oid=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 0)];
                NSString *total=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 6)];
                NSString *pkSMid=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 1)];
                
                [dictionary setObject:Oid forKey:@"Oid"];
                [dictionary setObject:smImg forKey:@"smImg"];
                [dictionary setObject:smName forKey:@"smName"];
                [dictionary setObject:smPrice forKey:@"smPrice"];
                [dictionary setObject:qty forKey:@"qty"];
                [dictionary setObject:total forKey:@"total"];
                [dictionary setObject:pkSMid forKey:@"pkSMid"];
                
                
                [cuser addObject:dictionary];
                
            }
            
            
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    return cuser;
    
}


-(NSMutableArray *)GetProfile:(NSString *)query
{
    NSMutableArray *cuser=[[NSMutableArray alloc]init];
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",query);
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            while (sqlite3_step(compilestmt)==SQLITE_ROW)
                
            {
                //NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
                NSString *uFname=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 2)];
                NSString *uLname=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 3)];
                NSString *uAddress=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 4)];
                NSString *uNumber=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 6)];
                //[dictionary setObject:smName forKey:@"smName"];
                // [dictionary setObject:smQty forKey:@"smQty"];
                //[dictionary setObject:smPrice forKey:@"smPrice"];
                //[dictionary setObject:smImg forKey:@"smImg"];
                NSLog(@"%@",uFname);
                [cuser addObject:uFname];
                [cuser addObject:uLname];
                [cuser addObject:uAddress];
                [cuser addObject:uNumber];
                
            }
            NSLog(@"%@",cuser);
            
            
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    return cuser;
    
}
/*Method
-(NSMutableArray *)ForPass:(NSString *)query
{
    //NSMutableArray *cuser=[[NSMutableArray alloc]init];
    if (sqlite3_open([dbname UTF8String], &database)==SQLITE_OK) {
        sqlite3_stmt *compilestmt;
        
        NSLog(@"%@",query);
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &compilestmt, nil)==SQLITE_OK) {
            while (sqlite3_step(compilestmt)==SQLITE_ROW)
                
            {
                //NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
                NSString *uPass=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(compilestmt, 2)];
                NSLog(@"%@",uPass);
                //[cuser addObject:uFname];
                //[cuser addObject:uLname];
                //[cuser addObject:uAddress];
                //[cuser addObject:uNumber];
                
            }
            NSLog(@"%@",uPass);
            
            
        }
        sqlite3_finalize(compilestmt);
    }
    sqlite3_close(database);
    return uPass;
    
}

*/



@end
