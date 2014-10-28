//
//  SetCard.m
//  Magic Cards
//
//  Created by nasbone on 10/11/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import "SetCard.h"


@implementation SetCard



//- (instancetype)init
//{
//    self = [super init];
//    
//    if (self) {
//        self.switchLevel = 3;
//    }
//    
//    return self;
//}


+ (NSArray *)Symbols
{
    return @[@"■", @"▲", @"●"];
}

+ (NSArray *)Colors
{
    return @[@"red", @"green", @"blue"];
}


+ (NSArray *)Shades
{
    return @[@"solid", @"outlined", @"shaded"];
}




- (NSString *)contents
{
    return [NSString stringWithFormat:@"%@ - %@ - %@ - %lu", self.symbol, self.color, self.shade, (unsigned long)self.number];
}



- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    
    if (otherCards)
    {
        if([self sameColor:otherCards] && [self sameShade:otherCards] && [self sameSymbol:otherCards] && [self sameNumber:otherCards])
        
            score = 10;
    }
    
    
    
    
    
    return score;


}


-(Boolean)sameColor:(NSArray *)otherCards
{
    SetCard *firstCard = [otherCards firstObject];
    SetCard *secondCard = [otherCards lastObject];
    
    
                if (([self.color isEqualToString:firstCard.color]
                     && [firstCard.color isEqualToString:secondCard.color])
                    || (![self.color isEqualToString:firstCard.color]
                        && ![firstCard.color isEqualToString:secondCard.color]
                        && ![self.color isEqualToString:secondCard.color]))
                    return YES;
                else
                    return NO;
}

-(Boolean)sameSymbol:(NSArray *)otherCards
{
    SetCard *firstCard = [otherCards firstObject];
    SetCard *secondCard = [otherCards lastObject];
    
    
    if (([self.symbol isEqualToString:firstCard.symbol]
         && [firstCard.symbol isEqualToString:secondCard.symbol])
        || (![self.symbol isEqualToString:firstCard.symbol]
            && ![firstCard.symbol isEqualToString:secondCard.symbol]
            && ![self.symbol isEqualToString:secondCard.symbol]))
        return YES;
    else
        return NO;
}

-(Boolean)sameNumber:(NSArray *)otherCards
{
    SetCard *firstCard = [otherCards firstObject];
    SetCard *secondCard = [otherCards lastObject];
    
    
    if ((self.number == firstCard.number
         && firstCard.number == secondCard.number)
        || (self.number != firstCard.number
            && firstCard.number != secondCard.number
            && self.number != secondCard.number))
        return YES;
    else
        return NO;
}

-(Boolean)sameShade:(NSArray *)otherCards
{
    SetCard *firstCard = [otherCards firstObject];
    SetCard *secondCard = [otherCards lastObject];
    
    
    if (([self.shade isEqualToString:firstCard.shade]
         && [firstCard.shade isEqualToString:secondCard.shade])
        || (![self.shade isEqualToString: firstCard.shade]
            && ![firstCard.shade isEqualToString:secondCard.shade]
            && ![self.shade isEqualToString:secondCard.shade]))
        return YES;
    else
        return NO;
}








@end
