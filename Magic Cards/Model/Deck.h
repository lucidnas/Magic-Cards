//
//  Deck.h
//  homework1
//
//  Created by Abdulnasir Mohammed on 9/12/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//



@import Foundation;
#import "Card.h"
#import "PlayingCard.h"



@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
