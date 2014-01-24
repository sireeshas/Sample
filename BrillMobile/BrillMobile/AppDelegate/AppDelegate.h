//
//  AppDelegate.h
//  BrillMobile
//
//  Created by ValueLabs on 23/12/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class HomeViewController;
@class ReportsViewController;
@class FormulaSpecificationViewController;
@class NewsViewController;
@class VideosViewController;
@class PricesViewController;
@class NutrientViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) UINavigationController *navigationController;

@property (strong, nonatomic) HomeViewController *homeViewController;

@property (strong, nonatomic) ReportsViewController *reportsViewController;

@property (strong, nonatomic) FormulaSpecificationViewController *formulaSpecificationViewController;

@property (strong, nonatomic) NewsViewController *newsViewController;

@property (strong, nonatomic) VideosViewController *videosViewController;

@property (strong, nonatomic) PricesViewController *pricesViewController;;

@property (strong, nonatomic) NutrientViewController *NutrientViewController;

@property (strong, nonatomic) UIView *footerView;

@property (nonatomic, retain) NSString *titleForFormula;

@property (nonatomic, retain) NSString *ingredientFormula;
@property (nonatomic, retain) NSString *priceFormula;
@property (nonatomic) int indexFormula;
//For toolbar
-(void)loadBottomBar:(UIViewController*)lview :(int)moduleIndex;

-(void)bottomButtonAction:(id)sender;

-(void)showTheLogoutAlert;

+(AppDelegate *)delegate;
@end
