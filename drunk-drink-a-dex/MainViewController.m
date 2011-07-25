//
//  MainViewController.m
//  drunk-drink-a-dex
//
//  Created by Gavin Williams on 22/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize spiritsView = _spiritsView;
@synthesize mixerView = _mixerView;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	// Set up the views
	self.spiritsView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, (self.view.frame.size.width / 2))];
	self.spiritsView.showsVerticalScrollIndicator = NO;
	self.spiritsView.bounces = YES;
	self.spiritsView.pagingEnabled = YES;
	self.spiritsView.scrollEnabled = YES;
	self.spiritsView.alwaysBounceHorizontal = YES;
	
	self.mixerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.width / 2), self.view.frame.size.height, (self.view.frame.size.width / 2))];
	self.mixerView.showsVerticalScrollIndicator = NO;
	self.mixerView.bounces = YES;
	self.mixerView.pagingEnabled = YES;
	self.mixerView.scrollEnabled = YES;
	self.mixerView.alwaysBounceHorizontal = YES;
	
	spirits = [[NSArray alloc] initWithObjects:@"Vodka", @"Brandy", @"Whisky", @"Southern Comfort", @"Gin", @"White Rum", @"Dark Rum", nil];
	
	mixers = [[NSArray alloc] initWithObjects:@"Coke", @"Diet Coke", @"Lemonade", @"Diet Lemonade", @"Orange Juice", @"Milk", @"Cranberry Juice", @"Pineapple Juice", nil];
	
	CGSize size = CGSizeMake(480, [self.spiritsView frame].size.height);
	
	self.spiritsView.contentSize = CGSizeMake((size.width * spirits.count), [self.spiritsView frame].size.height);
	self.mixerView.contentSize = CGSizeMake((size.width * mixers.count), [self.mixerView frame].size.height);
	
	int i = 0;
	
	for(NSString *name in spirits){
		
		CGRect frame;
        frame.origin.x = i * (size.width / 2);
        frame.origin.y = 0;
        frame.size = size;
		
		UIView *spiritview = [[UIView alloc] initWithFrame:frame];

		UITextView *title = [[UITextView alloc] initWithFrame:frame];
		title.editable = NO;
		[title setText:name];
		title.textAlignment = UITextAlignmentCenter;
		[spiritview addSubview:title];
		
		[self.spiritsView addSubview:spiritview];
		
		[spiritview release];
		[title release];
		
		i++;
	}
	
	i = 0;
	
	for(NSString *name in mixers){
		
		CGRect frame;
        frame.origin.x = i * (size.width / 2);
        frame.origin.y = 0;
        frame.size = size;
		
		UIView *mixerview = [[UIView alloc] initWithFrame:frame];
		
		UITextView *title = [[UITextView alloc] initWithFrame:frame];
		title.editable = NO;
		[title setText:name];
		title.textAlignment = UITextAlignmentCenter;
		[mixerview addSubview:title];
		
		[self.mixerView addSubview:mixerview];
		
		[mixerview release];
		[title release];
		
		i++;
		
	}
	
	
	
	[self.view addSubview:self.spiritsView];
	[self.view addSubview:self.mixerView];
	
    [super viewDidLoad];
}

 
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
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
    [self setSpiritsView:nil];
	[self setMixerView:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
	[_managedObjectContext release];
    [_spiritsView release];
	[_mixerView release];
    [super dealloc];
}

@end
