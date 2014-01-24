//
//  FormulaIngredientListViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 31/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "FormulaIngredientListViewController.h"
#import "IngredientEditorViewController.h"

@interface FormulaIngredientListViewController (){
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UITableView *ingredientTableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITableViewCell *ingredientTableViewCustomCell_iPhone;
@property (strong, nonatomic) IBOutlet UITableViewCell *ingredientTableViewCustomCell_iPad;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (nonatomic, strong) NSArray *codeArray;
@property (weak, nonatomic) IBOutlet UILabel *minimumLabel;
@property (weak, nonatomic) IBOutlet UILabel *maximumLabel;
@property (nonatomic, strong) NSArray *descArray;
@property (weak, nonatomic) IBOutlet UILabel *batchLabel;
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, strong) NSMutableArray *priceArray;
- (IBAction)profileBtnOnClicked:(id)sender;
- (IBAction)mailBtnOnClicked:(id)sender;
@property (nonatomic, strong) NSArray *minArray;
- (IBAction)backBtnOnClicked:(id)sender;
@property (nonatomic, strong) NSArray *maxArray;
@property (readwrite, nonatomic) BOOL isfirstTime;
@property (nonatomic, strong) NSArray *batchArray;
- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)menuBack_Event:(id)sender;
- (IBAction)menu_Event:(id)sender;
- (IBAction)menuBtnOnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@end

