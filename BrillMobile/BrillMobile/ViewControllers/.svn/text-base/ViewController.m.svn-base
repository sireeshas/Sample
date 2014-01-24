//
//  ViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 23/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"

@interface ViewController (){
    AppDelegate *appDelegate;

}
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIButton *nutritionistBtn;
@property (weak, nonatomic) IBOutlet UIButton *formulatorBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *plantBtnLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *plantPicker;
@property (retain, nonatomic) NSArray *plantPickerArray;
- (IBAction)plantButtonOnClicked:(id)sender;
- (IBAction)loginBtnOnClicked:(id)sender;
- (IBAction)nutritionistBtnOnClicked:(id)sender;
- (IBAction)formulatorBtnOnClicked:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = [AppDelegate delegate];
    
    _plantPickerArray= [[NSArray alloc]initWithObjects:@"Cattle Sample",@"Poultry Sample",@"Aqua Sample",@"Sheep Sample",@"Swine Sample",@"Horse Sample", nil];
    self.plantPicker.hidden = TRUE;
    [self.plantPicker addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerTapped:)] 
     ];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
     self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, 230, self.loginView.frame.size.width, self.loginView.frame.size.height);
    self.navigationController.navigationBarHidden = TRUE;
    [self.view bringSubviewToFront:self.loginView];
    self.plantBtnLabel.text = @"";
    self.nameTextField.text = @"";
    self.passwordTextField.text = @"" ;
    [self.plantPicker setHidden:TRUE];
    [self.passwordTextField resignFirstResponder];
    [self.nameTextField resignFirstResponder];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) 
        self.loginView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_box_bg.png"]];
    else
        self.loginView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_box_bg_iPad.png"]];
    
}
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
//    {
//        return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
//                (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
//    }else
////    if([deviceType isEqualToString:@"iPhone Simulator"])
//        return ((interfaceOrientation == UIInterfaceOrientationPortrait) ||
//                (interfaceOrientation == UIInterfaceOrientationMaskPortraitUpsideDown));
////    else
////        return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
////                (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
//    
//}
- (BOOL)shouldAutorotate {
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
            {
                return ((orientation == UIInterfaceOrientationLandscapeLeft) ||
                        (orientation == UIInterfaceOrientationLandscapeRight));
           }else
        return ((orientation == UIInterfaceOrientationLandscapeLeft) ||
                               (orientation == UIInterfaceOrientationLandscapeRight));
}
#pragma mark - Picker View Data source

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [self.plantPickerArray count];
}

-(void)pickerTapped:(UIGestureRecognizer *)gestureRecognizer {
    self.plantPicker.hidden=TRUE;
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationBeginsFromCurrentState:YES];
    //    if (textField == self.plantTextField) {
    //        self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, (self.loginView.frame.origin.y - 150.0), self.loginView.frame.size.width, self.loginView.frame.size.height);
    //    }else if (textField == self.nameTextField){
    //        self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, (self.loginView.frame.origin.y - 150.0), self.loginView.frame.size.width, self.loginView.frame.size.height);
    //    }else{
    self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, 230, self.loginView.frame.size.width, self.loginView.frame.size.height);
    //    mHospitalNameImageView.frame=CGRectMake(mHospitalNameImageView.frame.origin.x,(mHospitalNameImageView.frame.origin.y - 150.0), mHospitalNameImageView.frame.size.width, mHospitalNameImageView.frame.size.height);
	[UIView commitAnimations];
    [self.nameTextField becomeFirstResponder];
    [self pickerView:self.plantPicker didSelectRow:0 inComponent:0];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    
    [self.plantBtnLabel setText:[self.plantPickerArray objectAtIndex:row]];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.plantPickerArray objectAtIndex:row];
}

#pragma mark button actions

