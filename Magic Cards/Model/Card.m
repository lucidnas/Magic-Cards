//
//  Card.m
//  homework1
//
//  Created by Abdulnasir Mohammed on 9/11/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//This class matches cards based on only their contents

#import "Card.h"


@interface Card()
@end

@implementation Card

////setters and getters are automatically synthesized
//@synthesize contents = _contents;
//@synthesize chosen = _chosen;
//@synthesize matched = _matched;


- (NSUInteger)switchLevel
{
    if (!_switchLevel) _switchLevel = 3;
    return _switchLevel;
}


- (int)match:(NSArray *)otherCards
{

    return 0;
}




@end