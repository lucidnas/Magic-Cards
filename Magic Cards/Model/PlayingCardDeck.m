//
//  PlayingCardDeck.m
//  homework1
//
//  Created by Abdulnasir Mohammed on 9/12/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

//overrides init
- (instancetype)init
{
    
    self = [super init];
    
    if(self)
    {
        for (NSString *suit in [PlayingCard validSuits])
        {
        
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++)
            {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
