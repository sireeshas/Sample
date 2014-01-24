//
//  MPMovieViewController.m
//  PriceGrabber
//
//  Created by Shravanthi on 4/2/13.
//  Copyright (c) 2013 Valuelabs. All rights reserved.
//

#import "MPMovieViewController.h"

@interface MPMovieViewController ()

@end

@implementation MPMovieViewController

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
	// Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieDidLoad:) name:MPMoviePlayerContentPreloadDidFinishNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieDidLoad:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

-(void)movieDidLoad:(NSNotification*)notification
{
    [self dismissMoviePlayerViewControllerAnimated];
}


- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame {
	NSString *embedHTML = @"\
    <html><head>\
	<style type=\"text/css\">\
	body {\
	background-color: transparent;\
	color: white;\
	}\
	</style>\
	</head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
	width=\"%f\" height=\"%f\"></embed>\
    </body></html>";
	NSString *html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
	UIWebView *videoView = [[UIWebView alloc] initWithFrame:frame];
	[videoView loadHTMLString:html baseURL:nil];
	[self.view addSubview:videoView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
