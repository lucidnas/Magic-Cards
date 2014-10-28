//
//  HistoryViewController.h
//  Magic Cards
//
//  Created by User on 10/21/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardViewController.h"
#import "SetCardViewController.h"
#import "MagicCardsViewController.h"


@interface HistoryViewController : MagicCardsViewController

@property (nonatomic, strong) NSAttributedString *textToAnalyze;
@property (weak, nonatomic) IBOutlet UITextView *displayGameProcess;
@property(nonatomic) NSAttributedString* display;
@property (weak, nonatomic) IBOutlet UILabel *disp;
@end
