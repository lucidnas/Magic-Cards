//
//  PlayingCard.h
//  homework1
//
//  Created by Abdulnasir Mohammed on 9/12/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//We dont redeclare overriden methods in subclasses
#import "Card.h"

@import Foundation;


@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
