//
//  NutrientViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 27/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "NutrientViewController.h"

@interface NutrientViewController (){
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UITableView *nutrientTableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *nutrientTableViewCustomCell_iPhone;
@property (strong, nonatomic) IBOutlet UITableViewCell *nutrientTableViewCustomCell_iPad;
@property (weak, nonatomic) IBOutlet UILabel *nutrientLabel;
- (IBAction)backBtnOnClicked:(id)sender;
- (IBAction)messageBtnOnClicked:(id)sender;
- (IBAction)profileBtnOnClicked:(id)sender;
- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)menu_Event:(id)sender;
- (IBAction)menuBack_Event:(id)sender;
//Custom properties
@property (nonatomic, strong) NSArray *codeArray;
@property (nonatomic, strong) NSArray *typeArray;
@property (nonatomic, strong) NSArray *unitArray;
@property (nonatomic, strong) NSArray *nutrientArray;
@property (weak, nonatomic) IBOutlet UIView *menuView;
- (IBAction)menuBtnOnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *unitLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;


@end

@implementation NutrientViewController

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
        [appDelegate loadBottomBar:self :2];
    _codeArray = [[NSArray alloc]initWithObjects:@"5",@"12",@"9",@"18",@"19",@"14",@"26",@"35",@"39",@"42",@"46",
                  @"23", nil];
    _typeArray = [[NSArray alloc]initWithObjects:@"Vitamins",@"Vitamins",@"Vitamins",@"Protien",@"Protien",@"Protien",@"Protien", @"",@"Minerals",@"Protien",@"Protien",@"Protien", nil];
    _unitArray = [[NSArray alloc]initWithObjects:@"KIU/Kg",@"Ug/Kg",@"KIU/Kg",@"%",@"%",@"%",@"%",@"%",@"%",@"mg/kg",@"mg/kg",@"%", nil];
    _nutrientArray = [[NSArray alloc]initWithObjects:@"Vitamin A",@"Vitamin B-12",@"Vitamin D",@"Valine",@"Protein",@"Tyrosine",@"Tryptophan",@"Sulphur",@"Sodium",@"Thiamin",@"RiboFlavin",@"Serine", nil];
    // Do any additional setup after loading the view from its nib.
}
#pragma Mark - TableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
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
            [[NSBundle mainBundle] loadNibNamed:@"NutrientViewControllerCustomCell_iPhone" owner:self options:nil];
            cell = self.nutrientTableViewCustomCell_iPhone;
            self.nutrientTableViewCustomCell_iPhone = nil;
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg.png"]];
        }else{
            [[NSBundle mainBundle] loadNibNamed:@"NutrientViewControllerCustomCell_iPad" owner:self options:nil];
            cell = self.nutrientTableViewCustomCell_iPad;
            self.nutrientTableViewCustomCell_iPad = nil;
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg_iPad.png"]];
        }
    }
        
        self.codeLabel.text = [self.codeArray objectAtIndex:indexPath.row ];
        self.typeLabel.text = [self.typeArray objectAtIndex:indexPath.row ];
        self.unitLabel.text = [self.unitArray objectAtIndex:indexPath.row ];
        self.nutrientLabel.text = [self.nutrientArray objectAtIndex:indexPath.row ];
    return cell;
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

- (IBAction)messageBtnOnClicked:(id)sender {
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
