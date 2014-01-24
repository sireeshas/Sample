//
//  HomeViewController.m
//  BrillMobile
//
//  Created by ValueLabs on 23/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "HomeViewController.h"
#import "ReportsViewController.h"
#import "FormulaSpecificationViewController.h"
#import "PricesViewController.h"
#import "NewsViewController.h"
#import "VideosViewController.h"
#import "NutrientViewController.h"

@interface HomeViewController (){
    AppDelegate *appDelegate;
    float addByThis;
}

@property (weak, nonatomic) IBOutlet UIScrollView *flashNewsScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *flashNewsPageControl;

- (IBAction)logoutBtnOnClicked:(id)sender;
- (IBAction)profilebtnOnClicked:(id)sender;
- (IBAction)messageBtnOnClicked:(id)sender;

- (IBAction)reportsBtnOnClicked:(id)sender;
- (IBAction)formulaSpecificationBtnOnClicked:(id)sender;
- (IBAction)ingredientCompositionsBtnOnClicked:(id)sender;
- (IBAction)newsBtnOnClicked:(id)sender;
- (IBAction)pricesBtnOnClicked:(id)sender;
- (IBAction)videosBtnOnClicked:(id)sender;
//Custom Properties
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, strong) NSArray *textArray;
@end

@implementation HomeViewController

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
     _titlesArray = [[NSArray alloc] initWithObjects:@"Feed additive could help piglets", @"Feed additive could help piglets 2", @"Feed additive could help piglets 3", nil];
    _textArray = [[NSArray alloc] initWithObjects:@"Recent studies the leuven university and the university of alabama have shown that adding", @"Recent studies the leuven university and the university of alabama have shown that adding 2", @"Recent studies the leuven university and the university of alabama have shown that adding 3", nil];
    for (int i = 0; i < [self.titlesArray count]; i++) {
        //We'll create an imageView object in every 'page' of our scrollView.
        CGRect frame;
        frame.origin.x = (self.flashNewsScrollView.frame.size.width * i)+ 8;
        frame.origin.y = 6;
        frame.size.width = self.flashNewsScrollView.frame.size.width;
        frame.size.height = 21;
        CGRect frame2;
        frame2.origin.x = (self.flashNewsScrollView.frame.size.width * i)+ 8;
        frame2.origin.y = 28;
        frame2.size.width = self.flashNewsScrollView.frame.size.width-50;
        frame2.size.height = 21;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:frame];
        titleLabel.text = [NSString stringWithFormat:@"%@",[self.titlesArray objectAtIndex:i]];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:frame2];
        textLabel.text = [NSString stringWithFormat:@"%@",[self.textArray objectAtIndex:i]];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            textLabel.numberOfLines = 2;
        else
            textLabel.numberOfLines =1;
        titleLabel.textColor = [UIColor colorWithRed:0/255.0 green:63/255.0 blue:170/255.0 alpha:1];
        textLabel.textColor = [UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1];
        titleLabel.font = [UIFont fontWithName:@"Arial-bold" size:12.0];
        textLabel.font = [UIFont fontWithName:@"Arial" size:11.0];
        titleLabel.backgroundColor = [UIColor clearColor];
        textLabel.backgroundColor = [UIColor clearColor];
        [self.flashNewsScrollView addSubview:titleLabel];
        [self.flashNewsScrollView addSubview:textLabel];
    }
    //Set the content size of our scrollview according to the total width of our imageView objects.
    self.flashNewsScrollView.contentSize = CGSizeMake(self.flashNewsScrollView.frame.size.width * [self.titlesArray count], self.flashNewsScrollView.frame.size.height);
	NSTimer *junk = [NSTimer scheduledTimerWithTimeInterval:.05   target:self selector:@selector(scrollTheText) userInfo:nil repeats:YES];
	NSLog(@"junk:%@",junk);
	//Every time we update, lets modify by 1
	addByThis = 1;
    //    Do any additional setup after loading the view from its nib.

}
-(void)scrollTheText
{
	CGPoint scrollPoint = self.flashNewsScrollView.contentOffset;
	scrollPoint.x= scrollPoint.x+addByThis;
	if(scrollPoint.x >= self.flashNewsScrollView.contentSize.width - (self.flashNewsScrollView.frame.size.width/2) )
	{
		addByThis = 1;
        scrollPoint = CGPointMake(0, 0);
	}
	
	[self.flashNewsScrollView setContentOffset:scrollPoint animated:NO];
	
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = TRUE;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.flashNewsScrollView.frame.size.width;
    int page = floor((self.flashNewsScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.flashNewsPageControl.currentPage = page;
}

- (IBAction)logoutBtnOnClicked:(id)sender {
    [appDelegate showTheLogoutAlert];
}

- (IBAction)profilebtnOnClicked:(id)sender {
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

- (IBAction)reportsBtnOnClicked:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        ReportsViewController *reportsVC = [[ReportsViewController alloc]initWithNibName:@"ReportsViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:reportsVC animated:YES];
    } else {
        ReportsViewController *reportsVC = [[ReportsViewController alloc]initWithNibName:@"ReportsViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:reportsVC animated:YES];
    }
}

- (IBAction)newsBtnOnClicked:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        NewsViewController *newsVC = [[NewsViewController alloc]initWithNibName:@"NewsViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:newsVC animated:YES];
    } else {
        NewsViewController *newsVC = [[NewsViewController alloc]initWithNibName:@"NewsViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:newsVC animated:YES];
    }
}

- (IBAction)formulaSpecificationBtnOnClicked:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        FormulaSpecificationViewController *formulaSpecificationVC = [[FormulaSpecificationViewController alloc]initWithNibName:@"FormulaSpecificationViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:formulaSpecificationVC animated:YES];
    } else {
        FormulaSpecificationViewController *formulaSpecificationVC = [[FormulaSpecificationViewController alloc]initWithNibName:@"FormulaSpecificationViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:formulaSpecificationVC animated:YES];
    }
}

- (IBAction)pricesBtnOnClicked:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        PricesViewController *pricesVC = [[PricesViewController alloc]initWithNibName:@"PricesViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:pricesVC animated:YES];
    } else {
        PricesViewController *pricesVC = [[PricesViewController alloc]initWithNibName:@"PricesViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:pricesVC animated:YES];
    }

}

- (IBAction)videosBtnOnClicked:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        VideosViewController *VideosVC = [[VideosViewController alloc]initWithNibName:@"VideosViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:VideosVC animated:YES];
    } else {
        VideosViewController *VideosVC = [[VideosViewController alloc]initWithNibName:@"VideosViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:VideosVC animated:YES];
    }

}

- (IBAction)ingredientCompositionsBtnOnClicked:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        NutrientViewController *nutrientVC = [[NutrientViewController alloc]initWithNibName:@"NutrientViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:nutrientVC animated:YES];
    } else {
        NutrientViewController *nutrientVC = [[NutrientViewController alloc]initWithNibName:@"NutrientViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:nutrientVC animated:YES];
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
@end
