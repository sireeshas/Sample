//
//  NewsDetailedViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 26/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "NewsDetailedViewController.h"

@interface NewsDetailedViewController (){
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UIImageView *newsDetailedImageView;
- (IBAction)backBtnOnClicked:(id)sender;
- (IBAction)profileBtnOnClicked:(id)sender;
- (IBAction)emailBtnOnClicked:(id)sender;
- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)menu_Event:(id)sender;
- (IBAction)menuBack_Event:(id)sender;
- (IBAction)menuBtnOnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *newsScrollView;

@property (weak, nonatomic) IBOutlet UIView *menuView;
@end

@implementation NewsDetailedViewController

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
    appDelegate = [AppDelegate delegate];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        [self.newsScrollView setContentSize:CGSizeMake(320, 1100)];
    else
        [self.newsScrollView setContentSize:CGSizeMake(1024, 1100)];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        [appDelegate loadBottomBar:self :3];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark button actions

- (IBAction)backBtnOnClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)profileBtnOnClicked:(id)sender {
}

- (IBAction)emailBtnOnClicked:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        
        MFMailComposeViewController *mailComposerVC = [[MFMailComposeViewController alloc] init];
        mailComposerVC.mailComposeDelegate = self;
        //ToDo : need to design the UI like navigation bar
        //mail should be send
        //need to add the address, subject or any images or any thing in the mail
        [self presentViewController:mailComposerVC animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Sorry, Your device doesn’t support the composer sheet" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    

}

- (IBAction)logoutBtnOnClicked:(id)sender {
    [appDelegate showTheLogoutAlert];
}

- (IBAction)menu_Event:(id)sender {
    [UIView animateWithDuration:0.75 animations:^{
        self.menuView.frame = CGRectMake(0, 104, 138, 539);
    } completion:^(BOOL finished){
    }];
}

- (IBAction)menuBack_Event:(id)sender {
    [UIView animateWithDuration:0.75 animations:^{
        self.menuView.frame = CGRectMake(-140,  104, 138, 539);
    } completion:^(BOOL finished){
    }];
}

- (IBAction)menuBtnOnClicked:(id)sender {
    UIButton *temp=(UIButton*)sender;
    [appDelegate bottomButtonAction:temp];
}
#pragma mark mail actions

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:
(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            break;
        case MFMailComposeResultSaved:
            break;
        case MFMailComposeResultSent:
            break;
        case MFMailComposeResultFailed:
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload {
    [self setNewsDetailedImageView:nil];
    [super viewDidUnload];
}
@end
