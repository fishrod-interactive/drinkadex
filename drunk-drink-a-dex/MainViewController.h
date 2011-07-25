//
//  MainViewController.h
//  drunk-drink-a-dex
//
//  Created by Gavin Williams on 22/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	UIScrollView *_spiritsView;
	UIScrollView *_mixerView;
    UIButton *_information;
	
	NSArray *spirits;
	NSArray *mixers;
}


- (IBAction)showInfo:(id)sender;
- (void) randomise;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) IBOutlet UIScrollView *spiritsView;
@property (nonatomic, retain) IBOutlet UIScrollView *mixerView;
@property (nonatomic, retain) IBOutlet UIButton *information;

@end