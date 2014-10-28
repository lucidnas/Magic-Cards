//
//  SetDeck.m
//  Magic Cards
//
//  Created by nasbone on 10/11/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"


@implementation SetDeck


- (instancetype)init
{
    
    self = [super init];
    
    if (self) {
        for (NSString *color in [SetCard Colors]) {
            for (NSString *symbol in [SetCard Symbols]) {
                for (NSString *shade in [SetCard Shades]) {
                    for (NSUInteger number = 1; number <= 3; number++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.color = color;
                        card.symbol = symbol;
                        card.shade = shade;
                        card.number = number;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    
    return self;
}


@end
