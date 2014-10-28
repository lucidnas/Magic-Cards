//
//  Deck.m
//  homework1
//
//  Created by Abdulnasir Mohammed on 9/12/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import "Deck.h"
#import "PlayingCard.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; //of Card
@end

@implementation Deck

- (int)countOfCards
{
    return [self.cards count];
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
    
    
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop)
    {
        [self.cards insertObject:card atIndex:0];
    } else
    {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card
{
    
    [self addCard:card atTop:NO];
}


- (Card *)drawRandomCard
{
   
    Card *randomCard = nil;
    
    //creates a random card by grabbing a random spot from our self.cards array
    if ([self.cards count])
    {
        unsigned index = arc4random() % [self.cards count];
                randomCard = self.cards[index];
                [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}


@end
