//
//  AboutUsViewController.h
//  UTapp
//
//  Created by MAC on 4/12/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface AboutUsViewController : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *AUImage;
@property (weak, nonatomic) IBOutlet UIImageView *AULogo;
@property (weak, nonatomic) IBOutlet UITextView *TA1;
@property (weak, nonatomic) IBOutlet UITextView *TA2;
@property (weak, nonatomic) IBOutlet UITextView *TA3;
- (IBAction)cback:(id)sender;
- (IBAction)playvdo:(id)sender;

@end
