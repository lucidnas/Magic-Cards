//
//  Card.h
//  homework1
//
//  Created by Abdulnasir Mohammed on 9/11/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

@import Foundation;


@interface Card : NSObject

//@property declares setter and getter
//"strong": keeps object that a particular property points to in memory until its set to nil
//'atomic': property access thread-safe
//'getter = isChosen': changes getter name likewise for setter

@property (strong,nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;
@property (nonatomic) NSUInteger switchLevel;


- (int)match:(NSArray *)otherCards;
@end
