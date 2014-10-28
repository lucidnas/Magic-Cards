//
//  SetCard.h
//  Magic Cards
//
//  Created by nasbone on 10/11/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface SetCard : Card


@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *shade;
@property (nonatomic) NSUInteger number;

@property (nonatomic) NSInteger switchMatch;
+ (NSArray *)Colors;
+ (NSArray *)Symbols;
+ (NSArray *)Shades;


@end
