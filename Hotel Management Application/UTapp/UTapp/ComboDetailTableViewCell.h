//
//  ComboDetailTableViewCell.h
//  UTapp
//
//  Created by MAC on 5/5/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComboDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgview;
@property (weak, nonatomic) IBOutlet UILabel *lblqty;
@property (weak, nonatomic) IBOutlet UILabel *lblprise;
@property (weak, nonatomic) IBOutlet UILabel *lblcount;

@property (weak, nonatomic) IBOutlet UILabel *lblname;

@end
