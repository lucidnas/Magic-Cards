//
//  CardMatchingGame.m
//  homework1
//
//  Created by nasbone on 9/19/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

//readwrite used only when a readonly public property is redeclared to be readwrite property privately (has both a getter and a setter)
//also, strong is default
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic,strong) Card *card;
//@property (nonatomic) NSAttributedString status;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
//@property (nonatomic, strong) NSArray *lastChosenCards;
@end

@implementation CardMatchingGame

//Arbitrary point system for cards matched, missed, or chosen
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 5;
static const int COST_TO_CHOOSE = 1;

//this is an array that stores the cards from the deck.
-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

//our designated initializer that initialises the whole game random deck using the number of cardbuttons used in the viewcontroller
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    
    
    if (self)
    {
        for (int i=0; i<count; i++)
        {
            Card *card = [deck drawRandomCard];
            if(card)
            {
                [self.cards addObject:card];
            } else
            {
                self = nil;
                
            }
        }
        
    }
    
    return self;
    
}

- (NSUInteger)switchMatch
{
    Card *card = [self.cards firstObject];
    if (_switchMatch < card.switchLevel) {
        _switchMatch = card.switchLevel;
    }
    return _switchMatch;
}



//This is the brain of the game. It receives an index of a card from the array of buttons in the view controller through the touchButton method. This index tells us the card that was picked from the deck.
-(void)chooseCardAtIndex:(NSUInteger)index
{
    
    //the card is then saved in the variable 'card'
    self.card  = [self cardAtIndex:index];
    
    //the content of card is then stored in a string variable 'status'. This is then called by the statuslabel in the view controller to display the current card picked
    self.status = [NSString stringWithFormat:@"You picked %@. %d point penalty!", self.card.contents, COST_TO_CHOOSE];

    
    
    // -- Game logic begins here --
    // This checks to see which card is not disabled
    if (!self.card.isMatched)
    {
        // if the card is open, close it. so basically this allows for an unmatched card to flip back and forth.
        if (self.card.isChosen)
        {
            self.card.chosen = NO;
            [self.status stringByAppendingFormat:@"\n You picked nothing. Pick a card to match"];
        }
        
        //else if it is closed, open it and match it with other cards
        else
        {
            
            
            //here we create an array to store any number of open unmatched cards that are eligible for matching
            NSMutableArray* cardsToMatch = [[NSMutableArray alloc] init];
            self.lastChosenCards = [cardsToMatch copy];
            //we check to see if there are othercards in the NSMutableArray that are open and not matched
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isChosen && !otherCard.isMatched)
                {
                    //we store them in the array we created above
                    [cardsToMatch addObject: otherCard];
                }
            }
                //checks to see if a switch command is issued from the view controller. This determines if the player is matching 2, 3 cards or more.
                if ([cardsToMatch count] == self.switchMatch - 1)
                {
                    
                    //matches the card picked by the player with the othercards we stored in the array cardsToMatch using the match method from the class "PlayingCard"
                    int matchScore = [self.card match:cardsToMatch];
                    NSInteger savedScore = matchScore;

                    
                    //if there is a match, a score will be returned and a message will be sent to the status label
                    //the matched cards will then be disabled
                    if(matchScore)
                    {
                        self.score += matchScore * MATCH_BONUS;
                        
                        self.card.matched = YES;
                        NSString *matchedCards = [NSString stringWithFormat:@"Matched"];
                        
                        //appends all cards that are matched to matched card string
                        for(Card* card in cardsToMatch)
                        {
                            card.matched = YES;
                            matchedCards = [matchedCards stringByAppendingFormat:@" %@ &", card.contents];
                            
        
                        }
                        
                        matchedCards =[matchedCards stringByAppendingFormat:@" %@", self.card.contents];

                        
                        matchedCards = [matchedCards stringByAppendingFormat:@". %d point Match Bonus!", savedScore];
                        [self.status stringByAppendingFormat:@"\n %@",matchedCards];
                    }
                    // if they dont match. all the cards chosen to be matched will close
                    else
                    {
                        self.score -= MISMATCH_PENALTY;
                        NSString *notMatchedCards = @"";
                        
                        //flips back other cards that dont match and displays the point penalty
                        for(Card* card in cardsToMatch)
                        {
                            card.chosen = NO;
                            
                            notMatchedCards = [notMatchedCards stringByAppendingFormat:@"%@ & ", card.contents];
                        }
                        
                        notMatchedCards =[notMatchedCards stringByAppendingFormat:@"%@", self.card.contents];
                        notMatchedCards = [notMatchedCards stringByAppendingFormat:@" did not match. %d point penalty!", MISMATCH_PENALTY];
                        
                        
                        [self.status stringByAppendingFormat:@"\n %@",notMatchedCards];
                    }
                }
                        self.score -= COST_TO_CHOOSE;
                        self.card.chosen = YES;

            }
        }

            
                
}
           
 

//checks if index is valid and returns a card if true
-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}
@end
