//
//  VideosViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 26/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "VideosViewController.h"
#import "VideosDetailedViewController.h"
#import "MPMovieViewController.h"
@interface VideosViewController (){
    AppDelegate *appDelegate;
}
- (IBAction)backBtnOnClicked:(id)sender;
- (IBAction)emailBtnOnclicked:(id)sender;
- (IBAction)profileBtnOnClicked:(id)sender;
- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)menu_Event:(id)sender;
- (IBAction)menuBack_Event:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *menuView;
- (IBAction)menuBtnOnClicked:(id)sender;
- (IBAction)videoBtnOnClicked:(id)sender;
- (IBAction)videoInfoBtnOnClicked:(id)sender;
@property (strong, nonatomic) NSURL *videoURL;
@end

@implementation VideosViewController

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
        [appDelegate loadBottomBar:self :5];
    // Do any additional setup after loading the view from its nib.
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
#pragma mark button actions
- (IBAction)backBtnOnClicked:(id)sender {
        [self.navigationController popToViewController:appDelegate.homeViewController animated:YES];
}

- (IBAction)emailBtnOnclicked:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailComposerVC = [[MFMailComposeViewController alloc] init];
        mailComposerVC.mailComposeDelegate = self;
        [self presentViewController:mailComposerVC animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Sorry, Your device doesn’t support the composer sheet" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)profileBtnOnClicked:(id)sender {
}

- (IBAction)logoutBtnOnClicked:(id)sender {
    [appDelegate showTheLogoutAlert];
}

- (IBAction)menu_Event:(id)sender {
    [UIView animateWithDuration:0.75 animations:^{
        self.menuView.frame = CGRectMake(0,104, 138, 539);
    } completion:^(BOOL finished){
    }];
}

- (IBAction)menuBack_Event:(id)sender {
    [UIView animateWithDuration:0.75 animations:^{
        self.menuView.frame = CGRectMake(-140, 104, 138, 539);
    } completion:^(BOOL finished){
    }];
}

- (IBAction)menuBtnOnClicked:(id)sender {
    UIButton *temp=(UIButton*)sender;
    [appDelegate bottomButtonAction:temp];
    
}

- (IBAction)videoBtnOnClicked:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"video" ofType:@"mp4" inDirectory:nil];// video_1
    NSURL* movieURL = [NSURL fileURLWithPath:path];
    
    
    MPMovieViewController * controller = [[MPMovieViewController alloc] initWithContentURL:movieURL];
    [self presentMoviePlayerViewControllerAnimated:controller];
    [controller.moviePlayer play];
    
}

#pragma mark - UIInterfaceOrientation Delegate methods

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    
}

-(BOOL)shouldAutorotate {
    return YES;
    
}


-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait| UIInterfaceOrientationMaskPortraitUpsideDown | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;    
}

- (IBAction)videoInfoBtnOnClicked:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        VideosDetailedViewController *videoDetailedVC = [[VideosDetailedViewController alloc]initWithNibName:@"VideosDetailedViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:videoDetailedVC animated:YES];
    }else{
        VideosDetailedViewController *videoDetailedVC = [[VideosDetailedViewController alloc]initWithNibName:@"VideosDetailedViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:videoDetailedVC animated:YES];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
