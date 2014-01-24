//
//  ReportsViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 24/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "ReportsViewController.h"

@interface ReportsViewController (){
     AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UITableView *reportsTableView;
@property (strong, nonatomic) IBOutlet UITableViewCell *reportsTableViewCustomCell_iPad;
@property (weak, nonatomic) IBOutlet UIButton *ingredientBtn;
@property (weak, nonatomic) IBOutlet UIButton *speciesBtn;
@property (weak, nonatomic) IBOutlet UILabel *codeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *basePriceTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *inStockTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *menuBackBtn;
@property (strong, nonatomic) IBOutlet UITableViewCell *reportsTableViewCustomCell_iPhone;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *basePriceLabel;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UILabel *inStockLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
- (IBAction)menu_Event:(id)sender;
- (IBAction)menuBack_Event:(id)sender;
- (IBAction)menuBtnOnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *menu_EventBtn;

- (IBAction)backBtnOnClicked:(id)sender;
- (IBAction)ingredientPricebtnOnClicked:(id)sender;
- (IBAction)speciesCodeBtnOnClicked:(id)sender;
- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)profileBtnOnClicked:(id)sender;
- (IBAction)messageBtnOnClicked:(id)sender;
//Custom Properties
@property (nonatomic, strong) NSArray *codeArrayIngredient;
@property (nonatomic, strong) NSArray *nameArrayIngredient;
@property (nonatomic, strong) NSArray *codeArraySpecies;
@property (nonatomic, strong) NSArray *nameArraySpecies;
@property (nonatomic, strong) NSArray *typeArray;
@property (nonatomic, strong) NSArray *inStockArray;
@property (nonatomic, strong) NSArray *basePriceArray;
@property (readwrite, nonatomic) BOOL isIngredientSelected;
@end

@implementation ReportsViewController

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
    self.isIngredientSelected = TRUE;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        [appDelegate loadBottomBar:self :0];
    _codeArrayIngredient = [[NSArray alloc]initWithObjects:@"111",@"112",@"113",@"114",@"115",@"116",@"117",@"118", nil];
    _nameArrayIngredient = [[NSArray alloc]initWithObjects:@"Anchovy Meal",@"AlfaAlfa Meal",@"Barlygrain",@"PearlMillet",@"Oats Grain",@"WheatMidds",@"GlutenMeal",@"RiceBran", nil];
    _codeArraySpecies = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15", nil];
    _nameArraySpecies = [[NSArray alloc]initWithObjects:@"Beef,Pasture",@"Dairy,Lactating",@"Swine,Growth-Finish",@"Poultry,Broilers",@"Fish,Aquatic",@"Horses",@"Sheeps,Lambs",@"Rabbits",@"Ducks",@"Quail",@"Pheasant,Patridge",@"Turkeys,Poults",@"Beef,Calves",@"Beef,Heafers",@"Sheep,Breeders", nil];
    
    _typeArray = [[NSArray alloc]initWithObjects:@"Unclassified",@"Unclassified",@"Unclassified",@"Unclassified",@"Unclassified",@"Unclassified",@"Unclassified",@"Unclassified", nil];
    _inStockArray = [[NSArray alloc]initWithObjects:@"Y",@"Y",@"Y",@"Y",@"Y",@"N",@"Y",@"N", nil];
    _basePriceArray = [[NSArray alloc]initWithObjects:@"$190.00",@"$200.00",@"$112.00",@"$109.00",@"$225.00",@"$138.00",@"$231.00",@"$186.00", nil];
    // Do any additional setup after loading the view from its nib.

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.menu_EventBtn setHidden:FALSE];
    self.navigationController.navigationBarHidden = TRUE;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        [self.menuView setHidden:FALSE];
}
#pragma Mark - TableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isIngredientSelected) 
        return [self.codeArrayIngredient count];
    else
        return [self.codeArraySpecies count];
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
            [[NSBundle mainBundle] loadNibNamed:@"ReportsViewControllerCustomCell_iPhone" owner:self options:nil];
            cell = self.reportsTableViewCustomCell_iPhone;
            self.reportsTableViewCustomCell_iPhone = nil;
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg.png"]];

        }else{
            [[NSBundle mainBundle] loadNibNamed:@"ReportsViewControllerCustomCell_iPad" owner:self options:nil];
            cell = self.reportsTableViewCustomCell_iPad;
            self.reportsTableViewCustomCell_iPad = nil;
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg_iPad.png"]];

        }
    }
    if(!self.isIngredientSelected){
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
            self.descriptionLabel.frame = CGRectMake(115, 11, 160, 21);
        }else{
            self.descriptionLabel.frame = CGRectMake(450, 27, 160, 21);
        }
    }
        if(self.isIngredientSelected){
            self.codeLabel.text = [self.codeArrayIngredient objectAtIndex:indexPath.row ];
            self.descriptionLabel.text = [self.nameArrayIngredient objectAtIndex:indexPath.row ];
            self.basePriceLabel.text = [self.basePriceArray objectAtIndex:indexPath.row];
            self.typeLabel.text = [self.typeArray objectAtIndex:indexPath.row ];
            self.inStockLabel.text = [self.inStockArray objectAtIndex:indexPath.row];            
        }else{
            self.codeLabel.text = [self.codeArraySpecies objectAtIndex:indexPath.row];
            self.descriptionLabel.text = [self.nameArraySpecies objectAtIndex:indexPath.row];
        }
    return cell;
}
#pragma mark Button Actions

