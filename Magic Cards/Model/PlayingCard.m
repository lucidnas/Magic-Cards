//
//  PlayingCard.m
//  homework1
//
//  Created by Abdulnasir Mohammed on 9/12/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

//this overrides Card classes match method
-(int)match:(NSArray *)otherCards
{
    //this was created so as to remove objects from array
    NSMutableArray *moreCards = [otherCards mutableCopy];

    int score = 0;
    
    
    //matches all cards provided
    if ([moreCards count])
    {
            for (PlayingCard *card in moreCards)
            {
                //all cards must match one way or the other
                
                if(card.rank == self.rank) score = 5;
                else if ([card.suit isEqualToString: self.suit]) score = 1;
              
                //else return score = 0;
            }
    }
    
//    [moreCards addObject:self];
//   if([moreCards count] > 1)
//    {
//        PlayingCard *anothercard = [moreCards lastObject];
//        
//        [moreCards removeLastObject];
//        
//        score = [anothercard match:moreCards];
//    }

        return score;
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}



//class method
+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}
//class method
+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {return [[self rankStrings] count]-1;}

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

//we synthesize suit because we implemented both setter and getter
@synthesize suit = _suit;

//overrides suit getter
- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

//overrides suit setter
- (void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject: suit])
    {
        _suit = suit;
    }
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.switchLevel = 2;
    }
    
    return self;
}

@end
