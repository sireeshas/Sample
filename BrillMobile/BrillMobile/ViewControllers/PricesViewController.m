//
//  PricesViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 24/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "PricesViewController.h"

@interface PricesViewController (){
    AppDelegate *appDelegate;
}
@property (strong, nonatomic) IBOutlet UITableViewCell *pricesTableViewCell_iPhone;
@property (strong, nonatomic) IBOutlet UITableViewCell *pricesTableViewCell_iPad;
@property (weak, nonatomic) IBOutlet UITableView *pricesTableView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong) NSArray *priceArray;
@property (nonatomic, strong) NSArray *nameArray;
@property (nonatomic, strong) NSArray *codeArray;
- (IBAction)backBtnOnClicked:(id)sender;
- (IBAction)emailBtnOnClicked:(id)sender;
- (IBAction)profileBtnOnClicked:(id)sender;
- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)menu_Event:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
- (IBAction)menuBack_Event:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *menuView;
- (IBAction)menuBtnOnClicked:(id)sender;

@end

@implementation PricesViewController

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
        [appDelegate loadBottomBar:self :4];
    _nameArray = [[NSArray alloc] initWithObjects:@"Soybean Meal",@"SoybeanHulls", @"Corn Distillers Grain Modified", @"Distillers Grain Wet", @"Cor condensed Solubles", @"Corn GlutenFeeds", @"Corn Gluten Meal 60pct", @"Cotton Seed Meal", @"Whole Cotton", nil];
    _priceArray = [[NSArray alloc] initWithObjects:@"511.00", @"190.00", @"220.00", @"128.00", @"90.00", @"106.00", @"125.00", @"205.00", @"190.00", nil];
     _codeArray = [[NSArray alloc] initWithObjects:@"103", @"106", @"109", @"111", @"114", @"115", @"117", @"119", @"120", nil];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark button actions
- (IBAction)backBtnOnClicked:(id)sender {
     [self.navigationController popToViewController:appDelegate.homeViewController animated:YES];

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

- (IBAction)profileBtnOnClicked:(id)sender {
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
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        return 43;
    else
        return 76;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CustomCell";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
            [[NSBundle mainBundle] loadNibNamed:@"PricesViewControllerCustomCell_iPhone" owner:self options:nil];
            cell = self.pricesTableViewCell_iPhone;
            self.pricesTableViewCell_iPhone = nil;
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg.png"]];

        }else{
            [[NSBundle mainBundle] loadNibNamed:@"PricesViewControllerCustomCell_iPad" owner:self options:nil];
            cell = self.pricesTableViewCell_iPad;
            self.pricesTableViewCell_iPad = nil;
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg_iPad.png"]];

        }
    }
    self.nameLabel.text = [self.nameArray objectAtIndex:indexPath.row];
    self.priceLabel.text = [self.priceArray objectAtIndex:indexPath.row];
    self.codeLabel.text = [self.codeArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
