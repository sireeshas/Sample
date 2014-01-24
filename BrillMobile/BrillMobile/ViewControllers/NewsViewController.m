//
//  NewsViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 26/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailedViewController.h"

@interface NewsViewController (){
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *newsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsDateLabel;

@property (strong, nonatomic) IBOutlet UITableViewCell *newsTableViewCustomCell_iPad;
@property (strong, nonatomic) IBOutlet UITableViewCell *newsTableViewCustomCell_iPhone;
- (IBAction)backBtnOnClicked:(id)sender;
- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)profileBtnOnClicked:(id)sender;
- (IBAction)emailBtnOnClicked:(id)sender;
- (IBAction)menu_Event:(id)sender;
- (IBAction)menuBack_Event:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *menuView;
- (IBAction)menuBtnOnClicked:(id)sender;

@property (nonatomic, strong) NSArray *newsTitleArray;
@property (nonatomic, strong) NSArray *newsDescArray;
@property (nonatomic, strong) NSArray *newsDateArray;
@property (nonatomic, strong) NSArray *newsImagesArray;
@end

@implementation NewsViewController

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
        [appDelegate loadBottomBar:self :3];
    _newsTitleArray = [[NSArray alloc] initWithObjects:@"Solving problems on",@"Becoming a more", @"Cows should be able", @"Feed additive could", @"News mexico state", nil];
    _newsDescArray = [[NSArray alloc] initWithObjects:@"There are plenty of problems that pop up every day", @"It can be hard to keep a good level in the ", @"While feed ration is a huge expense for businesses", @"Recent studies the leuven university and the university", @"feed manufacturers and farms in areas sufferring from", nil];
    _newsDateArray = [[NSArray alloc] initWithObjects:@"December 11, 2013",@"December 10, 2013",@"December 9, 2013",@"December 5, 2013",@"December 4, 2013",nil];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        _newsImagesArray = [[NSArray alloc] initWithObjects:@"news_img1.png",@"news_img2.png",@"news_img3.png",@"news_img4.png",@"news_img5.png",nil];
    else
        _newsImagesArray = [[NSArray alloc] initWithObjects:@"news_img1_iPad.png",@"news_img2_iPad.png",@"news_img3_iPad.png",@"news_img4_iPad.png",@"news_img5_iPad.png",nil];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.newsTableView reloadData];
    self.navigationController.navigationBarHidden = TRUE;
}
#pragma mark button actions

- (IBAction)backBtnOnClicked:(id)sender {
        [self.navigationController popToViewController:appDelegate.homeViewController animated:YES];
}

- (IBAction)logoutBtnOnClicked:(id)sender {
    [appDelegate showTheLogoutAlert];
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

- (IBAction)menu_Event:(id)sender {
    [UIView animateWithDuration:0.75 animations:^{
        self.menuView.frame = CGRectMake(0, 104, 138, 539);
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
#pragma Mark - TableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        return 120;
    else
        return 127;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CustomCell";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
    if (cell == nil) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
            [[NSBundle mainBundle] loadNibNamed:@"NewsViewControllerCustomCell_iPhone" owner:self options:nil];
            cell = self.newsTableViewCustomCell_iPhone;
            self.newsTableViewCustomCell_iPhone = nil;
        }else{
            [[NSBundle mainBundle] loadNibNamed:@"NewsViewControllerCustomCell_iPad" owner:self options:nil];
            cell = self.newsTableViewCustomCell_iPad;
            self.newsTableViewCustomCell_iPad = nil;
        }
    }
    self.newsTitleLabel.text = [self.newsTitleArray objectAtIndex:indexPath.row ];
    self.newsDescriptionLabel.text = [self.newsDescArray objectAtIndex:indexPath.row];
    self.newsDateLabel.text = [self.newsDateArray objectAtIndex:indexPath.row ];
    self.newsImage.image = [UIImage imageNamed:[self.newsImagesArray objectAtIndex:indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        NewsDetailedViewController *newsDetailedVC = [[NewsDetailedViewController alloc]initWithNibName:@"NewsDetailedViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:newsDetailedVC animated:YES];
    }else{
        NewsDetailedViewController *newsDetailedVC = [[NewsDetailedViewController alloc]initWithNibName:@"NewsDetailedViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:newsDetailedVC animated:YES];
    
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
