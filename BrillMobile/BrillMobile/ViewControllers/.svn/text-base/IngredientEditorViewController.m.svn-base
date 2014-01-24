//
//  IngredientEditorViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 03/01/14.
//  Copyright (c) 2014 Valuelabs. All rights reserved.
//

#import "IngredientEditorViewController.h"

@interface IngredientEditorViewController (){
    AppDelegate *appDelegate;
}
- (IBAction)backBtnOnClicked:(id)sender;
- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)profileBtnOnClicked:(id)sender;
- (IBAction)mailBtnOnClicked:(id)sender;
- (IBAction)saveBtnOnClicked:(id)sender;
- (IBAction)closeBtnOnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *ingredientNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *inStockTextField;
@property (weak, nonatomic) IBOutlet UITextField *dryMatterTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *typeTextField;
- (IBAction)ingredientBtnOnClicked:(id)sender;
- (IBAction)compositionBtnOnClicked:(id)sender;
- (IBAction)equationBtnOnClicked:(id)sender;
- (IBAction)additionalBtnOnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *ingredientView;
@property (weak, nonatomic) IBOutlet UIButton *ingredientBtn;
@property (weak, nonatomic) IBOutlet UIButton *compositionBtn;
@property (weak, nonatomic) IBOutlet UIButton *equationBtn;
@property (weak, nonatomic) IBOutlet UIButton *additionsbtn;
- (IBAction)menuBack_Event:(id)sender;
- (IBAction)menu_Event:(id)sender;
- (IBAction)menuBtnOnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@end

@implementation IngredientEditorViewController

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
    self.ingredientNameLabel.text = appDelegate.ingredientFormula;
    self.priceTextField.text = appDelegate.priceFormula;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        [appDelegate loadBottomBar:self :1];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)saveBtnOnClicked:(id)sender {
    appDelegate.priceFormula = self.priceTextField.text;
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)closeBtnOnClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)ingredientBtnOnClicked:(id)sender {
    self.ingredientView.hidden =FALSE;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_tab_active.png"] forState:UIControlStateNormal];
        [self.compositionBtn setImage:[UIImage imageNamed:@"comosition_tab.png"] forState:UIControlStateNormal];
        [self.additionsbtn setImage:[UIImage imageNamed:@"additional_tab.png"] forState:UIControlStateNormal];
        [self.equationBtn setImage:[UIImage imageNamed:@"equations_tab.png"] forState:UIControlStateNormal];
    }else{
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_tab_active_iPad.png"] forState:UIControlStateNormal];
        [self.compositionBtn setImage:[UIImage imageNamed:@"comosition_tab_iPad.png"] forState:UIControlStateNormal];
        [self.additionsbtn setImage:[UIImage imageNamed:@"additional_tab_iPad.png"] forState:UIControlStateNormal];
        [self.equationBtn setImage:[UIImage imageNamed:@"equations_tab_iPad.png"] forState:UIControlStateNormal];
    }

}

- (IBAction)compositionBtnOnClicked:(id)sender {
    self.ingredientView.hidden =TRUE;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_tab.png"] forState:UIControlStateNormal];
        [self.compositionBtn setImage:[UIImage imageNamed:@"comosition_tab_active.png"] forState:UIControlStateNormal];
        [self.additionsbtn setImage:[UIImage imageNamed:@"additional_tab.png"] forState:UIControlStateNormal];
        [self.equationBtn setImage:[UIImage imageNamed:@"equations_tab.png"] forState:UIControlStateNormal];
    }else{
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_tab_iPad.png"] forState:UIControlStateNormal];
        [self.compositionBtn setImage:[UIImage imageNamed:@"comosition_tab_active_iPad.png"] forState:UIControlStateNormal];
        [self.additionsbtn setImage:[UIImage imageNamed:@"additional_tab_iPad.png"] forState:UIControlStateNormal];
        [self.equationBtn setImage:[UIImage imageNamed:@"equations_tab_iPad.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)equationBtnOnClicked:(id)sender {
    self.ingredientView.hidden =TRUE;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_tab.png"] forState:UIControlStateNormal];
        [self.compositionBtn setImage:[UIImage imageNamed:@"comosition_tab.png"] forState:UIControlStateNormal];
        [self.additionsbtn setImage:[UIImage imageNamed:@"additional_tab.png"] forState:UIControlStateNormal];
        [self.equationBtn setImage:[UIImage imageNamed:@"equations_tab_active.png"] forState:UIControlStateNormal];
    }else{
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_tab_iPad.png"] forState:UIControlStateNormal];
        [self.compositionBtn setImage:[UIImage imageNamed:@"comosition_tab_iPad.png"] forState:UIControlStateNormal];
        [self.additionsbtn setImage:[UIImage imageNamed:@"additional_tab_iPad.png"] forState:UIControlStateNormal];
        [self.equationBtn setImage:[UIImage imageNamed:@"equations_tab_active_iPad.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)additionalBtnOnClicked:(id)sender {
    self.ingredientView.hidden =TRUE;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_tab.png"] forState:UIControlStateNormal];
        [self.compositionBtn setImage:[UIImage imageNamed:@"comosition_tab.png"] forState:UIControlStateNormal];
        [self.additionsbtn setImage:[UIImage imageNamed:@"additional_tab_active.png"] forState:UIControlStateNormal];
        [self.equationBtn setImage:[UIImage imageNamed:@"equations_tab.png"] forState:UIControlStateNormal];
    }else{
        [self.ingredientBtn setImage:[UIImage imageNamed:@"ingredient_tab_iPad.png"] forState:UIControlStateNormal];
        [self.compositionBtn setImage:[UIImage imageNamed:@"comosition_tab_iPad.png"] forState:UIControlStateNormal];
        [self.additionsbtn setImage:[UIImage imageNamed:@"additional_tab_active_iPad.png"] forState:UIControlStateNormal];
        [self.equationBtn setImage:[UIImage imageNamed:@"equations_tab_iPad.png"] forState:UIControlStateNormal];
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
#pragma mark textfield methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        if (textField == self.inStockTextField) 
            [self.inStockTextField resignFirstResponder];
        else
        [nextResponder becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        // Not found, so remove keyboard.
    }
    return NO; // We do not want UITextField to insert line-breaks.}
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
