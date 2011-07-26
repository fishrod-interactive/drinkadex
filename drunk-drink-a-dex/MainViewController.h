//
//  MainViewController.h
//  drunk-drink-a-dex
//
//  Created by Gavin Williams on 22/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"
#import <CoreData/CoreData.h>
#import <AVFoundation/AVFoundation.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIScrollViewDelegate, AVAudioPlayerDelegate> {
	UIScrollView *_spiritsView;
	UIScrollView *_mixerView;
    UIButton *_information;
	UIImageView *_andView;
    
    UIImageView *_leftTopView;
    UIImageView *_leftBottomView;
    UIImageView *_rightTopView;
    UIImageView *_rightBottomView;
	
    int shakes;
    int maxshakes;
    
    AVAudioPlayer *player;
    
	NSArray *spirits;
	NSArray *mixers;
}


- (IBAction)showInfo:(id)sender;
- (void) didFinishScrolling:(UIScrollView *)view;
- (void) randomise;
- (void) hideAmphersand;
- (void) showAmphersand;
- (void) showHideArrowsForView:(UIScrollView *) scrollView withIndex:(int) index;
- (void) playSong;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) IBOutlet UIScrollView *spiritsView;
@property (nonatomic, retain) IBOutlet UIScrollView *mixerView;
@property (nonatomic, retain) IBOutlet UIButton *information;
@property (nonatomic, retain) IBOutlet UIImageView *andView;
@property (nonatomic, retain) IBOutlet UIImageView *leftTopView;
@property (nonatomic, retain) IBOutlet UIImageView *leftBottomView;
@property (nonatomic, retain) IBOutlet UIImageView *rightTopView;
@property (nonatomic, retain) IBOutlet UIImageView *rightBottomView;

@end