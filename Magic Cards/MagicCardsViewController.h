//
//  MagicCardsViewController.h
//  Magic Cards
//
//  Created by nasbone on 9/25/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

//Abstract class

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"
@interface MagicCardsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic,strong) Card *card;
//abstract method must define in subclass
-(Deck *)createDeck;
@property (nonatomic, strong) CardMatchingGame *game;

@property (nonatomic, strong) NSAttributedString *buttonAttribute;
- (NSAttributedString *)titleForCard:(Card *)card;
- (UIImage *)backgroundImageForCard:(Card *)card;
- (void)updateUI;
//@property (weak, readwrite) IBOutlet UITextField *statusField;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, readonly) IBOutlet UITextField *statusField;

@end
