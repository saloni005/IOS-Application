//
//  RiceTableViewCell.h
//  UTapp
//
//  Created by MAC on 4/24/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RiceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgview;
@property (weak, nonatomic) IBOutlet UILabel *lblqty;
@property (weak, nonatomic) IBOutlet UILabel *lblprise;
- (IBAction)btnincrement:(id)sender;
- (IBAction)btndecrement:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblcount;

@property (weak, nonatomic) IBOutlet UILabel *lblname;

@end
