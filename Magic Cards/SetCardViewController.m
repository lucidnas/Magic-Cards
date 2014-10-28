//
//  SetCardViewController.m
//  Magic Cards
//
//  Created by User on 10/9/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import "SetCardViewController.h"
#import "SetDeck.h"
#import "SetCard.h"
#import "CardMatchingGame.h"
#import "HistoryViewController.h"

@interface SetCardViewController ()

@property (nonatomic)  NSMutableAttributedString *symbol;

@end

@implementation SetCardViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"history"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *hvc = segue.destinationViewController;
            hvc.textToAnalyze = self.buttonAttribute;
        }
    }
}


-(NSMutableAttributedString *)symbol{
    if (!_symbol) _symbol = [[NSMutableAttributedString alloc]initWithString:@""];
    
    return _symbol;
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        self.card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setBackgroundImage:[self backgroundImageForCard:self.card] forState:UIControlStateNormal];
        
//        self.symbol = [[NSAttributedString alloc]initWithAttributedString:[self titleForCard:self.card]];
        [cardButton setAttributedTitle:[self titleForCard:self.card] forState:UIControlStateNormal];
        
        //a card is enabled only if it is NOT matched
        cardButton.enabled = !self.card.isMatched;
        
        // self.statusField.attributedText = cardButton.currentAttributedTitle;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        }
    

        

}




-(SetDeck *)createDeck
{
    return [[SetDeck alloc] init];
}

- (UIImage *)backgroundImageForCard:(SetCard *)setCard
{
    return [UIImage imageNamed:setCard.chosen ? @"setCardSelected" : @"setCard"];
}

- (NSMutableAttributedString *)titleForCard:(SetCard *)setCard
{
    
    if (setCard)
    {
        self.symbol = [self SetSymbolsOfCard:setCard];
        [self setColorAndShadingOfCard:setCard ourSymbol:self.symbol];
        
        
        
    }
    
    return self.symbol;
}



-(void)setColorAndShadingOfCard:(SetCard *)setCard ourSymbol:(NSMutableAttributedString *)sym
{
    UIColor *foregroundColor;
    UIColor *strokeColor;
    
    if ([setCard.color isEqualToString:@"red"])
    {
        foregroundColor = [UIColor redColor];
        [sym setAttributes:@{NSForegroundColorAttributeName:foregroundColor}  range:NSMakeRange(0, [sym length])];
        strokeColor = [foregroundColor copy];
    }
    
    if ([setCard.color isEqualToString:@"green"])
    {
        foregroundColor = [UIColor greenColor];
        [sym setAttributes:@{NSForegroundColorAttributeName:foregroundColor}  range:NSMakeRange(0, [sym length])];
        strokeColor = [foregroundColor copy];
    }
    
    
    if ([setCard.color isEqualToString:@"blue"])
    {
        foregroundColor = [UIColor blueColor];
        [sym setAttributes:@{NSForegroundColorAttributeName:foregroundColor}  range:NSMakeRange(0, [sym length])];
        strokeColor = [foregroundColor copy];
    }


    if ([setCard.shade isEqualToString:@"solid"])
    {
        foregroundColor = [foregroundColor colorWithAlphaComponent:1];
        [sym setAttributes:@{NSForegroundColorAttributeName:foregroundColor,
                                NSStrokeWidthAttributeName:@-5,
                                NSStrokeColorAttributeName:strokeColor}
                        range:NSMakeRange(0, [sym length])];
    }
    
    if ([setCard.shade isEqualToString:@"shaded"])
        
    {
        foregroundColor = [foregroundColor colorWithAlphaComponent:0.2];
        
        [sym setAttributes:@{NSForegroundColorAttributeName:foregroundColor,
                                NSStrokeWidthAttributeName:@-5,
                                NSStrokeColorAttributeName:strokeColor}
                        range:NSMakeRange(0, [sym length])];
    }
    
    
    if ([setCard.shade isEqualToString:@"outlined"])
    {
        
        foregroundColor = [foregroundColor colorWithAlphaComponent:0];
        
        [sym setAttributes:@{NSForegroundColorAttributeName:foregroundColor,
                                NSStrokeWidthAttributeName:@-5,
                                NSStrokeColorAttributeName:strokeColor}
                        range:NSMakeRange(0, [sym length])];
    }
}


- (NSMutableAttributedString *)SetSymbolsOfCard:(SetCard *)setCard
{
    NSMutableAttributedString *symbol= [[NSMutableAttributedString alloc]initWithString:@""];
    
    NSString *shapes = @"";
    
    if (setCard)
    {
        for (int i = 1; i <= setCard.number; i++)
        {
            shapes = [shapes stringByAppendingString:setCard.symbol];
        }
        symbol = [[NSMutableAttributedString alloc]initWithString:shapes];
    }
    
    return symbol;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
}


@end
