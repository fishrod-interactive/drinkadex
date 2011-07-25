//
//  MainViewController.h
//  drunk-drink-a-dex
//
//  Created by Gavin Williams on 22/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIScrollViewDelegate> {
	UIScrollView *_spiritsView;
	UIScrollView *_mixerView;
    UIButton *_information;
	UIImageView *_andView;
	
	NSArray *spirits;
	NSArray *mixers;
}


- (IBAction)showInfo:(id)sender;
- (void) didFinishScrolling:(UIScrollView *)view;
- (void) randomise;
- (void) hideAmphersand;
- (void) showAmphersand;
- (void) showHideArrowsForView:(UIScrollView *) scrollView withIndex:(int) index;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) IBOutlet UIScrollView *spiritsView;
@property (nonatomic, retain) IBOutlet UIScrollView *mixerView;
@property (nonatomic, retain) IBOutlet UIButton *information;
@property (nonatomic, retain) IBOutlet UIImageView *andView;

@end