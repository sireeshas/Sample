//
//  AppDelegate.m
//  BrillMobile
//
//  Created by ValueLabs on 23/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "ReportsViewController.h"
#import "FormulaSpecificationViewController.h"
#import "NutrientViewController.h"
#import "NewsViewController.h"
#import "PricesViewController.h"
#import "VideosViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    self.navigationController=[[UINavigationController alloc]initWithRootViewController:self.viewController];
    [self.window setRootViewController:self.navigationController];
    [self performSelector:@selector(showTheAlert) withObject:nil afterDelay:10];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)showTheAlert
{
    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"Notification" message:@"Software Solutions for Feeding Our Growing World!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alerView show];
}
#pragma mark Alert methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
    } else if (buttonIndex == 1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
-(void)showTheLogoutAlert
{
    UIAlertView* alertForSameDate= [[UIAlertView alloc] initWithTitle: @"Alert" message: @"Are you sure you want to logout?" delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles: @"Ok", nil];
    [alertForSameDate show];
}

-(void)loadBottomBar:(UIViewController*)lview :(int)moduleIndex {
    _footerView=[[UIView alloc]initWithFrame:CGRectMake(0, self.window.frame.size.height-75, 320, 56)];
    _footerView.backgroundColor =[UIColor clearColor];
    NSMutableArray *bottomImages = [[NSMutableArray alloc]initWithObjects:@"reports_botom_icon.png",@"formula_botom_icon.png",@"nutrients_botom_icon.png",@"news_botom_icon.png",@"prices_botom_icon.png",@"videos_botom_icon.png", nil];
    NSMutableArray *bottomActiveImages = [[NSMutableArray alloc]initWithObjects:@"reports_botom_icon_active.png",@"formula_botom_icon_active.png",@"nutrients_botom_icon_active.png",@"news_botom_icon_active.png",@"prices_botom_icon_active.png",@"videos_botom_icon_active.png", nil];
    
    for (int i=0; i<6; i++) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(i*54, 0, 55, 55)];
        button.tag=i;
        if(i==moduleIndex)
        {
            button.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:[bottomActiveImages objectAtIndex:i]]];
        }
        else
        {
            button.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:[bottomImages objectAtIndex:i]]];
        }
        [button addTarget:self action:@selector(bottomButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:button];
    }
    [lview.view addSubview:_footerView];
    
}
-(void)bottomButtonAction:(id)sender
{
    UIButton *temp=(UIButton*)sender;
    if(temp.tag==0)
    {
        [self.navigationController popViewControllerAnimated:NO];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) 
            _reportsViewController = [[ReportsViewController alloc]initWithNibName:@"ReportsViewController_iPhone" bundle:nil];
        else
            _reportsViewController = [[ReportsViewController alloc]initWithNibName:@"ReportsViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:_reportsViewController animated:NO];
    }
    if(temp.tag==1)
    {
        [self.navigationController popViewControllerAnimated:NO];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) 
            _formulaSpecificationViewController = [[FormulaSpecificationViewController alloc]initWithNibName:@"FormulaSpecificationViewController_iPhone" bundle:nil];
        else
            _formulaSpecificationViewController = [[FormulaSpecificationViewController alloc]initWithNibName:@"FormulaSpecificationViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:_formulaSpecificationViewController animated:NO];
    }
    if(temp.tag==2)
    {
        [self.navigationController popViewControllerAnimated:NO];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) 
            _NutrientViewController = [[NutrientViewController alloc]initWithNibName:@"NutrientViewController_iPhone" bundle:nil];
        else
            _NutrientViewController = [[NutrientViewController alloc]initWithNibName:@"NutrientViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:_NutrientViewController animated:NO];
    }
    if(temp.tag==3)
    {
        [self.navigationController popViewControllerAnimated:NO];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            _newsViewController = [[NewsViewController alloc]initWithNibName:@"NewsViewController_iPhone" bundle:nil];
        else
            _newsViewController = [[NewsViewController alloc]initWithNibName:@"NewsViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:_newsViewController animated:NO];
    }
    if(temp.tag==4)
    {
        [self.navigationController popViewControllerAnimated:NO];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            _pricesViewController = [[PricesViewController alloc]initWithNibName:@"PricesViewController_iPhone" bundle:nil];
        else
            _pricesViewController = [[PricesViewController alloc]initWithNibName:@"PricesViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:_pricesViewController animated:NO];
    }
    if(temp.tag==5)
    {
        [self.navigationController popViewControllerAnimated:NO];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            _videosViewController = [[VideosViewController alloc]initWithNibName:@"VideosViewController_iPhone" bundle:nil];
        else
            _videosViewController = [[VideosViewController alloc]initWithNibName:@"VideosViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:_videosViewController animated:NO];
    }
    
}

+(AppDelegate *)delegate{
    
    return (AppDelegate*)[[UIApplication sharedApplication]delegate];
}
#ifdef IOS_NEWER_OR_EQUAL_TO_6

- (NSUInteger)application:(UIApplication *)application
supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    
    if ([[window.subviews lastObject] isKindOfClass:NSClassFromString(@"MPMovieView")]) {
        
        // return UIInterfaceOrientationMaskAll;
        return UIInterfaceOrientationMaskPortrait| UIInterfaceOrientationMaskPortraitUpsideDown | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
        
        
    }
    
    return UIInterfaceOrientationMaskPortrait;
    
}

#endif
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
