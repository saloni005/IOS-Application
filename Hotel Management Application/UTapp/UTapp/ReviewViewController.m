//
//  ReviewViewController.m
//  UTapp
//
//  Created by MAC on 4/11/15.
//  Copyright (c) 2015 iphone. All rights reserved.
//

#import "ReviewViewController.h"
#import "HomeMenuViewController.h"
#import "AppDelegate.h"
#import "Dataoperations.h"

@interface ReviewViewController ()

@end

@implementation ReviewViewController
@synthesize btnlist,lbltext, txtemail,txtsubject,txtdescription,txtprice,txtquality,txtservice;

- (void)viewDidLoad {
    /*[super viewDidLoad];
     arrlist=[[NSArray alloc]initWithObjects:@"SBI",@"HDFC", @"Axis",@"BOI",@"Central",@"ADC", @"Dena Bank", @"BOB" , nil];
    drplist = [[DropDownBank alloc] initWithArrayData:arrlist cellHeight:30 heightTableView:150 paddingTop:-5 paddingLeft:-5 paddingRight:-5 refView:self.btnlist animation:BLENDIN1 openAnimationDuration:0 closeAnimationDuration:0];
    drplist.delegate=self;
    [self.view addSubview:drplist.view];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnselect:(id)sender {
    [drplist openAnimation];
}
- (IBAction)eBack:(id)sender
{
    
    HomeMenuViewController *back=[self.storyboard instantiateViewControllerWithIdentifier:@"hmenu"];
    [self.navigationController pushViewController:back animated:YES];
}

- (IBAction)btnred:(UIButton *)sender
{
    //sender.backgroundColor = [UIColor redColor];
    //[sender setImage:[UIImage imageNamed:@"my star.png"]];
    
    UIButton *btn=(UIButton *)sender;
    [btn setBackgroundImage:[UIImage imageNamed:@"my star.png"] forState:UIControlStateNormal];
    
    //lbl_output.text=[NSString stringWithFormat:@"%d",(int)[sender value]];
    
}

- (IBAction)btn2:(UIButton *)sender
{
    UIButton *btn=(UIButton *)sender;
    [btn setBackgroundImage:[UIImage imageNamed:@"my star.png"] forState:UIControlStateNormal];
}

- (IBAction)btn3:(UIButton *)sender
{
    UIButton *btn=(UIButton *)sender;
    [btn setBackgroundImage:[UIImage imageNamed:@"my star.png"] forState:UIControlStateNormal];
}

- (IBAction)btn4:(UIButton *)sender
{
    UIButton *btn=(UIButton *)sender;
    [btn setBackgroundImage:[UIImage imageNamed:@"my star.png"] forState:UIControlStateNormal];
}

- (IBAction)btn5:(UIButton *)sender
{
    UIButton *btn=(UIButton *)sender;
    [btn setBackgroundImage:[UIImage imageNamed:@"my star.png"] forState:UIControlStateNormal];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [maildata setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [maildata appendData:data];
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    currentConnection = nil;
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:maildata];
    parser.delegate=self;
    parser.shouldResolveExternalEntities=YES;
    [parser parse];
    
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"start:%@",elementName);
    elementnm=elementName;
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([elementnm isEqualToString:@"SendMailResult"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Status" message:string delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    NSLog(@"Connection Faile!!!");
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Status" message:@"Connection Problem, Plz try again!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    [alert show];
    
    currentConnection = nil;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (IBAction)btnSubmit:(id)sender
{
    
    int i=0;
    
    if([self.btn1.backgroundColor isEqual:[UIImage imageNamed:@"my star.png"]])
    {
        i++;
    }
    if([self.btn2.backgroundColor isEqual:[UIImage imageNamed:@"my star.png"]])
    {
        i++;
    }

    if([self.btn3.backgroundColor isEqual:[UIImage imageNamed:@"my star.png"]])
    {
        i++;
    }

    if([self.btn4.backgroundColor isEqual:[UIImage imageNamed:@"my star.png"]])
    {
        i++;
    }

    if([self.btn5.backgroundColor isEqual:[UIImage imageNamed:@"my star.png"]])
    {
        i++;
    }
    
    NSLog(@"%d",i);

    
    NSString *mailmsg=[NSString stringWithFormat:@"Rates by user: %d <br/>Price: %@ <br/>Quality: %@ <br/>Service: %@ <br/>%@ <br/>",i,txtprice.text,txtquality.text,txtservice,txtdescription.text];
    
        NSString *soapstring=[[NSString alloc]initWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><SendMail xmlns=\"http://tempuri.org/\"><SenderEmailID>eurbantadka@gmail.com</SenderEmailID><SenderPassword>saloni12345</SenderPassword><ReceiverEmailID>%@</ReceiverEmailID><Subject>%@</Subject><MailBody>%@</MailBody></SendMail></soap:Body></soap:Envelope>",txtemail.text,txtsubject.text,txtdescription.text];
    
    NSURL *url=[[NSURL alloc]initWithString:@"http://iphonemailservice.apphb.com/MailService.asmx?op=SendMail"];
    
    NSString *getlength=[[NSString alloc]initWithFormat:@"%lu",(unsigned long)soapstring.length];
    
    NSMutableURLRequest *req=[[NSMutableURLRequest alloc]initWithURL:url];
    [req setValue:@"iphonemailservice.apphb.com" forHTTPHeaderField:@"Host"];
    [req setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req setValue:getlength forHTTPHeaderField:@"Content-Length"];
    [req setValue:@"http://tempuri.org/SendMail" forHTTPHeaderField:@"SOAPAction"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[soapstring dataUsingEncoding:NSUTF8StringEncoding]];
    
    currentConnection=[[NSURLConnection alloc]initWithRequest:req delegate:self];
    if(currentConnection)
    {
        maildata=[[NSMutableData alloc]init];
    }
    

}
@end
