//
//  PlayingCardViewController.m
//  Magic Cards
//
//  Created by User on 10/9/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"
#import "HistoryViewController.h"
@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

-(PlayingCardDeck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"history"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *hvc = segue.destinationViewController;
            
            
            hvc.display = self.statusField.attributedText;
        }
    }
}


-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        self.card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setBackgroundImage:[self backgroundImageForCard:self.card] forState:UIControlStateNormal];
        
//        self.symbol = [[NSAttributedString alloc]initWithAttributedString:[self titleForCard:self.card]];
        
        
        [cardButton setAttributedTitle:[self titleForCard:self.card] forState:UIControlStateNormal];
        
        //a card is enabled only if it is NOT matched
        cardButton.enabled = !self.card.isMatched;
        
        // self.statusField.attributedText = cardButton.currentAttributedTitle;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        
        
        
        // NSLog(@"haha %@", cardButton.currentTitle);
        
        
    }
    
}


@end
