//
//  FormulaSpecificationViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 24/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "FormulaSpecificationViewController.h"
#import "FormulaIngredientListViewController.h"
#import "FormulaGraphViewController.h"

@interface FormulaSpecificationViewController (){
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UILabel *graphTitleLabel;
- (IBAction)backBtnOnCLicked:(id)sender;
- (IBAction)menuBack_Event:(id)sender;
- (IBAction)menu_Event:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *menuView;
- (IBAction)menuBtnOnClicked:(id)sender;
- (IBAction)emailBtnOnClicked:(id)sender;
- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)profileBtnOnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *viewChartBtn;
@property (weak, nonatomic) IBOutlet UITableView *formulaSpecificationTableView;
@property (weak, nonatomic) IBOutlet UILabel *formulaLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *unitLabel;
@property (weak, nonatomic) IBOutlet UIView *transperentView;
@property (weak, nonatomic) IBOutlet UIView *graphView;

@property (strong, nonatomic) IBOutlet UITableViewCell *formulaSpecificationTableViewCustomCell_iPad;
@property (strong, nonatomic) IBOutlet UITableViewCell *formulaSpecificationTableViewCustomCell_iPhone;
@property (nonatomic, strong) NSArray *codeArray;
@property (nonatomic, strong) NSArray *formulaArray;
- (IBAction)viewChartBtnOnClicked:(id)sender;
@property (nonatomic, strong) NSArray *unitArray;
@end

@implementation FormulaSpecificationViewController

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
    _formulaArray = [[NSArray alloc]initWithObjects:@"Lactating Sample",@"Beef Sample",@"Dairy Cattle Sample",@"New Formula",@"Fish Sample",@"Sheep Sample",@"Pig Sample", nil];
    _codeArray = [[NSArray alloc]initWithObjects:@"014",@"015",@"025",@"012",@"035",@"024",@"028", nil];
    _unitArray = [[NSArray alloc]initWithObjects:@"$11.56",@"$5.02",@"$31.60",@"$132.56",@"$12.00",@"$2.00",@"$13.43", nil];
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(graphHiding)];
    tapped.numberOfTapsRequired = 1;
    [self.transperentView addGestureRecognizer:tapped];
    
   // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.formulaSpecificationTableView reloadData];
    self.navigationController.navigationBarHidden = TRUE;
}
-(void)graphHiding
{
    self.graphView.hidden = TRUE;
    self.transperentView.hidden = TRUE;
}
#pragma mark button actions
- (IBAction)backBtnOnCLicked:(id)sender {
        [self.navigationController popToViewController:appDelegate.homeViewController animated:YES];
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

- (IBAction)menuBtnOnClicked:(id)sender {
    UIButton *temp=(UIButton*)sender;
    [appDelegate bottomButtonAction:temp];
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

- (IBAction)profileBtnOnClicked:(id)sender {
}


- (IBAction)viewChartBtnOnClicked:(id)sender {
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
//        FormulaGraphViewController *formulaGraphVC =[[FormulaGraphViewController alloc]initWithNibName:@"FormulaGraphViewController_iPhone" bundle:nil];
//        [self.navigationController pushViewController:formulaGraphVC animated:YES];
//    }else{
//        FormulaGraphViewController *formulaGraphVC =[[FormulaGraphViewController alloc]initWithNibName:@"FormulaGraphViewController_iPad" bundle:nil];
//        [self.navigationController pushViewController:formulaGraphVC animated:YES];
//    }
    UIButton *temp=(UIButton*)sender;
    NSLog(@"temp.tag = %d",temp.tag);
    self.graphTitleLabel.text = [self.formulaArray objectAtIndex:temp.tag];
    self.transperentView.hidden = FALSE;
    self.graphView.hidden = FALSE;

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
        return 7;
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
            [[NSBundle mainBundle] loadNibNamed:@"FormulaSpecificationViewControllerCustomCell_iPhone" owner:self options:nil];
            cell = self.formulaSpecificationTableViewCustomCell_iPhone;
            self.formulaSpecificationTableViewCustomCell_iPhone = nil;
              cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg.png"]];
        }else{
            [[NSBundle mainBundle] loadNibNamed:@"FormulaSpecificationViewControllerCustomCell_iPad" owner:self options:nil];
            cell = self.formulaSpecificationTableViewCustomCell_iPad;
            self.formulaSpecificationTableViewCustomCell_iPad = nil;
              cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"table_row_bg_iPad.png"]];
        }
    }
    self.viewChartBtn.tag = indexPath.row;
  
            self.codeLabel.text = [self.codeArray objectAtIndex:indexPath.row ];
            self.formulaLabel.text = [self.formulaArray objectAtIndex:indexPath.row ];
            self.unitLabel.text = [self.unitArray objectAtIndex:indexPath.row ];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    appDelegate.titleForFormula = [self.formulaArray objectAtIndex:indexPath.row];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        FormulaIngredientListViewController *formulaIngredientListVC =[[FormulaIngredientListViewController alloc]initWithNibName:@"FormulaIngredientListViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:formulaIngredientListVC animated:YES];
    }else{
        FormulaIngredientListViewController *formulaIngredientListVC =[[FormulaIngredientListViewController alloc]initWithNibName:@"FormulaIngredientListViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:formulaIngredientListVC animated:YES];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
