//
//  DropDownBank.m
//  SilverSpoon
//
//  Created by tops on 4/2/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "DropDownBank.h"
#import <QuartzCore/QuartzCore.h>

@interface DropDownBank ()

@end

@implementation DropDownBank

@synthesize uiTableView;

@synthesize arrayData,heightOfCell,refView;

@synthesize paddingLeft,paddingRight,paddingTop;

@synthesize open,close;

@synthesize heightTableView;

@synthesize delegate;

- (id)initWithArrayData:(NSArray*)data cellHeight:(CGFloat)cHeight heightTableView:(CGFloat)tHeightTableView paddingTop:(CGFloat)tPaddingTop paddingLeft:(CGFloat)tPaddingLeft paddingRight:(CGFloat)tPaddingRight refView:(UIView*)rView animation:(AnimationType1)tAnimation openAnimationDuration:(CGFloat)openDuration closeAnimationDuration:(CGFloat)closeDuration{
    
	if ((self = [super init])) {
		
		self.arrayData = data;
		
		self.heightOfCell = cHeight;
		
		self.refView = rView;
		
		self.paddingTop = tPaddingTop;
		
		self.paddingLeft = tPaddingLeft;
		
		self.paddingRight = tPaddingRight;
		
		self.heightTableView = tHeightTableView;
		
		self.open = openDuration;
		
		self.close = closeDuration;
		
		CGRect refFrame = refView.frame;
		
		self.view.frame = CGRectMake(refFrame.origin.x-paddingLeft,refFrame.origin.y+refFrame.size.height+paddingTop,refFrame.size.width+paddingRight, heightTableView);
		
		self.view.layer.shadowColor = [[UIColor blackColor] CGColor];
		
		self.view.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
		
		self.view.layer.shadowOpacity =1.0f;
		
		self.view.layer.shadowRadius = 5.0f;
		
		animationType = tAnimation;
		
	}
	
	return self;
	
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect refFrame = refView.frame;
    
	uiTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,refFrame.size.width+paddingRight, (animationType == BOTH1 || animationType == BLENDIN1)?heightTableView:1) style:UITableViewStylePlain];
	
	uiTableView.dataSource = self;
	
	uiTableView.delegate = self;
	
	[self.view addSubview:uiTableView];
	
	self.view.hidden = YES;
	
	if(animationType == BOTH1 || animationType == BLENDIN1)
		[self.view setAlpha:1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return heightOfCell;
	
	
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
	
	return [arrayData count];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
        
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
		
    }
    
	cell.textLabel.text = [arrayData objectAtIndex:indexPath.row];
    
	return cell;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	[delegate dropDownCellSelected1:indexPath.row];
	
	[self closeAnimation];
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
	return 0;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
	return 0;
	
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
	return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
	return @"";
	
}

#pragma mark -
#pragma mark DropDownViewDelegate

-(void)dropDownCellSelected:(NSInteger)returnIndex{
	
}

#pragma mark -
#pragma mark Class Methods


-(void)openAnimation{
	
	self.view.hidden = NO;
	
	NSValue *contextPoint = [NSValue valueWithCGPoint:self.view.center];
	
	[UIView beginAnimations:nil context:(__bridge void *)(contextPoint)];
	
	[UIView setAnimationDuration:open];
	
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	
	[UIView setAnimationRepeatCount:1];
	
	[UIView setAnimationDelay:0];
	
	if(animationType == BOTH1 || animationType == GROW1)
		self.uiTableView.frame = CGRectMake(uiTableView.frame.origin.x,uiTableView.frame.origin.y,uiTableView.frame.size.width, heightTableView);
	
	if(animationType == BOTH1 || animationType == BLENDIN1)
		self.view.alpha = 1;
	
	[UIView commitAnimations];
	
	
	
	
	
}

-(void)closeAnimation{
	
	NSValue *contextPoint = [NSValue valueWithCGPoint:self.view.center];
	
	[UIView beginAnimations:nil context:(__bridge void *)(contextPoint)];
	
	[UIView setAnimationDuration:close];
	
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	
	[UIView setAnimationRepeatCount:1];
	
	[UIView setAnimationDelay:0];
	
	if(animationType == BOTH1 || animationType == GROW1)
		self.uiTableView.frame = CGRectMake(uiTableView.frame.origin.x,uiTableView.frame.origin.y,uiTableView.frame.size.width+150, 1);
	
	if(animationType == BOTH1 || animationType == BLENDIN1)
		self.view.alpha = 0;
	
	[UIView commitAnimations];
	
	[self performSelector:@selector(hideView) withObject:nil afterDelay:close];
	
	
    
}


-(void)hideView{
	
	self.view.hidden = YES;
    
}	 



@end
