//
//  CardMatchingGame.h
//  homework1
//
//  Created by nasbone on 9/19/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"    
#import "Card.h"

@interface CardMatchingGame : NSObject


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
@property (nonatomic, strong) NSArray *lastChosenCards;
-(void)chooseCardAtIndex:(NSUInteger)index;
@property (nonatomic) NSString *status;
@property (nonatomic) NSUInteger switchMatch;
@property (nonatomic, readwrite) NSInteger lastScore;


-(Card *)cardAtIndex:(NSUInteger)index;
@property (nonatomic, readonly) NSInteger score;

@end