@implementation FormulaIngredientListViewController

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
        [appDelegate loadBottomBar:self :1];
    self.isfirstTime = TRUE;
    _codeArray = [[NSArray alloc]initWithObjects:@"58",@"102",@"69",@"114",@"225",@"218",@"134",@"99",@"57",@"25",@"123", nil];
    _descArray = [[NSArray alloc]initWithObjects:@"AlfaAlfa Pellets",@"Animal Fat",@"Barley",@"Corn",@"Dicol Phos",@"Corn Silage",@"Cotton Seed",@"Lime Stone",@"Salt",@"Liquid Methionine",@"Soybean Meal", nil];
    _priceArray = [[NSMutableArray alloc]initWithObjects:@"25.0000",@"10.0000",@"3.0000",@"4.0000",@"15.0000",@"12.1200",@"16.6000",@"3.0000",@"2.5000",@"1.5000",@"28.0000", nil];
    _minArray = [[NSArray alloc]initWithObjects:@"1.50",@"0.80",@"0.20",@"",@"9.50",@"",@"8.60",@"0.18",@"",@"0.02",@"", nil];
    _maxArray = [[NSArray alloc]initWithObjects:@"2.20",@"0.90",@"0.30",@"",@"10.00",@"",@"9.00",@"0.03",@"",@"0.03",@"", nil];
    _batchArray = [[NSArray alloc]initWithObjects:@"",@"",@"",@"560.50",@"",@"",@"250.50",@"50.50",@"25.00",@"",@"110.50",              
                   nil];
    _titlesArray = [[NSArray alloc]initWithObjects:@"Code",@"Description",@"Price/Kg (in USD)",@"Min(%)",@"Max(%)",@"Batch Size",nil];

   
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.ingredientTableView reloadData];
    self.navigationController.navigationBarHidden = TRUE;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        self.ingredientTableView.contentSize = CGSizeMake(700,555);
    self.titleLabel.text = [NSString stringWithFormat:@"Ingredient List for %@",appDelegate.titleForFormula];
    self.ingredientTableView.showsHorizontalScrollIndicator = TRUE;
    self.ingredientTableView.showsVerticalScrollIndicator = TRUE;
    [self.ingredientTableView flashScrollIndicators];
    if (!self.isfirstTime) {
        [self.priceArray replaceObjectAtIndex:appDelegate.indexFormula withObject:appDelegate.priceFormula];
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
#pragma Mark - TableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        return 32.0;
    else
        return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(6, 70, 1200, 38)];
    UILabel *codeLabel = [[UILabel alloc]initWithFrame:CGRectMake(9, 4, 50, 21)];
    codeLabel.text = [self.titlesArray objectAtIndex:0];
    [headerView addSubview:codeLabel];
    UILabel *descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(64, 5, 75, 21)];
    descriptionLabel.text = [self.titlesArray objectAtIndex:1];
    [headerView addSubview:descriptionLabel];
    UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, -1, 60, 32)];
    priceLabel.text = [self.titlesArray objectAtIndex:2];
    priceLabel.numberOfLines = 2;
    [headerView addSubview:priceLabel];
    UILabel *minLabel = [[UILabel alloc]initWithFrame:CGRectMake(253, 4, 50, 21)];
    minLabel.text = [self.titlesArray objectAtIndex:3];
    [headerView addSubview:minLabel];
    UILabel *maxLabel = [[UILabel alloc]initWithFrame:CGRectMake(328, 4, 50, 21)];
    maxLabel.text = [self.titlesArray objectAtIndex:4];
    [headerView addSubview:maxLabel];
    UILabel *batchSizeLabel = [[UILabel alloc]initWithFrame:CGRectMake(403, 4, 75, 21)];
    batchSizeLabel.text = [self.titlesArray objectAtIndex:5];
    [headerView addSubview:batchSizeLabel];
    codeLabel.textColor = batchSizeLabel.textColor = maxLabel.textColor = minLabel.textColor = priceLabel.textColor = descriptionLabel.textColor = [UIColor whiteColor];
     codeLabel.backgroundColor = batchSizeLabel.backgroundColor = maxLabel.backgroundColor = minLabel.backgroundColor = priceLabel.backgroundColor = descriptionLabel.backgroundColor = [UIColor clearColor];
    codeLabel.font = batchSizeLabel.font = maxLabel.font = minLabel.font = priceLabel.font = descriptionLabel.font = [UIFont fontWithName:@"Arial" size:14];
    headerView.backgroundColor = [UIColor colorWithRed:0/255.0 green:39/255.0 blue:103/255.0 alpha:1];
        return headerView;
    }else
        return nil;

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
    cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
    if (cell == nil) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
            [[NSBundle mainBundle] loadNibNamed:@"FormulaIngredientListViewControllerCustomCell_iPhone" owner:self options:nil];
            cell = self.ingredientTableViewCustomCell_iPhone;
            self.ingredientTableViewCustomCell_iPhone = nil;
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg.png"]];
        }else{
            [[NSBundle mainBundle] loadNibNamed:@"FormulaIngredientListViewControllerCustomCell_iPad" owner:self options:nil];
            cell = self.ingredientTableViewCustomCell_iPad;
            self.ingredientTableViewCustomCell_iPad = nil;
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg_iPad.png"]];
        }
    }
    
    self.codeLabel.text = [self.codeArray objectAtIndex:indexPath.row ];
    self.descriptionLabel.text = [self.descArray objectAtIndex:indexPath.row];
    self.priceLabel.text = [self.priceArray objectAtIndex:indexPath.row];
    self.minimumLabel.text = [self.minArray objectAtIndex:indexPath.row];
    self.maximumLabel.text = [self.maxArray objectAtIndex:indexPath.row];
    self.batchLabel.text = [self.batchArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.isfirstTime = FALSE;
    appDelegate.ingredientFormula = [self.descArray objectAtIndex:indexPath.row];
    appDelegate.indexFormula = indexPath.row;
    appDelegate.priceFormula = [self.priceArray objectAtIndex:indexPath.row];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        IngredientEditorViewController *ingredientEditorVC =[[IngredientEditorViewController alloc]initWithNibName:@"IngredientEditorViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:ingredientEditorVC animated:YES];
    }else{
        IngredientEditorViewController *ingredientEditorVC =[[IngredientEditorViewController alloc]initWithNibName:@"IngredientEditorViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:ingredientEditorVC animated:YES];
    }
    
}
#pragma mark button actions

- (IBAction)backBtnOnClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)logoutBtnOnClicked:(id)sender {
    [appDelegate showTheLogoutAlert];
}

- (IBAction)profileBtnOnClicked:(id)sender {
}

- (IBAction)mailBtnOnClicked:(id)sender {
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
- (IBAction)menuBtnOnClicked:(id)sender {
    UIButton *temp=(UIButton*)sender;
    [appDelegate bottomButtonAction:temp];
    
}
- (IBAction)menuBack_Event:(id)sender {
    [UIView animateWithDuration:0.75 animations:^{
        self.menuView.frame = CGRectMake(-140,  104, 138, 539);
    } completion:^(BOOL finished){
    }];
}

- (IBAction)menu_Event:(id)sender {
    [UIView animateWithDuration:0.75 animations:^{
        self.menuView.frame = CGRectMake(0 ,104, 138, 539);
    } completion:^(BOOL finished){
    }];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