- (IBAction)plantButtonOnClicked:(id)sender {
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationBeginsFromCurrentState:YES];
    NSLog(@"%f",self.loginView.frame.origin.y);
    self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, 80, self.loginView.frame.size.width, self.loginView.frame.size.height);
	[UIView commitAnimations];
    [self pickerView:self.plantPicker didSelectRow:0 inComponent:0];
    [self.view bringSubviewToFront:self.plantPicker];
    [self.nameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    self.plantPicker.hidden = FALSE;
}

- (IBAction)loginBtnOnClicked:(id)sender {
//    if ([self.plantTextField.text isEqualToString:@""]&&[self.nameTextField.text isEqualToString:@""]&&[self.passwordTextField.text isEqualToString:@""]) {
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please Enter All the fields" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//        [alert show];
//    }
//    else if([self.plantTextField.text isEqualToString:@""]){
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please enter Plant filed" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//        [alert show];
//    }else if ([self.nameTextField.text isEqualToString:@""]){
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please enter Name" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//        [alert show];
//    }else if ([self.passwordTextField.text isEqualToString:@""]){
//        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please enter Password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//        [alert show];
//    }else{
        [self.passwordTextField resignFirstResponder];
        [self.nameTextField resignFirstResponder];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        HomeViewController *homeVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController_iPhone" bundle:nil];       
        [appDelegate setHomeViewController:homeVC];
        [self.navigationController pushViewController:appDelegate.homeViewController animated:YES];
    } else {
        HomeViewController *homeVC = [[HomeViewController alloc]initWithNibName:@"HomeViewController_iPad" bundle:nil];
        [appDelegate setHomeViewController:homeVC];
        [self.navigationController pushViewController:appDelegate.homeViewController animated:YES];
    }
}

- (IBAction)nutritionistBtnOnClicked:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    [self.nutritionistBtn setBackgroundImage:[UIImage imageNamed:@"login_tab_active.png"]forState:UIControlStateNormal];
    [self.nutritionistBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.formulatorBtn setBackgroundImage:[UIImage imageNamed:@"login_tab.png"] forState:UIControlStateNormal];
     [self.formulatorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [self.nutritionistBtn setBackgroundImage:[UIImage imageNamed:@"login_tab_iPad.png"]forState:UIControlStateNormal];
        [self.nutritionistBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.formulatorBtn setBackgroundImage:[UIImage imageNamed:@"login_tab_active_iPad.png"] forState:UIControlStateNormal];
        [self.formulatorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }

}

- (IBAction)formulatorBtnOnClicked:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    [self.nutritionistBtn setBackgroundImage:[UIImage imageNamed:@"login_tab.png"] forState:UIControlStateNormal];
    [self.formulatorBtn setBackgroundImage:[UIImage imageNamed:@"login_tab_active.png"]forState:UIControlStateNormal];
    [self.formulatorBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nutritionistBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [self.nutritionistBtn setBackgroundImage:[UIImage imageNamed:@"login_tab_active_iPad.png"] forState:UIControlStateNormal];
        [self.formulatorBtn setBackgroundImage:[UIImage imageNamed:@"login_tab_iPad.png"]forState:UIControlStateNormal];
        [self.formulatorBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.nutritionistBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }

}

#pragma  mark text field methods
-(void)keyboardWillHide
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, 230, self.loginView.frame.size.width, self.loginView.frame.size.height);
    [UIView commitAnimations];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.plantPicker setHidden:TRUE];
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationBeginsFromCurrentState:YES];
        self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, 80, self.loginView.frame.size.width, self.loginView.frame.size.height);

	[UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
 
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, 230, self.loginView.frame.size.width, self.loginView.frame.size.height);
        [UIView commitAnimations];
    }
        //    mHospitalNameImageView.frame=CGRectMake(mHospitalNameImageView.frame.origin.x,(mHospitalNameImageView.frame.origin.y + 150.0), mHospitalNameImageView.frame.size.width, mHospitalNameImageView.frame.size.height);
	
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
