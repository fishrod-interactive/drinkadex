//
//  MainViewController.m
//  drunk-drink-a-dex
//
//  Created by Gavin Williams on 22/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

typedef enum {
	FRSPIRITSSCROLLVIEW,
	FRMIXERSCROLLVIEW
} FRSCROLLVIEW;

@implementation MainViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize spiritsView = _spiritsView;
@synthesize mixerView = _mixerView;
@synthesize information = _information;
@synthesize andView = _andView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
        
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    
    // Create backgrounds
    UIImage *background = [UIImage imageNamed:@"background"];
    UIImageView *backgroundview = [[UIImageView alloc] initWithImage:background];
    
    [self.view addSubview:backgroundview];
    [backgroundview release];
    
	// Set up the views
	self.spiritsView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, (self.view.frame.size.width / 2))];
	self.spiritsView.showsVerticalScrollIndicator = NO;
	self.spiritsView.showsHorizontalScrollIndicator = NO;
	self.spiritsView.bounces = YES;
	self.spiritsView.pagingEnabled = YES;
	self.spiritsView.scrollEnabled = YES;
	self.spiritsView.alwaysBounceHorizontal = YES;
	self.spiritsView.tag = FRSPIRITSSCROLLVIEW;
	
	self.mixerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.width / 2), self.view.frame.size.height, (self.view.frame.size.width / 2))];
	self.mixerView.showsVerticalScrollIndicator = NO;
	self.mixerView.showsHorizontalScrollIndicator = NO;
	self.mixerView.bounces = YES;
	self.mixerView.pagingEnabled = YES;
	self.mixerView.scrollEnabled = YES;
	self.mixerView.alwaysBounceHorizontal = YES;
	self.mixerView.tag = FRMIXERSCROLLVIEW;
	
	spirits = [[NSArray alloc] initWithObjects:@"Brandy", @"Dark Rum", @"Gin", @"Jagermeister", @"Just A", @"Southern Comfort", @"Vodka", @"Whisky", @"White Rum", nil];
	mixers = [[NSArray alloc] initWithObjects:@"Coke", @"Cranberry Juice", @"Diet Coke", @"Ice", @"Lemonade", @"Mango Juice", @"Orange Juice", @"Pineapple Juice", @"Red Bull", @"Tonic", nil];
	
	CGSize size = CGSizeMake(480, [self.spiritsView frame].size.height);
	
	self.spiritsView.contentSize = CGSizeMake((size.width * spirits.count), [self.spiritsView frame].size.height);
	self.mixerView.contentSize = CGSizeMake((size.width * mixers.count), [self.mixerView frame].size.height);
	
	int i = 0;
    
    UIFont *font = [UIFont fontWithName:@"Raleway-Thin" size:47.36];
	
	for(NSString *name in spirits){
		
		CGRect frame;
        frame.origin.x = i * size.width;
        frame.origin.y = 0;
        frame.size = size;
		
		UIView *spiritview = [[UIView alloc] initWithFrame:frame];
        [spiritview setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];

		UITextView *title = [[UITextView alloc] initWithFrame:frame];
        [title setFrame:CGRectMake(0, 50, frame.size.width, frame.size.height)];
		title.editable = NO;
        [title setTextColor:[UIColor colorWithWhite:1 alpha:1]];
		[title setText:name];
        [title setFont:font];
		title.textAlignment = UITextAlignmentCenter;
        
        [title setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
		[spiritview addSubview:title];
		
		[self.spiritsView addSubview:spiritview];
		
		[spiritview release];
		[title release];
		
		i++;
	}
	
	i = 0;
	
	for(NSString *name in mixers){
		
		CGRect frame;
        frame.origin.x = i * size.width;
        frame.origin.y = 0;
        frame.size = size;
		
		UIView *mixerview = [[UIView alloc] initWithFrame:frame];
        [mixerview setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
		
		UITextView *title = [[UITextView alloc] initWithFrame:frame];
        [title setFrame:CGRectMake(0, 50, frame.size.width, frame.size.height)];
		title.editable = NO;
        [title setTextColor:[UIColor colorWithWhite:1 alpha:1]];
		[title setText:name];
        [title setFont:font];
		title.textAlignment = UITextAlignmentCenter;
        [title setBackgroundColor:[UIColor colorWithWhite:0 alpha:0]];
		[mixerview addSubview:title];
		
		[self.mixerView addSubview:mixerview];
		
		[mixerview release];
		[title release];
		
		i++;
		
	}
	
	[self.spiritsView setDelegate:self];
	[self.mixerView setDelegate:self];
	
	[self.view addSubview:self.spiritsView];
	[self.view addSubview:self.mixerView];
	
    UIImage *image = [UIImage imageNamed:@"and"];
    self.andView = [[UIImageView alloc] initWithImage:image];
    
    [self.andView setCenter:CGPointMake((self.view.frame.size.height / 2), (self.view.frame.size.width / 2))];
    
    [self.view addSubview:self.andView];
    
    [self.view bringSubviewToFront:_information];
    
    [super viewDidLoad];
	
	[self randomise];
	
}

- (void) hideAmphersand {
	[UIView beginAnimations:@"fade" context:nil];
	self.andView.alpha = 0;
	[UIView commitAnimations];
}

- (void) showAmphersand {
	[UIView beginAnimations:@"fade" context:nil];
	self.andView.alpha = 1;
	[UIView commitAnimations];
}

- (void) showHideArrowsForView:(UIScrollView *) scrollView withIndex :(int)index {
	if(scrollView.tag == FRMIXERSCROLLVIEW){
		if(index >= ([mixers count] - 1)){
			// Hide the more than icon
		} else if (index == 0){
			// Hide the less then icon
		} else {
			// Show both icons
		}
	} else if (scrollView.tag == FRSPIRITSSCROLLVIEW) {
		if(index > [spirits count]){
			// Hide the more than icon
		} else if (index == 0){
			// Hide the less than icon
		} else {
			// Show both icons
		}
	}
}

- (void) didFinishScrolling:(UIScrollView *) scrollView {
		
	int index = (scrollView.contentOffset.x / scrollView.frame.size.width);
	
	[self showHideArrowsForView:scrollView withIndex:index];
	
	switch (scrollView.tag) {
		case FRSPIRITSSCROLLVIEW: {
			if(index == 4){
				[self hideAmphersand];
			} else {
				[self showAmphersand];
			}
			break;
		}
		case FRMIXERSCROLLVIEW: {
			
			break;
		}
	}
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	[self didFinishScrolling:scrollView];
}

- (void) scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	[self didFinishScrolling:scrollView];	
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void) viewDidAppear:(BOOL)animated {
	[self becomeFirstResponder];
	[super viewDidAppear:animated];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {

}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	
}

- (void) randomise {
	
	int d = random() % [spirits count];

	CGRect frame = self.spiritsView.frame;
	frame.origin.x = frame.size.width * d;
	frame.origin.y = 0;
	[self.spiritsView scrollRectToVisible:frame animated:YES];

	d = random() % [mixers count];

	frame = self.mixerView.frame;
	frame.origin.x = frame.size.width * d;
	frame.origin.y = 0;
	[self.mixerView scrollRectToVisible:frame animated:YES];

}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(motion == UIEventSubtypeMotionShake){
        [self randomise];
    }
}

- (BOOL) canBecomeFirstResponder {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
	[self setAndView:nil];
    [self setSpiritsView:nil];
	[self setMixerView:nil];
    [self setInformation:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
	[_andView release];
	[_managedObjectContext release];
    [_spiritsView release];
	[_mixerView release];
    [_information release];
    [super dealloc];
}

@end