- (IBAction)menu_Event:(id)sender {
    [self.menuView sendSubviewToBack:self.reportsTableView];
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

- (IBAction)backBtnOnClicked:(id)sender {
        [self.navigationController popToViewController:appDelegate.homeViewController animated:YES];
}

- (IBAction)ingredientPricebtnOnClicked:(id)sender {
    self.isIngredientSelected = TRUE;
    self.basePriceTitleLabel.hidden = FALSE;
    self.inStockTitleLabel.hidden = FALSE;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_price_tab_hover.png"] forState:UIControlStateNormal];
        [self.speciesBtn setImage:[UIImage imageNamed:@"species_code_tab.png"] forState:UIControlStateNormal];
        self.nameTitleLabel.frame = CGRectMake(67, 91, 42, 21) ;
    }else{
        self.typeTitleLabel.hidden = FALSE;
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_price_tab_hover_iPad.png"] forState:UIControlStateNormal];
        [self.speciesBtn setImage:[UIImage imageNamed:@"species_code_tab_iPad.png"] forState:UIControlStateNormal];
        self.nameTitleLabel.frame = CGRectMake(204, 13, 57, 21) ;
    }
    [self.reportsTableView reloadData];
}

- (IBAction)speciesCodeBtnOnClicked:(id)sender {
    self.isIngredientSelected = FALSE;
    self.basePriceTitleLabel.hidden = TRUE;
    self.inStockTitleLabel.hidden = TRUE;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        self.nameTitleLabel.frame = CGRectMake(120, 91, 42, 21) ;
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_price_tab.png"] forState:UIControlStateNormal];
        [self.speciesBtn setImage:[UIImage imageNamed:@"species_code_tab_hover.png"] forState:UIControlStateNormal];
    }else{
        self.typeTitleLabel.hidden = TRUE;
        self.nameTitleLabel.frame = CGRectMake(450, 13, 57, 21) ;
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_price_tab_iPad.png"] forState:UIControlStateNormal];
        [self.speciesBtn setImage:[UIImage imageNamed:@"species_code_tab_hover_iPad.png"] forState:UIControlStateNormal];
    }
    [self.reportsTableView reloadData];
}

- (IBAction)logoutBtnOnClicked:(id)sender {
    [appDelegate showTheLogoutAlert];
}

- (IBAction)profileBtnOnClicked:(id)sender {
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
    [self setTypeLabel:nil];
    [self setMenuBackBtn:nil];
    [super viewDidUnload];
}
@end
